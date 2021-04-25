using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamGameServer
	{
		static ISteamGameServer _iface;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServer()) != 0;
		public static void SetProduct(StringView pszProduct)
		{
			_iface.SetProduct(TerminateString!(pszProduct));
		}
		public static void SetGameDescription(StringView pszGameDescription)
		{
			_iface.SetGameDescription(TerminateString!(pszGameDescription));
		}
		public static void SetModDir(StringView pszModDir)
		{
			_iface.SetModDir(TerminateString!(pszModDir));
		}
		public static void SetDedicatedServer(bool bDedicated)
		{
			_iface.SetDedicatedServer(bDedicated);
		}
		public static void LogOn(StringView pszToken)
		{
			_iface.LogOn(TerminateString!(pszToken));
		}
		public static void LogOnAnonymous()
		{
			_iface.LogOnAnonymous();
		}
		public static void LogOff()
		{
			_iface.LogOff();
		}
		public static bool BLoggedOn()
		{
			return _iface.BLoggedOn();
		}
		public static bool BSecure()
		{
			return _iface.BSecure();
		}
		public static CSteamID GetSteamID()
		{
			return _iface.GetSteamID();
		}
		public static bool WasRestartRequested()
		{
			return _iface.WasRestartRequested();
		}
		public static void SetMaxPlayerCount(int32 cPlayersMax)
		{
			_iface.SetMaxPlayerCount(cPlayersMax);
		}
		public static void SetBotPlayerCount(int32 cBotplayers)
		{
			_iface.SetBotPlayerCount(cBotplayers);
		}
		public static void SetServerName(StringView pszServerName)
		{
			_iface.SetServerName(TerminateString!(pszServerName));
		}
		public static void SetMapName(StringView pszMapName)
		{
			_iface.SetMapName(TerminateString!(pszMapName));
		}
		public static void SetPasswordProtected(bool bPasswordProtected)
		{
			_iface.SetPasswordProtected(bPasswordProtected);
		}
		public static void SetSpectatorPort(uint16 unSpectatorPort)
		{
			_iface.SetSpectatorPort(unSpectatorPort);
		}
		public static void SetSpectatorServerName(StringView pszSpectatorServerName)
		{
			_iface.SetSpectatorServerName(TerminateString!(pszSpectatorServerName));
		}
		public static void ClearAllKeyValues()
		{
			_iface.ClearAllKeyValues();
		}
		public static void SetKeyValue(StringView pKey, StringView pValue)
		{
			_iface.SetKeyValue(TerminateString!(pKey), TerminateString!(pValue));
		}
		public static void SetGameTags(StringView pchGameTags)
		{
			_iface.SetGameTags(TerminateString!(pchGameTags));
		}
		public static void SetGameData(StringView pchGameData)
		{
			_iface.SetGameData(TerminateString!(pchGameData));
		}
		public static void SetRegion(StringView pszRegion)
		{
			_iface.SetRegion(TerminateString!(pszRegion));
		}
		public static bool SendUserConnectAndAuthenticate(uint32 unIPClient, void* pvAuthBlob, uint32 cubAuthBlobSize, CSteamID* pSteamIDUser)
		{
			return _iface.SendUserConnectAndAuthenticate(unIPClient, pvAuthBlob, cubAuthBlobSize, pSteamIDUser);
		}
		public static CSteamID CreateUnauthenticatedUserConnection()
		{
			return _iface.CreateUnauthenticatedUserConnection();
		}
		public static void SendUserDisconnect(CSteamID steamIDUser)
		{
			_iface.SendUserDisconnect(steamIDUser);
		}
		public static bool BUpdateUserData(CSteamID steamIDUser, StringView pchPlayerName, uint32 uScore)
		{
			return _iface.BUpdateUserData(steamIDUser, TerminateString!(pchPlayerName), uScore);
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
		public static bool RequestUserGroupStatus(CSteamID steamIDUser, CSteamID steamIDGroup)
		{
			return _iface.RequestUserGroupStatus(steamIDUser, steamIDGroup);
		}
		public static void GetGameplayStats()
		{
			_iface.GetGameplayStats();
		}
		[NoDiscard]
		public static SteamAPICall_t GetServerReputation()
		{
			return _iface.GetServerReputation();
		}
		public static SteamIPAddress_t GetPublicIP()
		{
			return _iface.GetPublicIP();
		}
		public static bool HandleIncomingPacket(void* pData, int32 cbData, uint32 srcIP, uint16 srcPort)
		{
			return _iface.HandleIncomingPacket(pData, cbData, srcIP, srcPort);
		}
		public static int32 GetNextOutgoingPacket(void* pOut, int32 cbMaxOut, out uint32 pNetAdr, out uint16 pPort)
		{
			pNetAdr = ?;
			pPort = ?;
			return _iface.GetNextOutgoingPacket(pOut, cbMaxOut, &pNetAdr, &pPort);
		}
		public static void EnableHeartbeats(bool bActive)
		{
			_iface.EnableHeartbeats(bActive);
		}
		public static void SetHeartbeatInterval(int32 iHeartbeatInterval)
		{
			_iface.SetHeartbeatInterval(iHeartbeatInterval);
		}
		public static void ForceHeartbeat()
		{
			_iface.ForceHeartbeat();
		}
		[NoDiscard]
		public static SteamAPICall_t AssociateWithClan(CSteamID steamIDClan)
		{
			return _iface.AssociateWithClan(steamIDClan);
		}
		[NoDiscard]
		public static SteamAPICall_t ComputeNewPlayerCompatibility(CSteamID steamIDNewPlayer)
		{
			return _iface.ComputeNewPlayerCompatibility(steamIDNewPlayer);
		}
	}
}