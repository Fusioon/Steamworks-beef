#pragma warning disable 4204

using System;
using Steamworks;

using internal Steam;
namespace Steam
{
	[CRepr]
	struct SteamMatchmakingServerListResponseHandler
	{
		function void ServerRespondedFN(SelfOuter this, HServerListRequest hRequest, int32 iServer);
		function void ServerFailedToRespondFN(SelfOuter this, HServerListRequest hRequest, int32 iServer);
		function void RefreshCompleteFN(SelfOuter this, HServerListRequest hRequest, EMatchMakingServerResponse response);

		[CRepr]
		private struct VTable
		{
			ServerRespondedFN _ServerRespondedFN;
			ServerFailedToRespondFN _ServerFailedToRespondFN;
			RefreshCompleteFN _RefreshCompleteFN;
			internal this(ServerRespondedFN responded, ServerFailedToRespondFN fail, RefreshCompleteFN refresh)
			{
				_ServerRespondedFN = responded;
				_ServerFailedToRespondFN = fail;
				_RefreshCompleteFN = refresh;
			}
		}
		private static VTable _vtbl = .(=> ServerResponded, => ServerFailedToRespond, => RefreshComplete);

		void ServerResponded(HServerListRequest hRequest, int32 iServer)
		{
			_obj.ServerResponded(hRequest, iServer);
		}
		void ServerFailedToRespond(HServerListRequest hRequest, int32 iServer)
		{
			_obj.ServerFailedToRespond(hRequest, iServer);
		}
		void RefreshComplete(HServerListRequest hRequest, EMatchMakingServerResponse response)
		{
			_obj.RefreshComplete(hRequest, response);
		}

		VTable* _vtable = &_vtbl;
		ISteamMatchmakingServerListResponse _obj;

		public this(ISteamMatchmakingServerListResponse obj)
		{
			_obj = obj;
		}
	}

	[CRepr]
	struct SteamMatchmakingPingResponseHandler
	{
		public function void ServerRespondedFN(SelfOuter this, ref gameserveritem_t server);
		public function void ServerFailedToRespondFN(SelfOuter this);

		[CRepr]
		private struct VTable
		{
			ServerRespondedFN _ServerRespondedFN;
			ServerFailedToRespondFN _ServerFailedToRespondFN;
			internal this(ServerRespondedFN responded, ServerFailedToRespondFN failed)
			{
				_ServerRespondedFN = responded;
				_ServerFailedToRespondFN = failed;
			}
		}
		private static VTable _vtbl = .(=> ServerResponded, => ServerFailedToRespond);

		void ServerResponded(ref gameserveritem_t server)
		{
			_obj.ServerResponded(ref server);
		}

		void ServerFailedToRespond()
		{
			_obj.ServerFailedToRespond();
		}


		VTable* _vtable = &_vtbl;
		ISteamMatchmakingPingResponse _obj;

		public this(ISteamMatchmakingPingResponse obj)
		{
			_obj = obj;
		}
	}	

	[CRepr]
	struct SteamMatchmakingPlayersResponseHandler
	{
		function void AddPlayerToListFN(SelfOuter this, char8* pchName, int32 nScore, float flTimePlayed);
		function void PlayersFailedToRespondFN(SelfOuter this);
		function void PlayersRefreshCompleteFN(SelfOuter this);

		[CRepr]
		private struct VTable
		{
			AddPlayerToListFN _AddPlayerToListFN;
			PlayersFailedToRespondFN _PlayersFailedToRespondFN;
			PlayersRefreshCompleteFN _PlayersRefreshCompleteFN;
			internal this(AddPlayerToListFN add, PlayersFailedToRespondFN fail, PlayersRefreshCompleteFN refresh)
			{
				_AddPlayerToListFN = add;
				_PlayersFailedToRespondFN = fail;
				_PlayersRefreshCompleteFN = refresh;
			}
		}
		static VTable _vtbl = .(=> AddPlayerToList, => PlayersFailedToRespond, => PlayersRefreshComplete);

		void AddPlayerToList(char8* pchName, int32 nScore, float flTimePlayed)
		{
			_obj.AddPlayerToList(pchName, nScore, flTimePlayed);
		}

		void PlayersFailedToRespond()
		{
			_obj.PlayersRefreshComplete();
		}

		void PlayersRefreshComplete()
		{
			_obj.PlayersRefreshComplete();
		}

		VTable* _vtable = &_vtbl;
		ISteamMatchmakingPlayersResponse _obj;

		public this(ISteamMatchmakingPlayersResponse obj)
		{
			_obj = obj;
		}
	}

	[CRepr]
	struct SteamMatchmakingRulesResponseHandler
	{
		function void RulesRespondedFN(SelfOuter this, char8* pchRule, char8* pchValue);
		function void RulesFailedToRespondFN(SelfOuter this);
		function void RulesRefreshCompleteFN(SelfOuter this);

		[CRepr]
		private struct VTable
		{
			RulesRespondedFN _RulesRespondedFN;
			RulesFailedToRespondFN _RulesFailedToRespondFN;
			RulesRefreshCompleteFN _RulesRefreshCompleteFN;
			internal this(RulesRespondedFN responded, RulesFailedToRespondFN fail, RulesRefreshCompleteFN refresh)
			{
				_RulesRespondedFN = responded;
				_RulesFailedToRespondFN = fail;
				_RulesRefreshCompleteFN = refresh;
			}
		}
		static VTable _vtbl = .(=> RulesResponded, => RulesFailedToRespond, => RulesRefreshComplete);

