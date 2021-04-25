using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamUserStats
	{
		static ISteamUserStats _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamUserStats()) != 0;
		public static bool RequestCurrentStats()
		{
			return _iface.RequestCurrentStats();
		}
		public static bool GetStat(StringView pchName, out int32 pData)
		{
			pData = ?;
			return _iface.GetStat(TerminateString!(pchName), &pData);
		}
		public static bool GetStat(StringView pchName, out float pData)
		{
			pData = ?;
			return _iface.GetStat(TerminateString!(pchName), &pData);
		}
		public static bool SetStat(StringView pchName, int32 nData)
		{
			return _iface.SetStat(TerminateString!(pchName), nData);
		}
		public static bool SetStat(StringView pchName, float fData)
		{
			return _iface.SetStat(TerminateString!(pchName), fData);
		}
		public static bool UpdateAvgRateStat(StringView pchName, float flCountThisSession, double dSessionLength)
		{
			return _iface.UpdateAvgRateStat(TerminateString!(pchName), flCountThisSession, dSessionLength);
		}
		public static bool GetAchievement(StringView pchName, out bool pbAchieved)
		{
			pbAchieved = ?;
			return _iface.GetAchievement(TerminateString!(pchName), &pbAchieved);
		}
		public static bool SetAchievement(StringView pchName)
		{
			return _iface.SetAchievement(TerminateString!(pchName));
		}
		public static bool ClearAchievement(StringView pchName)
		{
			return _iface.ClearAchievement(TerminateString!(pchName));
		}
		public static bool GetAchievementAndUnlockTime(StringView pchName, out bool pbAchieved, out uint32 punUnlockTime)
		{
			pbAchieved = ?;
			punUnlockTime = ?;
			return _iface.GetAchievementAndUnlockTime(TerminateString!(pchName), &pbAchieved, &punUnlockTime);
		}
		public static bool StoreStats()
		{
			return _iface.StoreStats();
		}
		public static int32 GetAchievementIcon(StringView pchName)
		{
			return _iface.GetAchievementIcon(TerminateString!(pchName));
		}
		public static StringView GetAchievementDisplayAttribute(StringView pchName, StringView pchKey)
		{
			return StringView(_iface.GetAchievementDisplayAttribute(TerminateString!(pchName), TerminateString!(pchKey)));
		}
		public static bool IndicateAchievementProgress(StringView pchName, uint32 nCurProgress, uint32 nMaxProgress)
		{
			return _iface.IndicateAchievementProgress(TerminateString!(pchName), nCurProgress, nMaxProgress);
		}
		public static uint32 GetNumAchievements()
		{
			return _iface.GetNumAchievements();
		}
		public static StringView GetAchievementName(uint32 iAchievement)
		{
			return StringView(_iface.GetAchievementName(iAchievement));
		}
		[NoDiscard]
		public static SteamAPICall_t RequestUserStats(CSteamID steamIDUser)
		{
			return _iface.RequestUserStats(steamIDUser);
		}
		public static bool GetUserStat(CSteamID steamIDUser, StringView pchName, out int32 pData)
		{
			pData = ?;
			return _iface.GetUserStat(steamIDUser, TerminateString!(pchName), &pData);
		}
		public static bool GetUserStat(CSteamID steamIDUser, StringView pchName, out float pData)
		{
			pData = ?;
			return _iface.GetUserStat(steamIDUser, TerminateString!(pchName), &pData);
		}
		public static bool GetUserAchievement(CSteamID steamIDUser, StringView pchName, out bool pbAchieved)
		{
			pbAchieved = ?;
			return _iface.GetUserAchievement(steamIDUser, TerminateString!(pchName), &pbAchieved);
		}
		public static bool GetUserAchievementAndUnlockTime(CSteamID steamIDUser, StringView pchName, out bool pbAchieved, out uint32 punUnlockTime)
		{
			pbAchieved = ?;
			punUnlockTime = ?;
			return _iface.GetUserAchievementAndUnlockTime(steamIDUser, TerminateString!(pchName), &pbAchieved, &punUnlockTime);
		}
		public static bool ResetAllStats(bool bAchievementsToo)
		{
			return _iface.ResetAllStats(bAchievementsToo);
		}
		[NoDiscard]
		public static SteamAPICall_t FindOrCreateLeaderboard(StringView pchLeaderboardName, ELeaderboardSortMethod eLeaderboardSortMethod, ELeaderboardDisplayType eLeaderboardDisplayType)
		{
			return _iface.FindOrCreateLeaderboard(TerminateString!(pchLeaderboardName), eLeaderboardSortMethod, eLeaderboardDisplayType);
		}
		[NoDiscard]
		public static SteamAPICall_t FindLeaderboard(StringView pchLeaderboardName)
		{
			return _iface.FindLeaderboard(TerminateString!(pchLeaderboardName));
		}
		public static StringView GetLeaderboardName(SteamLeaderboard_t hSteamLeaderboard)
		{
			return StringView(_iface.GetLeaderboardName(hSteamLeaderboard));
		}
		public static int32 GetLeaderboardEntryCount(SteamLeaderboard_t hSteamLeaderboard)
		{
			return _iface.GetLeaderboardEntryCount(hSteamLeaderboard);
		}
		public static ELeaderboardSortMethod GetLeaderboardSortMethod(SteamLeaderboard_t hSteamLeaderboard)
		{
			return _iface.GetLeaderboardSortMethod(hSteamLeaderboard);
		}
		public static ELeaderboardDisplayType GetLeaderboardDisplayType(SteamLeaderboard_t hSteamLeaderboard)
		{
			return _iface.GetLeaderboardDisplayType(hSteamLeaderboard);
		}
		[NoDiscard]
		public static SteamAPICall_t DownloadLeaderboardEntries(SteamLeaderboard_t hSteamLeaderboard, ELeaderboardDataRequest eLeaderboardDataRequest, int32 nRangeStart, int32 nRangeEnd)
		{
			return _iface.DownloadLeaderboardEntries(hSteamLeaderboard, eLeaderboardDataRequest, nRangeStart, nRangeEnd);
		}
		[NoDiscard]
		public static SteamAPICall_t DownloadLeaderboardEntriesForUsers(SteamLeaderboard_t hSteamLeaderboard, CSteamID* prgUsers, int32 cUsers)
		{
			return _iface.DownloadLeaderboardEntriesForUsers(hSteamLeaderboard, prgUsers, cUsers);
		}
		public static bool GetDownloadedLeaderboardEntry(SteamLeaderboardEntries_t hSteamLeaderboardEntries, int32 index, LeaderboardEntry_t* pLeaderboardEntry, out int32 pDetails, int32 cDetailsMax)
		{
			pDetails = ?;
			return _iface.GetDownloadedLeaderboardEntry(hSteamLeaderboardEntries, index, pLeaderboardEntry, &pDetails, cDetailsMax);
		}
		[NoDiscard]
		public static SteamAPICall_t UploadLeaderboardScore(SteamLeaderboard_t hSteamLeaderboard, ELeaderboardUploadScoreMethod eLeaderboardUploadScoreMethod, int32 nScore, int32* pScoreDetails, int32 cScoreDetailsCount)
		{
			return _iface.UploadLeaderboardScore(hSteamLeaderboard, eLeaderboardUploadScoreMethod, nScore, pScoreDetails, cScoreDetailsCount);
		}
		[NoDiscard]
		public static SteamAPICall_t AttachLeaderboardUGC(SteamLeaderboard_t hSteamLeaderboard, UGCHandle_t hUGC)
		{
			return _iface.AttachLeaderboardUGC(hSteamLeaderboard, hUGC);
		}
		[NoDiscard]
		public static SteamAPICall_t GetNumberOfCurrentPlayers()
		{
			return _iface.GetNumberOfCurrentPlayers();
		}
		[NoDiscard]
		public static SteamAPICall_t RequestGlobalAchievementPercentages()
		{
			return _iface.RequestGlobalAchievementPercentages();
		}
		public static int32 GetMostAchievedAchievementInfo(char8* pchName, uint32 unNameBufLen, out float pflPercent, out bool pbAchieved)
		{
			pflPercent = ?;
			pbAchieved = ?;
			return _iface.GetMostAchievedAchievementInfo(pchName, unNameBufLen, &pflPercent, &pbAchieved);
		}
		public static int32 GetNextMostAchievedAchievementInfo(int32 iIteratorPrevious, char8* pchName, uint32 unNameBufLen, out float pflPercent, out bool pbAchieved)
		{
			pflPercent = ?;
			pbAchieved = ?;
			return _iface.GetNextMostAchievedAchievementInfo(iIteratorPrevious, pchName, unNameBufLen, &pflPercent, &pbAchieved);
		}
		public static bool GetAchievementAchievedPercent(StringView pchName, out float pflPercent)
		{
			pflPercent = ?;
			return _iface.GetAchievementAchievedPercent(TerminateString!(pchName), &pflPercent);
		}
		[NoDiscard]
		public static SteamAPICall_t RequestGlobalStats(int32 nHistoryDays)
		{
			return _iface.RequestGlobalStats(nHistoryDays);
		}
		public static bool GetGlobalStat(StringView pchStatName, out int64 pData)
		{
			pData = ?;
			return _iface.GetGlobalStat(TerminateString!(pchStatName), &pData);
		}
		public static bool GetGlobalStat(StringView pchStatName, out double pData)
		{
			pData = ?;
			return _iface.GetGlobalStat(TerminateString!(pchStatName), &pData);
		}
		public static int32 GetGlobalStatHistory(StringView pchStatName, out int64 pData, uint32 cubData)
		{
			pData = ?;
			return _iface.GetGlobalStatHistory(TerminateString!(pchStatName), &pData, cubData);
		}
		public static int32 GetGlobalStatHistory(StringView pchStatName, out double pData, uint32 cubData)
		{
			pData = ?;
			return _iface.GetGlobalStatHistory(TerminateString!(pchStatName), &pData, cubData);
		}
		public static bool GetAchievementProgressLimits(StringView pchName, out int32 pnMinProgress, out int32 pnMaxProgress)
		{
			pnMinProgress = ?;
			pnMaxProgress = ?;
			return _iface.GetAchievementProgressLimits(TerminateString!(pchName), &pnMinProgress, &pnMaxProgress);
		}
		public static bool GetAchievementProgressLimits(StringView pchName, out float pfMinProgress, out float pfMaxProgress)
		{
			pfMinProgress = ?;
			pfMaxProgress = ?;
			return _iface.GetAchievementProgressLimits(TerminateString!(pchName), &pfMinProgress, &pfMaxProgress);
		}
	}
}