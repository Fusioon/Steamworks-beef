using System;

namespace Steamworks
{
	public static
	{
		[CLink]
		public static extern ISteamClient SteamClient();

		[CLink]
		public static extern bool SteamAPI_IsSteamRunning();

		[CLink]
		public static extern bool SteamAPI_Init();
		[CLink]
		public static extern void SteamAPI_ReleaseCurrentThreadMemory();
		[CLink]
		public static extern bool SteamAPI_RestartAppIfNecessary(AppId_t unOwnAppID);
		[CLink]
		public static extern void SteamAPI_RunCallbacks();
		[CLink]
		public static extern void SteamAPI_Shutdown();

#if BF_PLATFORM_WINDOWS && BF_32_BIT
		[CLink]
		public static extern void SteamAPI_SetMiniDumpComment(char8* pchMsg);
		[CLink]
		public static extern void SteamAPI_WriteMiniDump(uint32 uStructuredExceptionCode, void* pvExceptionInfo, uint32 uBuildID);
#endif

		[CLink]
		public static extern bool SteamGameServer_Init(uint32 unIP, uint16 usSteamPort, uint16 usGamePort, uint16 usQueryPort, EServerMode eServerMode, char8* pchVersionString);
		[CLink]
		public static extern void SteamGameServer_Shutdown();
		[CLink]
		public static extern void SteamGameServer_RunCallbacks();
		[CLink]
		public static extern void SteamGameServer_ReleaseCurrentThreadMemory();
		[CLink]
		public static extern bool SteamGameServer_BSecure();
		[CLink]
		public static extern HSteamPipe SteamGameServer_GetHSteamPipe();
		[CLink]
		public static extern HSteamUser SteamGameServer_GetHSteamUser();
		[CLink]
		public static extern uint64 SteamGameServer_GetSteamID();

		[CLink]
		public static extern HSteamPipe SteamAPI_GetHSteamPipe();
		[CLink]
		public static extern HSteamUser SteamAPI_GetHSteamUser();
		[CLink]
		public static extern char8* SteamAPI_GetSteamInstallPath();
		[CLink]
		public static extern void SteamAPI_ManualDispatch_FreeLastCallback(HSteamPipe hSteamPipe);
		[CLink]
		public static extern bool SteamAPI_ManualDispatch_GetAPICallResult(HSteamPipe hSteamPipe, SteamAPICall_t hSteamAPICall, void* callback, int32 cubCallback, int32 iCallbackExpected, bool* pbFailed);
		[CLink]
		public static extern bool SteamAPI_ManualDispatch_GetNextCallback(HSteamPipe hSteamPipe, CallbackMsg_t* pCallbackMsg);
		[CLink]
		public static extern void SteamAPI_ManualDispatch_Init();
		[CLink]
		public static extern void SteamAPI_ManualDispatch_RunFrame(HSteamPipe hSteamPipe);


		public function void SteamAPIWarningMessageHook_t(int32 nSeverity, char8* pchDebugText);
		public function uint32 SteamAPI_CheckCallbackRegistered_t(int32 iCallbackNum);

	}
}
