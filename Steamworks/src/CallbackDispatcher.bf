using System;
using System.Collections;
using System.Threading;
using Steamworks.Native;

using internal Steamworks;

namespace Steamworks
{
	[CRepr]
	struct CallbackMsg_t
	{
		public HSteamUser m_hSteamUser; 	// Specific user to whom this callback applies.
		public int32 m_iCallback; 			// Callback identifier.  (Corresponds to the k_iCallback enum in the callback structure.)
		public uint8 *m_pubParam; 			// Points to the callback structure
		public int32 m_cubParam; 			// Size of the data pointed to by m_pubParam
	}

	public interface ICallbackStruct
	{
		static int32 CallbackId { get; }
	} 

	abstract class Callback
	{
		public abstract bool IsGameServer { get; }
		public abstract void OnRunCallback(void* pvParam);
		public abstract void SetUnregistered();
	}

	public sealed class Callback<T> : Callback
		where T : ICallbackStruct
	{
		public delegate void DispatchDelegate(T param);
		private DispatchDelegate _func;

		private bool _isRegistered;
		private bool _gameServer;
		public override bool IsGameServer => _gameServer;

		public override void OnRunCallback(void* pvParam)
		{
			if(_func != null)
				_func(*(T*)pvParam);
		}

		public override void SetUnregistered()
		{
			_isRegistered = false;
		}

		public this(DispatchDelegate fn)
		{
			_func = fn;
			CallbackDispatcher.Register(this);
			_isRegistered = true;
		}

		public ~this()
		{
			CallbackDispatcher.Unregister(this);
			delete _func;
		}

		public void Register(DispatchDelegate fn)
		{
			if(fn == null)
				return;

			delete _func;
			_func = fn;

			if(!_isRegistered)
				CallbackDispatcher.Register(this);

			_isRegistered = true;
		}

		public void Unregister()
		{
			CallbackDispatcher.Unregister(this);
			_isRegistered = false;
		}
	}

	abstract class CallResult
	{
		public abstract void OnRunCallResult(void* pvParam, bool bFailed, SteamAPICall_t hSteamAPICall);
		public abstract void SetUnregistered();
	}

	public sealed class CallResult<T> : CallResult
	{
		public delegate void APIDispatchDelegate(T* param, bool bIOFailure);
		private APIDispatchDelegate _func;
		private SteamAPICall_t _hAPICall = k_uAPICallInvalid;

		public SteamAPICall_t Handle => _hAPICall;
		public bool Active => _hAPICall != k_uAPICallInvalid;

		public override void OnRunCallResult(void* pvParam, bool bFailed, SteamAPICall_t hSteamAPICall)
		{
			if(_hAPICall == hSteamAPICall && _func != null)
			{
				_func((T*)pvParam, bFailed);
			}
		}

		public override void SetUnregistered()
		{
			_hAPICall = k_uAPICallInvalid;
		}

		public this(APIDispatchDelegate fn)
		{
			_func = fn;
		}

		public ~this()
		{
			if(Active)
				CallbackDispatcher.Unregister(this);
			delete _func;
		}

		public void Cancel()
		{
			if(Active)
				CallbackDispatcher.Unregister(this);
		}

		public void Set(SteamAPICall_t hAPICall, APIDispatchDelegate fn)
		{
			if(fn != null)
			{
				delete _func;
				_func = fn;
			}
			if(Active)
				CallbackDispatcher.Unregister(this);

			_hAPICall = hAPICall;
			if(Active)
				CallbackDispatcher.Register(this);
		}
	}

	

	public static class CallbackDispatcher
	{
		static Dictionary<int32, List<Callback>> _clientCallbacks;
		static Dictionary<int32, List<Callback>> _serverCallbacks;
		static Dictionary<uint64, List<CallResult>> _callResults;

		static bool _initialized = false;
		static Monitor _monitor;

		public static void Init()
		{
			if (_initialized)
				return;

			_initialized = true;

			_clientCallbacks = new .();
			_serverCallbacks = new .();
			_callResults = new .();
			_monitor = new .();

			SteamAPI_ManualDispatch_Init();
		}

