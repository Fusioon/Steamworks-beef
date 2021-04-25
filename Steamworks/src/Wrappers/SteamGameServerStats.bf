using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamGameServerStats
	{
		static ISteamGameServerStats _iface;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerStats()) != 0;
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
		public static bool SetUserStat(CSteamID steamIDUser, StringView pchName, int32 nData)
		{
			return _iface.SetUserStat(steamIDUser, TerminateString!(pchName), nData);
		}
		public static bool SetUserStat(CSteamID steamIDUser, StringView pchName, float fData)
		{
			return _iface.SetUserStat(steamIDUser, TerminateString!(pchName), fData);
		}
		public static bool UpdateUserAvgRateStat(CSteamID steamIDUser, StringView pchName, float flCountThisSession, double dSessionLength)
		{
			return _iface.UpdateUserAvgRateStat(steamIDUser, TerminateString!(pchName), flCountThisSession, dSessionLength);
		}
		public static bool SetUserAchievement(CSteamID steamIDUser, StringView pchName)
		{
			return _iface.SetUserAchievement(steamIDUser, TerminateString!(pchName));
		}
		public static bool ClearUserAchievement(CSteamID steamIDUser, StringView pchName)
		{
			return _iface.ClearUserAchievement(steamIDUser, TerminateString!(pchName));
		}
		[NoDiscard]
		public static SteamAPICall_t StoreUserStats(CSteamID steamIDUser)
		{
			return _iface.StoreUserStats(steamIDUser);
		}
	}
}