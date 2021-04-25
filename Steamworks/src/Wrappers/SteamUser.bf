using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamUser
	{
		static ISteamUser _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamUser()) != 0;
		public static HSteamUser GetHSteamUser()
		{
			return _iface.GetHSteamUser();
		}
		public static bool BLoggedOn()
		{
			return _iface.BLoggedOn();
		}
		public static CSteamID GetSteamID()
		{
			return _iface.GetSteamID();
		}
		public static int32 InitiateGameConnection(void* pAuthBlob, int32 cbMaxAuthBlob, CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer, bool bSecure)
		{
			return _iface.InitiateGameConnection(pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure);
		}
		public static void TerminateGameConnection(uint32 unIPServer, uint16 usPortServer)
		{
			_iface.TerminateGameConnection(unIPServer, usPortServer);
		}
		public static void TrackAppUsageEvent(CGameID gameID, int32 eAppUsageEvent, StringView pchExtraInfo)
		{
			_iface.TrackAppUsageEvent(gameID, eAppUsageEvent, TerminateString!(pchExtraInfo));
		}
		public static bool GetUserDataFolder(char8* pchBuffer, int32 cubBuffer)
		{
			return _iface.GetUserDataFolder(pchBuffer, cubBuffer);
		}
		public static void StartVoiceRecording()
		{
			_iface.StartVoiceRecording();
		}
		public static void StopVoiceRecording()
		{
			_iface.StopVoiceRecording();
		}
		public static EVoiceResult GetAvailableVoice(out uint32 pcbCompressed, out uint32 pcbUncompressed_Deprecated, uint32 nUncompressedVoiceDesiredSampleRate_Deprecated)
		{
			pcbCompressed = ?;
			pcbUncompressed_Deprecated = ?;
			return _iface.GetAvailableVoice(&pcbCompressed, &pcbUncompressed_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
		}
		public static EVoiceResult GetVoice(bool bWantCompressed, void* pDestBuffer, uint32 cbDestBufferSize, out uint32 nBytesWritten, bool bWantUncompressed_Deprecated, void* pUncompressedDestBuffer_Deprecated, uint32 cbUncompressedDestBufferSize_Deprecated, out uint32 nUncompressBytesWritten_Deprecated, uint32 nUncompressedVoiceDesiredSampleRate_Deprecated)
		{
			nBytesWritten = ?;
			nUncompressBytesWritten_Deprecated = ?;
			return _iface.GetVoice(bWantCompressed, pDestBuffer, cbDestBufferSize, &nBytesWritten, bWantUncompressed_Deprecated, pUncompressedDestBuffer_Deprecated, cbUncompressedDestBufferSize_Deprecated, &nUncompressBytesWritten_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
		}
		public static EVoiceResult DecompressVoice(void* pCompressed, uint32 cbCompressed, void* pDestBuffer, uint32 cbDestBufferSize, out uint32 nBytesWritten, uint32 nDesiredSampleRate)
		{
			nBytesWritten = ?;
			return _iface.DecompressVoice(pCompressed, cbCompressed, pDestBuffer, cbDestBufferSize, &nBytesWritten, nDesiredSampleRate);
		}
		public static uint32 GetVoiceOptimalSampleRate()
		{
			return _iface.GetVoiceOptimalSampleRate();
		}
		public static HAuthTicket GetAuthSessionTicket(void* pTicket, int32 cbMaxTicket, out uint32 pcbTicket)
		{
			pcbTicket = ?;
			return _iface.GetAuthSessionTicket(pTicket, cbMaxTicket, &pcbTicket);
		}
		public static EBeginAuthSessionResult BeginAuthSession(void* pAuthTicket, int32 cbAuthTicket, CSteamID steamID)
		{
			return _iface.BeginAuthSession(pAuthTicket, cbAuthTicket, steamID);
		}
		public static void EndAuthSession(CSteamID steamID)
		{
			_iface.EndAuthSession(steamID);
		}
		public static void CancelAuthTicket(HAuthTicket hAuthTicket)
		{
			_iface.CancelAuthTicket(hAuthTicket);
		}
		public static EUserHasLicenseForAppResult UserHasLicenseForApp(CSteamID steamID, AppId_t appID)
		{
			return _iface.UserHasLicenseForApp(steamID, appID);
		}
		public static bool BIsBehindNAT()
		{
			return _iface.BIsBehindNAT();
		}
		public static void AdvertiseGame(CSteamID steamIDGameServer, uint32 unIPServer, uint16 usPortServer)
		{
			_iface.AdvertiseGame(steamIDGameServer, unIPServer, usPortServer);
		}
		[NoDiscard]
		public static SteamAPICall_t RequestEncryptedAppTicket(void* pDataToInclude, int32 cbDataToInclude)
		{
			return _iface.RequestEncryptedAppTicket(pDataToInclude, cbDataToInclude);
		}
		public static bool GetEncryptedAppTicket(void* pTicket, int32 cbMaxTicket, out uint32 pcbTicket)
		{
			pcbTicket = ?;
			return _iface.GetEncryptedAppTicket(pTicket, cbMaxTicket, &pcbTicket);
		}
		public static int32 GetGameBadgeLevel(int32 nSeries, bool bFoil)
		{
			return _iface.GetGameBadgeLevel(nSeries, bFoil);
		}
		public static int32 GetPlayerSteamLevel()
		{
			return _iface.GetPlayerSteamLevel();
		}
		[NoDiscard]
		public static SteamAPICall_t RequestStoreAuthURL(StringView pchRedirectURL)
		{
			return _iface.RequestStoreAuthURL(TerminateString!(pchRedirectURL));
		}
		public static bool BIsPhoneVerified()
		{
			return _iface.BIsPhoneVerified();
		}
		public static bool BIsTwoFactorEnabled()
		{
			return _iface.BIsTwoFactorEnabled();
		}
		public static bool BIsPhoneIdentifying()
		{
			return _iface.BIsPhoneIdentifying();
		}
		public static bool BIsPhoneRequiringVerification()
		{
			return _iface.BIsPhoneRequiringVerification();
		}
		[NoDiscard]
		public static SteamAPICall_t GetMarketEligibility()
		{
			return _iface.GetMarketEligibility();
		}
		[NoDiscard]
		public static SteamAPICall_t GetDurationControl()
		{
			return _iface.GetDurationControl();
		}
		public static bool BSetDurationControlOnlineState(EDurationControlOnlineState eNewState)
		{
			return _iface.BSetDurationControlOnlineState(eNewState);
		}
	}
}