		static ~this()
		{
			if (_initialized)
			{
				for (let cb in _clientCallbacks)
					delete cb.value;
				for (let cb in _serverCallbacks)
					delete cb.value;
				for (let cb in _callResults)
					delete cb.value;

				delete _clientCallbacks;
				delete _serverCallbacks;
				delete _callResults;
				delete _monitor;
			}
		}

		public static void RunFrame(bool isGameServer)
		{
			CallbackMsg_t callbackMsg = ?;
			HSteamPipe hSteamPipe = (isGameServer ? SteamGameServer_GetHSteamPipe() : SteamAPI_GetHSteamPipe());
			var callbacksRegistry = isGameServer ? _serverCallbacks : _clientCallbacks;
			SteamAPI_ManualDispatch_RunFrame(hSteamPipe);
			while(SteamAPI_ManualDispatch_GetNextCallback(hSteamPipe, &callbackMsg))
			{
				CALLBACK_SCOPE:
				{
					if(callbackMsg.m_iCallback == SteamAPICallCompleted_t.CALLBACK_ID)
					{
						let callCompletedCb = (SteamAPICallCompleted_t*)callbackMsg.m_pubParam;
						uint8* callResultBuffer = scope:CALLBACK_SCOPE .[callCompletedCb.cubParam]*;
						bool failed = ?;
						if(SteamAPI_ManualDispatch_GetAPICallResult(hSteamPipe, callCompletedCb.hAsyncCall, callResultBuffer, (int32)callCompletedCb.cubParam, callCompletedCb.iCallback,  &failed))
						{
							if(_callResults.TryGetValue((uint64)callCompletedCb.hAsyncCall, let callResults))
							{
								using(_monitor.Enter())
								{
									for(let cr in callResults)
									{
										cr.OnRunCallResult(callResultBuffer, failed, callCompletedCb.hAsyncCall);
										cr.SetUnregistered();
									}
									callResults.Clear();
								}
							}
						}

					}
					else
					{
						if(callbacksRegistry.TryGetValue(callbackMsg.m_iCallback, let callbacks))
						{
							CALLBACKS:
							{
								Callback[] tmpCallbacks;
								using(_monitor.Enter())
								{
									tmpCallbacks = scope:CALLBACKS Callback[callbacks.Count];
									callbacks.CopyTo(tmpCallbacks);
								}
								for(let cb in tmpCallbacks)
								{
									cb.OnRunCallback(callbackMsg.m_pubParam);
								}
							}
						}
					}
					SteamAPI_ManualDispatch_FreeLastCallback(hSteamPipe);
				}
			}
		}

		internal static void Register<T>(Callback<T> cb) where T : ICallbackStruct
		{
			let callbackRegistry = cb.IsGameServer ? _serverCallbacks : _clientCallbacks;
			using(_monitor.Enter())
			{
				List<Callback> callbacks;
				if(!callbackRegistry.TryGetValue(T.CallbackId, out callbacks))
				{
					callbacks = callbackRegistry.Add(T.CallbackId, .. new List<Callback>());
				}
				callbacks.Add(cb);
			}
		}

		internal static void Register<T>(CallResult<T> cr) 
		{
			using(_monitor.Enter())
			{
				List<CallResult> callResults;
				if(!_callResults.TryGetValue((uint64)cr.Handle, out callResults))
				{
					callResults = _callResults.Add((uint64)cr.Handle, .. new List<CallResult>());
				}
				callResults.Add(cr);
			}
		}

		internal static void Unregister<T>(Callback<T> cb) where T : ICallbackStruct
		{
			let callbackRegistry = cb.IsGameServer ? _serverCallbacks : _clientCallbacks;
			using(_monitor.Enter())
			{
				if(callbackRegistry.TryGetValue(T.CallbackId, let callbacks))
				{
					callbacks.Remove(cb);
				}
			}
		}

		internal static void Unregister<T>(CallResult<T> cr) 
		{
			using(_monitor.Enter())
			{
				if(_callResults.TryGetValue((uint64)cr.Handle, let callResults))
				{
					callResults.Remove(cr);	
				}
			}
		}

	}
}
