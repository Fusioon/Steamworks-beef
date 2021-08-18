using System;
using Steamworks;
using Steamworks.Native;

using internal Steamworks;

namespace Steamworks
{
	static
	{
		internal static mixin CheckResult(bool b, String name)
		{
			if (!b)
			{
				System.Diagnostics.Debug.Assert(false, scope $"[SteamAPI] Failed to initialize '{name}'!");
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

			CheckResult!(SteamUser.APIInit_User(), "SteamUser");
			CheckResult!(SteamFriends.APIInit_User(), "SteamFriends");
			CheckResult!(SteamUtils.APIInit_User(), "SteamUtils");
			CheckResult!(SteamMatchmaking.APIInit_User(), "SteamMatchmaking");
			CheckResult!(SteamMatchmakingServers.APIInit_User(), "SteamMatchmakingServers");
			CheckResult!(SteamGameSearch.APIInit_User(), "SteamGameSearch");
			CheckResult!(SteamParties.APIInit_User(), "SteamParties");
			CheckResult!(SteamRemoteStorage.APIInit_User(), "SteamRemoteStorage");
			CheckResult!(SteamUserStats.APIInit_User(), "SteamUserStats");
			CheckResult!(SteamApps.APIInit_User(), "SteamApps");
			CheckResult!(SteamNetworking.APIInit_User(), "SteamNetworking");
			CheckResult!(SteamScreenshots.APIInit_User(), "SteamScreenshots");
			CheckResult!(SteamMusic.APIInit_User(), "SteamMusic");
			CheckResult!(SteamMusicRemote.APIInit_User(), "SteamMusicRemote");
			CheckResult!(SteamHTTP.APIInit_User(), "SteamHTTP");
			CheckResult!(SteamInput.APIInit_User(), "SteamInput");
			CheckResult!(SteamController.APIInit_User(), "SteamController");
			CheckResult!(SteamUGC.APIInit_User(), "SteamUGC");
			CheckResult!(SteamAppList.APIInit_User(), "SteamAppList");
			CheckResult!(SteamHTMLSurface.APIInit_User(), "SteamHTMLSurface");
			CheckResult!(SteamInventory.APIInit_User(), "SteamInventory");
			CheckResult!(SteamVideo.APIInit_User(), "SteamVideo");
			CheckResult!(SteamParentalSettings.APIInit_User(), "SteamParentalSettings");
			CheckResult!(SteamRemotePlay.APIInit_User(), "SteamRemotePlay");
			CheckResult!(SteamNetworkingMessages.APIInit_User(), "SteamNetworkingMessages");
			CheckResult!(SteamNetworkingSockets.APIInit_User(), "SteamNetworkingSockets");

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

			CheckResult!(SteamUtils.APIInit_Server(), "SteamUtils");
			CheckResult!(SteamApps.APIInit_Server(), "SteamApps");
			CheckResult!(SteamNetworking.APIInit_Server(), "SteamNetworking");
			CheckResult!(SteamHTTP.APIInit_Server(), "SteamHTTP");
			CheckResult!(SteamUGC.APIInit_Server(), "SteamUGC");
			CheckResult!(SteamInventory.APIInit_Server(), "SteamInventory");
			CheckResult!(SteamNetworkingMessages.APIInit_Server(), "SteamNetworkingMessages");
			CheckResult!(SteamNetworkingSockets.APIInit_Server(), "SteamNetworkingSockets");
			CheckResult!(SteamGameServer.APIInit_Server(), "SteamGameServer");
			CheckResult!(SteamGameServerStats.APIInit_Server(), "SteamGameServerStats");
			
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
