using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	public static class SteamApps
	{
		static ISteamApps _apps;
		static internal bool Init()
		{
			return (_apps = Accessors.SteamApps()) != 0;
		}

		public static bool GetDLCDataByIndex(int32 iDLC, out AppId_t pAppID, out bool pbAvailable, Span<char8> pchName)
		{
			pAppID = pbAvailable = ?;
			return _apps.BGetDLCDataByIndex(iDLC, &pAppID, &pbAvailable, pchName.Ptr, (.)pchName.Length);
		}

		public static bool IsAppInstalled(AppId_t appID)
		{
			return _apps.BIsAppInstalled(appID);
		}

		[Obsolete("No longer used.", false)]
		public static bool IsCybercafe()
		{
			return _apps.BIsCybercafe();
		}

		public static bool IsDlcInstalled(AppId_t appID)
		{
			return _apps.BIsDlcInstalled(appID);
		}

		public static bool IsLowViolence()
		{
			return _apps.BIsLowViolence();
		}

		public static bool IsSubscribed()
		{
			return _apps.BIsSubscribed();
		}

		public static bool IsSubscribedApp(AppId_t appID)
		{
			return _apps.BIsSubscribedApp(appID);
		}

		public static bool IsSubscribedFromFamilySharing()
		{
			return _apps.BIsSubscribedFromFamilySharing();
		}

		public static bool IsSubscribedFromFreeWeekend()
		{
			return _apps.BIsSubscribedFromFreeWeekend();
		}

		public static bool IsVACBanned()
		{
			return _apps.BIsVACBanned();
		}

		public static int32 GetAppBuildId()
		{
			return _apps.GetAppBuildId();
		}

		public static uint32 GetAppInstallDir(AppId_t appID, Span<char8> buffer)
		{
			return _apps.GetAppInstallDir(appID, buffer.Ptr, (.)buffer.Length);
		}

		public static CSteamID GetAppOwner()
		{
			return _apps.GetAppOwner();
		}

		public static StringView GetAvailableGameLanguages()
		{
			return StringView(_apps.GetAvailableGameLanguages());
		}

		public static bool GetCurrentBetaName(Span<char8> buffer)
		{
			return _apps.GetCurrentBetaName(buffer.Ptr, (.)buffer.Length);
		}

		public static StringView GetCurrentGameLanguage()
		{
			return .(_apps.GetCurrentGameLanguage());
		}

		public static int32 GetDLCCount()
		{
			return _apps.GetDLCCount();
		}

		public static bool GetDlcDownloadProgress(AppId_t nAppID, out uint64 punBytesDownloaded, out uint64 punBytesTotal)
		{
			punBytesDownloaded = punBytesTotal = ?;
			return _apps.GetDlcDownloadProgress(nAppID, &punBytesDownloaded, &punBytesTotal);
		}

		public static uint32 GetEarliestPurchaseUnixTime(AppId_t nAppID)
		{
			return _apps.GetEarliestPurchaseUnixTime(nAppID);
		}

		[NoDiscard]
		public static SteamAPICall_t GetFileDetails(StringView pszFileName)
		{
			return _apps.GetFileDetails(TerminateString!(pszFileName));
		}

		public static uint32 GetInstalledDepots(AppId_t appID, Span<DepotId_t> pvecDepots)
		{
			return _apps.GetInstalledDepots(appID, pvecDepots.Ptr, (uint32)pvecDepots.Length);
		}

		public static int32 GetLaunchCommandLine(Span<char8> buffer)
		{
			return _apps.GetLaunchCommandLine(buffer.Ptr, (.)buffer.Length);
		}

		public static StringView GetLaunchQueryParam(StringView pchKey)
		{
			return StringView(_apps.GetLaunchQueryParam(TerminateString!(pchKey)));
		}

		public static void InstallDLC(AppId_t nAppID)
		{
			_apps.InstallDLC(nAppID);
		}

		public static bool MarkContentCorrupt(bool bMissingFilesOnly)
		{
			return _apps.MarkContentCorrupt(bMissingFilesOnly);
		}

		[Obsolete("Deprecated.", false)]
		public static void RequestAllProofOfPurchaseKeys()
		{
			_apps.RequestAllProofOfPurchaseKeys();
		}

		[Obsolete("Deprecated.", false)]
		public static void RequestAppProofOfPurchaseKey(AppId_t nAppID)
		{
			_apps.RequestAppProofOfPurchaseKey(nAppID);
		}

		public static void UninstallDLC(AppId_t nAppID)
		{
			_apps.UninstallDLC(nAppID);
		}
	}
}
