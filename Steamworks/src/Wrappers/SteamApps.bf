using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamApps
	{
		static ISteamApps _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamApps()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerApps()) != 0;
		public static bool BIsSubscribed()
		{
			return _iface.BIsSubscribed();
		}
		public static bool BIsLowViolence()
		{
			return _iface.BIsLowViolence();
		}
		public static bool BIsCybercafe()
		{
			return _iface.BIsCybercafe();
		}
		public static bool BIsVACBanned()
		{
			return _iface.BIsVACBanned();
		}
		public static StringView GetCurrentGameLanguage()
		{
			return StringView(_iface.GetCurrentGameLanguage());
		}
		public static StringView GetAvailableGameLanguages()
		{
			return StringView(_iface.GetAvailableGameLanguages());
		}
		public static bool BIsSubscribedApp(AppId_t appID)
		{
			return _iface.BIsSubscribedApp(appID);
		}
		public static bool BIsDlcInstalled(AppId_t appID)
		{
			return _iface.BIsDlcInstalled(appID);
		}
		public static uint32 GetEarliestPurchaseUnixTime(AppId_t nAppID)
		{
			return _iface.GetEarliestPurchaseUnixTime(nAppID);
		}
		public static bool BIsSubscribedFromFreeWeekend()
		{
			return _iface.BIsSubscribedFromFreeWeekend();
		}
		public static int32 GetDLCCount()
		{
			return _iface.GetDLCCount();
		}
		public static bool BGetDLCDataByIndex(int32 iDLC, AppId_t* pAppID, out bool pbAvailable, char8* pchName, int32 cchNameBufferSize)
		{
			pbAvailable = ?;
			return _iface.BGetDLCDataByIndex(iDLC, pAppID, &pbAvailable, pchName, cchNameBufferSize);
		}
		public static void InstallDLC(AppId_t nAppID)
		{
			_iface.InstallDLC(nAppID);
		}
		public static void UninstallDLC(AppId_t nAppID)
		{
			_iface.UninstallDLC(nAppID);
		}
		public static void RequestAppProofOfPurchaseKey(AppId_t nAppID)
		{
			_iface.RequestAppProofOfPurchaseKey(nAppID);
		}
		public static bool GetCurrentBetaName(char8* pchName, int32 cchNameBufferSize)
		{
			return _iface.GetCurrentBetaName(pchName, cchNameBufferSize);
		}
		public static bool MarkContentCorrupt(bool bMissingFilesOnly)
		{
			return _iface.MarkContentCorrupt(bMissingFilesOnly);
		}
		public static uint32 GetInstalledDepots(AppId_t appID, DepotId_t* pvecDepots, uint32 cMaxDepots)
		{
			return _iface.GetInstalledDepots(appID, pvecDepots, cMaxDepots);
		}
		public static uint32 GetAppInstallDir(AppId_t appID, char8* pchFolder, uint32 cchFolderBufferSize)
		{
			return _iface.GetAppInstallDir(appID, pchFolder, cchFolderBufferSize);
		}
		public static bool BIsAppInstalled(AppId_t appID)
		{
			return _iface.BIsAppInstalled(appID);
		}
		public static CSteamID GetAppOwner()
		{
			return _iface.GetAppOwner();
		}
		public static StringView GetLaunchQueryParam(StringView pchKey)
		{
			return StringView(_iface.GetLaunchQueryParam(TerminateString!(pchKey)));
		}
		public static bool GetDlcDownloadProgress(AppId_t nAppID, out uint64 punBytesDownloaded, out uint64 punBytesTotal)
		{
			punBytesDownloaded = ?;
			punBytesTotal = ?;
			return _iface.GetDlcDownloadProgress(nAppID, &punBytesDownloaded, &punBytesTotal);
		}
		public static int32 GetAppBuildId()
		{
			return _iface.GetAppBuildId();
		}
		public static void RequestAllProofOfPurchaseKeys()
		{
			_iface.RequestAllProofOfPurchaseKeys();
		}
		[NoDiscard]
		public static SteamAPICall_t GetFileDetails(StringView pszFileName)
		{
			return _iface.GetFileDetails(TerminateString!(pszFileName));
		}
		public static int32 GetLaunchCommandLine(char8* pszCommandLine, int32 cubCommandLine)
		{
			return _iface.GetLaunchCommandLine(pszCommandLine, cubCommandLine);
		}
		public static bool BIsSubscribedFromFamilySharing()
		{
			return _iface.BIsSubscribedFromFamilySharing();
		}
		public static bool BIsTimedTrial(out uint32 punSecondsAllowed, out uint32 punSecondsPlayed)
		{
			punSecondsAllowed = ?;
			punSecondsPlayed = ?;
			return _iface.BIsTimedTrial(&punSecondsAllowed, &punSecondsPlayed);
		}
	}
}