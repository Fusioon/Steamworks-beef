using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	static
	{
		internal static mixin CheckResult(bool b)
		{
			if(!b)
				return false;
		}
	}

	class SteamAPI
	{
		public static bool Init()
		{
			if(!SteamAPI_Init())
				return false;

			CallbackDispatcher.Init();

			CheckResult!(SteamFriends.Init());

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

		public static bool IsSteamRunning() {
			return SteamAPI_IsSteamRunning();
		}

		public static HSteamPipe GetHSteamPipe() {
			return SteamAPI_GetHSteamPipe();
		}

		public static HSteamUser GetHSteamUser() {
			return SteamAPI_GetHSteamUser();
		}

	}

	public static class GameServer
	{
		public static bool Init(uint32 unIP, uint16 usGamePort, uint16 usQueryPort, EServerMode eServerMode, StringView pchVersionString)
		{
			if(!SteamGameServer_Init(unIP, 0, usGamePort, usQueryPort, eServerMode, TerminateString!(pchVersionString)))
				return false;

			CallbackDispatcher.Init();
		}
	}
}
