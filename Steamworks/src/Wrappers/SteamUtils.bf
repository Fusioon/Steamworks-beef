using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamUtils
	{
		static ISteamUtils _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamUtils()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerUtils()) != 0;
		public static uint32 GetSecondsSinceAppActive()
		{
			return _iface.GetSecondsSinceAppActive();
		}
		public static uint32 GetSecondsSinceComputerActive()
		{
			return _iface.GetSecondsSinceComputerActive();
		}
		public static EUniverse GetConnectedUniverse()
		{
			return _iface.GetConnectedUniverse();
		}
		public static uint32 GetServerRealTime()
		{
			return _iface.GetServerRealTime();
		}
		public static StringView GetIPCountry()
		{
			return StringView(_iface.GetIPCountry());
		}
		public static bool GetImageSize(int32 iImage, out uint32 pnWidth, out uint32 pnHeight)
		{
			pnWidth = ?;
			pnHeight = ?;
			return _iface.GetImageSize(iImage, &pnWidth, &pnHeight);
		}
		public static bool GetImageRGBA(int32 iImage, uint8* pubDest, int32 nDestBufferSize)
		{
			return _iface.GetImageRGBA(iImage, pubDest, nDestBufferSize);
		}
		public static uint8 GetCurrentBatteryPower()
		{
			return _iface.GetCurrentBatteryPower();
		}
		public static uint32 GetAppID()
		{
			return _iface.GetAppID();
		}
		public static void SetOverlayNotificationPosition(ENotificationPosition eNotificationPosition)
		{
			_iface.SetOverlayNotificationPosition(eNotificationPosition);
		}
		public static bool IsAPICallCompleted(SteamAPICall_t hSteamAPICall, out bool pbFailed)
		{
			pbFailed = ?;
			return _iface.IsAPICallCompleted(hSteamAPICall, &pbFailed);
		}
		public static ESteamAPICallFailure GetAPICallFailureReason(SteamAPICall_t hSteamAPICall)
		{
			return _iface.GetAPICallFailureReason(hSteamAPICall);
		}
		public static bool GetAPICallResult(SteamAPICall_t hSteamAPICall, void* pCallback, int32 cubCallback, int32 iCallbackExpected, out bool pbFailed)
		{
			pbFailed = ?;
			return _iface.GetAPICallResult(hSteamAPICall, pCallback, cubCallback, iCallbackExpected, &pbFailed);
		}
		public static uint32 GetIPCCallCount()
		{
			return _iface.GetIPCCallCount();
		}
		public static void SetWarningMessageHook(SteamAPIWarningMessageHook_t pFunction)
		{
			_iface.SetWarningMessageHook(pFunction);
		}
		public static bool IsOverlayEnabled()
		{
			return _iface.IsOverlayEnabled();
		}
		public static bool BOverlayNeedsPresent()
		{
			return _iface.BOverlayNeedsPresent();
		}
		[NoDiscard]
		public static SteamAPICall_t CheckFileSignature(StringView szFileName)
		{
			return _iface.CheckFileSignature(TerminateString!(szFileName));
		}
		public static bool ShowGamepadTextInput(EGamepadTextInputMode eInputMode, EGamepadTextInputLineMode eLineInputMode, StringView pchDescription, uint32 unCharMax, StringView pchExistingText)
		{
			return _iface.ShowGamepadTextInput(eInputMode, eLineInputMode, TerminateString!(pchDescription), unCharMax, TerminateString!(pchExistingText));
		}
		public static uint32 GetEnteredGamepadTextLength()
		{
			return _iface.GetEnteredGamepadTextLength();
		}
		public static bool GetEnteredGamepadTextInput(char8* pchText, uint32 cchText)
		{
			return _iface.GetEnteredGamepadTextInput(pchText, cchText);
		}
		public static StringView GetSteamUILanguage()
		{
			return StringView(_iface.GetSteamUILanguage());
		}
		public static bool IsSteamRunningInVR()
		{
			return _iface.IsSteamRunningInVR();
		}
		public static void SetOverlayNotificationInset(int32 nHorizontalInset, int32 nVerticalInset)
		{
			_iface.SetOverlayNotificationInset(nHorizontalInset, nVerticalInset);
		}
		public static bool IsSteamInBigPictureMode()
		{
			return _iface.IsSteamInBigPictureMode();
		}
		public static void StartVRDashboard()
		{
			_iface.StartVRDashboard();
		}
		public static bool IsVRHeadsetStreamingEnabled()
		{
			return _iface.IsVRHeadsetStreamingEnabled();
		}
		public static void SetVRHeadsetStreamingEnabled(bool bEnabled)
		{
			_iface.SetVRHeadsetStreamingEnabled(bEnabled);
		}
		public static bool IsSteamChinaLauncher()
		{
			return _iface.IsSteamChinaLauncher();
		}
		public static bool InitFilterText(uint32 unFilterOptions)
		{
			return _iface.InitFilterText(unFilterOptions);
		}
		public static int32 FilterText(ETextFilteringContext eContext, CSteamID sourceSteamID, StringView pchInputMessage, char8* pchOutFilteredText, uint32 nByteSizeOutFilteredText)
		{
			return _iface.FilterText(eContext, sourceSteamID, TerminateString!(pchInputMessage), pchOutFilteredText, nByteSizeOutFilteredText);
		}
		public static ESteamIPv6ConnectivityState GetIPv6ConnectivityState(ESteamIPv6ConnectivityProtocol eProtocol)
		{
			return _iface.GetIPv6ConnectivityState(eProtocol);
		}
	}
}