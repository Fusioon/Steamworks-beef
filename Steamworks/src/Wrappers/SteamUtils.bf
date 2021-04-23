using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	public static class SteamUtils
	{
		static ISteamUtils _utils;
		internal static bool Init()
		{
			return (_utils = Accessors.SteamUtils()) != 0;
		}

		public static bool OverlayNeedsPresent()
		{
			return _utils.BOverlayNeedsPresent();
		}

		[NoDiscard]
		public static SteamAPICall_t CheckFileSignature(StringView szFileName)
		{
			return _utils.CheckFileSignature(TerminateString!(szFileName));
		}

		public static ESteamAPICallFailure GetAPICallFailureReason(SteamAPICall_t hSteamAPICall)
		{
			return _utils.GetAPICallFailureReason(hSteamAPICall);
		}

		public static bool GetAPICallResult(SteamAPICall_t hSteamAPICall, void* pCallback, int32 cubCallback, int32 iCallbackExpected, out bool pbFailed)
		{
			pbFailed = ?;
			return _utils.GetAPICallResult(hSteamAPICall, pCallback, cubCallback, iCallbackExpected, &pbFailed);
		}

		public static AppId_t GetAppID()
		{
			return (AppId_t)_utils.GetAppID();
		}

		public static EUniverse GetConnectedUniverse()
		{
			return _utils.GetConnectedUniverse();
		}

		public static uint8 GetCurrentBatteryPower()
		{
			return _utils.GetCurrentBatteryPower();
		}

		public static bool GetEnteredGamepadTextInput(Span<char8> buffer)
		{
			return _utils.GetEnteredGamepadTextInput(buffer.Ptr, (.)buffer.Length);
		}

		public static uint32 GetEnteredGamepadTextLength()
		{
			return _utils.GetEnteredGamepadTextLength();
		}

		public static bool GetImageRGBA(int32 iImage, Span<uint8> buffer)
		{
			return _utils.GetImageRGBA(iImage, buffer.Ptr, (.)buffer.Length);
		}

		public static bool GetImageSize(int32 iImage, out uint32 width, out uint32 height)
		{
			width = height = ?;
			return _utils.GetImageSize(iImage, &width, &height);
		}

		public static uint32 GetIPCCallCount()
		{
			return _utils.GetIPCCallCount();
		}

		public static StringView GetIPCountry()
		{
			return StringView(_utils.GetIPCountry(), 2);
		}

		public static uint32 GetSecondsSinceAppActive()
		{
			return _utils.GetSecondsSinceAppActive();
		}

		public static uint32 GetSecondsSinceComputerActive()
		{
			return _utils.GetSecondsSinceComputerActive();
		}

		public static uint32 GetServerRealTime()
		{
			return _utils.GetServerRealTime();
		}

		public static StringView GetSteamUILanguage()
		{
			return StringView(_utils.GetSteamUILanguage());
		}

		public static bool IsAPICallCompleted(SteamAPICall_t hSteamAPICall, out bool pbFailed)
		{
			pbFailed = ?;
			return _utils.IsAPICallCompleted(hSteamAPICall, &pbFailed);
		}

		public static bool IsOverlayEnabled()
		{
			return _utils.IsOverlayEnabled();
		}

		public static bool IsSteamChinaLauncher()
		{
			return _utils.IsSteamChinaLauncher();
		}

		public static bool InitFilterText(uint32 unFilterOptions)
		{
			return _utils.InitFilterText(unFilterOptions);
		}

		public static int32 FilterText(ETextFilteringContext eContext, CSteamID sourceSteamID, StringView pchInputMessage, Span<char8> pchOutFilteredText)
		{
			return _utils.FilterText(eContext, sourceSteamID, TerminateString!(pchInputMessage), pchOutFilteredText.Ptr, (.)pchOutFilteredText.Length);
		}

		public static bool IsSteamInBigPictureMode()
		{
			return _utils.IsSteamInBigPictureMode();
		}

		public static bool IsSteamRunningInVR()
		{
			return _utils.IsSteamRunningInVR();
		}

		public static bool IsVRHeadsetStreamingEnabled()
		{
			return _utils.IsVRHeadsetStreamingEnabled();
		}

		public static void SetOverlayNotificationInset(int32 nHorizontalInset, int32 nVerticalInset)
		{
			_utils.SetOverlayNotificationInset(nHorizontalInset, nVerticalInset);
		}

		public static void SetOverlayNotificationPosition(ENotificationPosition eNotificationPosition)
		{
			_utils.SetOverlayNotificationPosition(eNotificationPosition);
		}

		public static void SetVRHeadsetStreamingEnabled(bool bEnabled)
		{
			_utils.SetVRHeadsetStreamingEnabled(bEnabled);
		}

		public static void SetWarningMessageHook(SteamAPIWarningMessageHook_t pFunction)
		{
			_utils.SetWarningMessageHook(pFunction);
		}

		public static bool ShowGamepadTextInput(EGamepadTextInputMode eInputMode, EGamepadTextInputLineMode eLineInputMode, StringView pchDescription, uint32 unCharMax, StringView chExistingText)
		{
			return _utils.ShowGamepadTextInput(eInputMode, eLineInputMode, TerminateString!(pchDescription), unCharMax, TerminateString!(chExistingText));
		}

		public static void StartVRDashboard()
		{
			_utils.StartVRDashboard();
		}
	}
}
