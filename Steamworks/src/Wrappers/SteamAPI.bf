using System;
using Steamworks;
using Steamworks.Native;

using internal Steamworks;

namespace Steamworks
{
	static
	{
		internal static mixin CheckResult(bool b)
		{
			if (!b)
			{
				System.Diagnostics.Debug.Assert(false, Compiler.CallerExpression[0]);
				return false;
			}	
		}
	}

	class SteamAPI
	{
		public static bool Init()
		{
			if (!SteamAPI_Init())
				return false;

			CallbackDispatcher.Init();

			CheckResult!(SteamUser.APIInit_User());
			CheckResult!(SteamFriends.APIInit_User());
			CheckResult!(SteamUtils.APIInit_User());
			CheckResult!(SteamMatchmaking.APIInit_User());
			CheckResult!(SteamMatchmakingServers.APIInit_User());
			CheckResult!(SteamGameSearch.APIInit_User());
			CheckResult!(SteamParties.APIInit_User());
			CheckResult!(SteamRemoteStorage.APIInit_User());
			CheckResult!(SteamUserStats.APIInit_User());
			CheckResult!(SteamApps.APIInit_User());
			CheckResult!(SteamNetworking.APIInit_User());
			CheckResult!(SteamScreenshots.APIInit_User());
			CheckResult!(SteamMusic.APIInit_User());
			CheckResult!(SteamMusicRemote.APIInit_User());
			CheckResult!(SteamHTTP.APIInit_User());
			CheckResult!(SteamInput.APIInit_User());
			CheckResult!(SteamController.APIInit_User());
			CheckResult!(SteamUGC.APIInit_User());
			CheckResult!(SteamAppList.APIInit_User());
			CheckResult!(SteamHTMLSurface.APIInit_User());
			CheckResult!(SteamInventory.APIInit_User());
			CheckResult!(SteamVideo.APIInit_User());
			CheckResult!(SteamParentalSettings.APIInit_User());
			CheckResult!(SteamRemotePlay.APIInit_User());
			CheckResult!(SteamNetworkingMessages.APIInit_User());
			CheckResult!(SteamNetworkingSockets.APIInit_User());

			return true;
		}

		public static void Shutdown()
		{
			SteamAPI_Shutdown();
		}

		public static void RunCallbacks()
		{
			CallbackDispatcher.RunFrame(false);
		}

		public static bool RestartAppIfNecessary(AppId_t unOwnAppID)
		{
			return SteamAPI_RestartAppIfNecessary(unOwnAppID);
		}

		public static bool IsSteamRunning()
		{
			return SteamAPI_IsSteamRunning();
		}

		public static HSteamPipe GetHSteamPipe()
		{
			return SteamAPI_GetHSteamPipe();
		}

		public static HSteamUser GetHSteamUser()
		{
			return SteamAPI_GetHSteamUser();
		}

	}

	[Error("Not Implemented")]
	public static class GameServer
	{
		public static bool Init(uint32 unIP, uint16 usGamePort, uint16 usQueryPort, EServerMode eServerMode, StringView pchVersionString)
		{
			if (!SteamGameServer_Init(unIP, 0, usGamePort, usQueryPort, eServerMode, TerminateString!(pchVersionString)))
				return false;

			CallbackDispatcher.Init();

			CheckResult!(SteamUtils.APIInit_Server());
			CheckResult!(SteamApps.APIInit_Server());
			CheckResult!(SteamNetworking.APIInit_Server());
			CheckResult!(SteamHTTP.APIInit_Server());
			CheckResult!(SteamUGC.APIInit_Server());
			CheckResult!(SteamInventory.APIInit_Server());
			CheckResult!(SteamNetworkingMessages.APIInit_Server());
			CheckResult!(SteamNetworkingSockets.APIInit_Server());
			CheckResult!(SteamGameServer.APIInit_Server());
			CheckResult!(SteamGameServerStats.APIInit_Server());
			
			return true;
		}

		public static void Shutdown()
		{
			SteamGameServer_Shutdown();
		}

		public static void RunCallbacks()
		{
			CallbackDispatcher.RunFrame(true);
		}
	}
}
