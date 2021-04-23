using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	public static class SteamUser
	{
		static ISteamUser _user;
		internal static bool Init()
		{
			return (_user = Accessors.SteamUser()) != 0;
		}

		public static void AdvertiseGame(CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer)
		{
			_user.AdvertiseGame(steamIDGameServer, unIPServer, usPortServer);
		}

		public static EBeginAuthSessionResult BeginAuthSession(void* pAuthTicket, int32 cbAuthTicket, CSteamID steamID)
		{
			return _user.BeginAuthSession(pAuthTicket, cbAuthTicket, steamID);
		}

		public static bool IsBehindNAT()
		{
			return _user.BIsBehindNAT();
		}

		public static bool IsPhoneIdentifying()
		{
			return _user.BIsPhoneIdentifying();
		}

		public static bool IsPhoneRequiringVerification()
		{
			return _user.BIsPhoneRequiringVerification();
		}

		public static bool IsPhoneVerified()
		{
			return _user.BIsPhoneVerified();
		}

		public static bool IsTwoFactorEnabled()
		{
			return _user.BIsTwoFactorEnabled();
		}

		public static bool LoggedOn()
		{
			return _user.BLoggedOn();
		}

		public static bool BSetDurationControlOnlineState(EDurationControlOnlineState eNewState)
		{
			return _user.BSetDurationControlOnlineState(eNewState);
		}

		public static void CancelAuthTicket(HAuthTicket hAuthTicket)
		{
			_user.CancelAuthTicket(hAuthTicket);
		}

		public static EVoiceResult DecompressVoice(void* pCompressed, uint32 cbCompressed, void* pDestBuffer, uint32 cbDestBufferSize, out uint32 nBytesWritten, uint32 nDesiredSampleRate)
		{
			nBytesWritten = ?;
			return _user.DecompressVoice(pCompressed, cbCompressed, pDestBuffer, cbDestBufferSize, &nBytesWritten, nDesiredSampleRate);
		}

		public static void EndAuthSession(CSteamID steamID)
		{
			_user.EndAuthSession(steamID);
		}

		public static HAuthTicket GetAuthSessionTicket(void* pTicket, int32 cbMaxTicket, uint32* pcbTicket)
		{
			return _user.GetAuthSessionTicket(pTicket, cbMaxTicket, pcbTicket);
		}

		public static EVoiceResult GetAvailableVoice(uint32* pcbCompressed)
		{
			return _user.GetAvailableVoice(pcbCompressed, null, 0);
		}

		[NoDiscard]
		public static SteamAPICall_t GetDurationControl()
		{
			return _user.GetDurationControl();
		}

		public static bool GetEncryptedAppTicket(void* pTicket, int32 cbMaxTicket, uint32* pcbTicket)
		{
			return _user.GetEncryptedAppTicket(pTicket, cbMaxTicket, pcbTicket);
		}

		public static int32 GetGameBadgeLevel(int32 nSeries, bool bFoil)
		{
			return _user.GetGameBadgeLevel(nSeries, bFoil);
		}

		public static int32 GetPlayerSteamLevel()
		{
			return _user.GetPlayerSteamLevel();
		}

		public static CSteamID GetSteamID()
		{
			return _user.GetSteamID();
		}

		[Obsolete("You should use the Steam Cloud API from ISteamRemoteStorage instead.", false)]
		public static bool GetUserDataFolder(Span<char8> buffer)
		{
			return _user.GetUserDataFolder(buffer.Ptr, (.)buffer.Length);
		}

		public static EVoiceResult GetVoice(bool bWantCompressed, void* pDestBuffer, uint32 cbDestBufferSize, out uint32 nBytesWritten)
		{
			nBytesWritten = ?;
			return _user.GetVoice(bWantCompressed, pDestBuffer, cbDestBufferSize, &nBytesWritten, false, null, 0, null, 0);
		}

		public static uint32 GetVoiceOptimalSampleRate()
		{
			return _user.GetVoiceOptimalSampleRate();
		}

		public static int32 InitiateGameConnection(void* pAuthBlob, int32 cbMaxAuthBlob, CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer, bool bSecure)
		{
			return _user.InitiateGameConnection(pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure);
		}

		[NoDiscard]
		public static SteamAPICall_t RequestEncryptedAppTicket(void* pDataToInclude, int32 cbDataToInclude)
		{
			return _user.RequestEncryptedAppTicket(pDataToInclude, cbDataToInclude);
		}

		[NoDiscard]
		public static SteamAPICall_t RequestStoreAuthURL(StringView pchRedirectURL)
		{
			return _user.RequestStoreAuthURL(TerminateString!(pchRedirectURL));
		}

		public static void StartVoiceRecording()
		{
			_user.StartVoiceRecording();
		}

		public static void StopVoiceRecording()
		{
			_user.StopVoiceRecording();
		}

		public static void TerminateGameConnection(uint32 unIPServer, uint16 usPortServer)
		{
			_user.TerminateGameConnection(unIPServer, usPortServer);
		}

		[Obsolete("Only used by only a few games to track usage events before Stats and Achievements was introduced.", false)]
		public static void TrackAppUsageEvent(CGameID gameID, int32 eAppUsageEvent, StringView pchExtraInfo = default)
		{
			_user.TrackAppUsageEvent(gameID, eAppUsageEvent, TerminateString!(pchExtraInfo));
		}

		public static EUserHasLicenseForAppResult UserHasLicenseForApp(CSteamID steamID, AppId_t appID)
		{
			return _user.UserHasLicenseForApp(steamID, appID);
		}
	}
}