		void RulesResponded(char8* pchRule, char8* pchValue)
		{
			_obj.RulesResponded(pchRule, pchValue);
		}

		void RulesFailedToRespond()
		{
			_obj.RulesFailedToRespond();
		}

		void RulesRefreshComplete()
		{
			_obj.RulesRefreshComplete();
		}

		VTable* _vtable = &_vtbl;
		ISteamMatchmakingRulesResponse _obj;

		public this(ISteamMatchmakingRulesResponse obj)
		{
			_obj = obj;
		}
	}

	public static class SteamMatchmakingServers
	{
		static ISteamMatchmakingServers _mmservers;
		internal static bool Init()
		{
			return (_mmservers = Accessors.SteamMatchmakingServers()) != 0;
		}

		public static HServerListRequest RequestInternetServerList(AppId_t iApp, Span<MatchMakingKeyValuePair_t*> ppchFilters, in SteamMatchmakingServerListResponseHandler pRequestServersResponse)
		{
			return _mmservers.RequestInternetServerList(iApp, ppchFilters.Ptr, (uint32)ppchFilters.Length, (void*)&pRequestServersResponse);
		}

		public static HServerListRequest RequestLANServerList(AppId_t iApp, in SteamMatchmakingServerListResponseHandler pRequestServersResponse)
		{
			return _mmservers.RequestLANServerList(iApp, (void*)&pRequestServersResponse);
		}

		public static HServerListRequest RequestFriendsServerList(AppId_t iApp, Span<MatchMakingKeyValuePair_t*> ppchFilters, in SteamMatchmakingServerListResponseHandler pRequestServersResponse)
		{
			return _mmservers.RequestFriendsServerList(iApp, ppchFilters.Ptr, (uint32)ppchFilters.Length, (void*)&pRequestServersResponse);
		}

		public static HServerListRequest RequestFavoritesServerList(AppId_t iApp, Span<MatchMakingKeyValuePair_t*> ppchFilters, uint32 nFilters, in SteamMatchmakingServerListResponseHandler pRequestServersResponse)
		{
			return _mmservers.RequestFriendsServerList(iApp, ppchFilters.Ptr, (uint32)ppchFilters.Length, (void*)&pRequestServersResponse);
		}

		public static HServerListRequest RequestHistoryServerList(AppId_t iApp, Span<MatchMakingKeyValuePair_t*> ppchFilters, in SteamMatchmakingServerListResponseHandler pRequestServersResponse)
		{
			return _mmservers.RequestFriendsServerList(iApp, ppchFilters.Ptr, (uint32)ppchFilters.Length, (void*)&pRequestServersResponse);
		}

		public static HServerListRequest RequestSpectatorServerList(AppId_t iApp, Span<MatchMakingKeyValuePair_t*> ppchFilters, in SteamMatchmakingServerListResponseHandler pRequestServersResponse)
		{
			return _mmservers.RequestFriendsServerList(iApp, ppchFilters.Ptr, (uint32)ppchFilters.Length, (void*)&pRequestServersResponse);
		}

		public static void ReleaseRequest(HServerListRequest hServerListRequest)
		{
			_mmservers.ReleaseRequest(hServerListRequest);
		}

		public static gameserveritem_t* GetServerDetails(HServerListRequest hRequest, int32 iServer)
		{
			return _mmservers.GetServerDetails(hRequest, iServer);
		}

		public static void CancelQuery(HServerListRequest hRequest)
		{
			_mmservers.CancelQuery(hRequest);
		}

		public static void RefreshQuery(HServerListRequest hRequest)
		{
			_mmservers.RefreshQuery(hRequest);
		}

		public static bool IsRefreshing(HServerListRequest hRequest)
		{
			return _mmservers.IsRefreshing(hRequest);
		}

		public static int32 GetServerCount(HServerListRequest hRequest)
		{
			return _mmservers.GetServerCount(hRequest);
		}

		public static void RefreshServer(HServerListRequest hRequest, int32 iServer)
		{
			_mmservers.RefreshServer(hRequest, iServer);
		}

		public static HServerQuery PingServer(uint32 unIP, uint16 usPort, in SteamMatchmakingPingResponseHandler pRequestServersResponse)
		{
			return _mmservers.PingServer(unIP, usPort, (void*)&pRequestServersResponse);
		}

		public static HServerQuery PlayerDetails(uint32 unIP, uint16 usPort, in SteamMatchmakingPlayersResponseHandler pRequestServersResponse)
		{
			return _mmservers.PlayerDetails(unIP, usPort, (void*)&pRequestServersResponse);
		}

		public static HServerQuery ServerRules(uint32 unIP, uint16 usPort, in SteamMatchmakingRulesResponseHandler pRequestServersResponse)
		{
			return _mmservers.ServerRules(unIP, usPort, (void*)&pRequestServersResponse);
		}

		public static void CancelServerQuery(HServerQuery hServerQuery)
		{
			_mmservers.CancelServerQuery(hServerQuery);
		}
	}
}
