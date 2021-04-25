using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamNetworkingSockets
	{
		static ISteamNetworkingSockets _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamNetworkingSockets_SteamAPI()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerNetworkingSockets_SteamAPI()) != 0;
		public static HSteamListenSocket CreateListenSocketIP(in SteamNetworkingIPAddr localAddress, int32 nOptions, SteamNetworkingConfigValue_t* pOptions)
		{
			return _iface.CreateListenSocketIP(localAddress, nOptions, pOptions);
		}
		public static HSteamNetConnection ConnectByIPAddress(in SteamNetworkingIPAddr address, int32 nOptions, SteamNetworkingConfigValue_t* pOptions)
		{
			return _iface.ConnectByIPAddress(address, nOptions, pOptions);
		}
		public static HSteamListenSocket CreateListenSocketP2P(int32 nLocalVirtualPort, int32 nOptions, SteamNetworkingConfigValue_t* pOptions)
		{
			return _iface.CreateListenSocketP2P(nLocalVirtualPort, nOptions, pOptions);
		}
		public static HSteamNetConnection ConnectP2P(in SteamNetworkingIdentity identityRemote, int32 nRemoteVirtualPort, int32 nOptions, SteamNetworkingConfigValue_t* pOptions)
		{
			return _iface.ConnectP2P(identityRemote, nRemoteVirtualPort, nOptions, pOptions);
		}
		public static EResult AcceptConnection(HSteamNetConnection hConn)
		{
			return _iface.AcceptConnection(hConn);
		}
		public static bool CloseConnection(HSteamNetConnection hPeer, int32 nReason, StringView pszDebug, bool bEnableLinger)
		{
			return _iface.CloseConnection(hPeer, nReason, TerminateString!(pszDebug), bEnableLinger);
		}
		public static bool CloseListenSocket(HSteamListenSocket hSocket)
		{
			return _iface.CloseListenSocket(hSocket);
		}
		public static bool SetConnectionUserData(HSteamNetConnection hPeer, int64 nUserData)
		{
			return _iface.SetConnectionUserData(hPeer, nUserData);
		}
		public static int64 GetConnectionUserData(HSteamNetConnection hPeer)
		{
			return _iface.GetConnectionUserData(hPeer);
		}
		public static void SetConnectionName(HSteamNetConnection hPeer, StringView pszName)
		{
			_iface.SetConnectionName(hPeer, TerminateString!(pszName));
		}
		public static bool GetConnectionName(HSteamNetConnection hPeer, char8* pszName, int32 nMaxLen)
		{
			return _iface.GetConnectionName(hPeer, pszName, nMaxLen);
		}
		public static EResult SendMessageToConnection(HSteamNetConnection hConn, void* pData, uint32 cbData, int32 nSendFlags, out int64 pOutMessageNumber)
		{
			pOutMessageNumber = ?;
			return _iface.SendMessageToConnection(hConn, pData, cbData, nSendFlags, &pOutMessageNumber);
		}
		public static void SendMessages(int32 nMessages, SteamNetworkingMessage_t** pMessages, out int64 pOutMessageNumberOrResult)
		{
			pOutMessageNumberOrResult = ?;
			_iface.SendMessages(nMessages, pMessages, &pOutMessageNumberOrResult);
		}
		public static EResult FlushMessagesOnConnection(HSteamNetConnection hConn)
		{
			return _iface.FlushMessagesOnConnection(hConn);
		}
		public static int32 ReceiveMessagesOnConnection(HSteamNetConnection hConn, SteamNetworkingMessage_t** ppOutMessages, int32 nMaxMessages)
		{
			return _iface.ReceiveMessagesOnConnection(hConn, ppOutMessages, nMaxMessages);
		}
		public static bool GetConnectionInfo(HSteamNetConnection hConn, SteamNetConnectionInfo_t* pInfo)
		{
			return _iface.GetConnectionInfo(hConn, pInfo);
		}
		public static bool GetQuickConnectionStatus(HSteamNetConnection hConn, SteamNetworkingQuickConnectionStatus* pStats)
		{
			return _iface.GetQuickConnectionStatus(hConn, pStats);
		}
		public static int32 GetDetailedConnectionStatus(HSteamNetConnection hConn, char8* pszBuf, int32 cbBuf)
		{
			return _iface.GetDetailedConnectionStatus(hConn, pszBuf, cbBuf);
		}
		public static bool GetListenSocketAddress(HSteamListenSocket hSocket, SteamNetworkingIPAddr* address)
		{
			return _iface.GetListenSocketAddress(hSocket, address);
		}
		public static bool CreateSocketPair(HSteamNetConnection* pOutConnection1, HSteamNetConnection* pOutConnection2, bool bUseNetworkLoopback, SteamNetworkingIdentity* pIdentity1, SteamNetworkingIdentity* pIdentity2)
		{
			return _iface.CreateSocketPair(pOutConnection1, pOutConnection2, bUseNetworkLoopback, pIdentity1, pIdentity2);
		}
		public static bool GetIdentity(SteamNetworkingIdentity* pIdentity)
		{
			return _iface.GetIdentity(pIdentity);
		}
		public static ESteamNetworkingAvailability InitAuthentication()
		{
			return _iface.InitAuthentication();
		}
		public static ESteamNetworkingAvailability GetAuthenticationStatus(SteamNetAuthenticationStatus_t* pDetails)
		{
			return _iface.GetAuthenticationStatus(pDetails);
		}
		public static HSteamNetPollGroup CreatePollGroup()
		{
			return _iface.CreatePollGroup();
		}
		public static bool DestroyPollGroup(HSteamNetPollGroup hPollGroup)
		{
			return _iface.DestroyPollGroup(hPollGroup);
		}
		public static bool SetConnectionPollGroup(HSteamNetConnection hConn, HSteamNetPollGroup hPollGroup)
		{
			return _iface.SetConnectionPollGroup(hConn, hPollGroup);
		}
		public static int32 ReceiveMessagesOnPollGroup(HSteamNetPollGroup hPollGroup, SteamNetworkingMessage_t** ppOutMessages, int32 nMaxMessages)
		{
			return _iface.ReceiveMessagesOnPollGroup(hPollGroup, ppOutMessages, nMaxMessages);
		}
		public static bool ReceivedRelayAuthTicket(void* pvTicket, int32 cbTicket, SteamDatagramRelayAuthTicket* pOutParsedTicket)
		{
			return _iface.ReceivedRelayAuthTicket(pvTicket, cbTicket, pOutParsedTicket);
		}
		public static int32 FindRelayAuthTicketForServer(in SteamNetworkingIdentity identityGameServer, int32 nRemoteVirtualPort, SteamDatagramRelayAuthTicket* pOutParsedTicket)
		{
			return _iface.FindRelayAuthTicketForServer(identityGameServer, nRemoteVirtualPort, pOutParsedTicket);
		}
		public static HSteamNetConnection ConnectToHostedDedicatedServer(in SteamNetworkingIdentity identityTarget, int32 nRemoteVirtualPort, int32 nOptions, SteamNetworkingConfigValue_t* pOptions)
		{
			return _iface.ConnectToHostedDedicatedServer(identityTarget, nRemoteVirtualPort, nOptions, pOptions);
		}
		public static uint16 GetHostedDedicatedServerPort()
		{
			return _iface.GetHostedDedicatedServerPort();
		}
		public static SteamNetworkingPOPID GetHostedDedicatedServerPOPID()
		{
			return _iface.GetHostedDedicatedServerPOPID();
		}
		public static EResult GetHostedDedicatedServerAddress(SteamDatagramHostedAddress* pRouting)
		{
			return _iface.GetHostedDedicatedServerAddress(pRouting);
		}
		public static HSteamListenSocket CreateHostedDedicatedServerListenSocket(int32 nLocalVirtualPort, int32 nOptions, SteamNetworkingConfigValue_t* pOptions)
		{
			return _iface.CreateHostedDedicatedServerListenSocket(nLocalVirtualPort, nOptions, pOptions);
		}
		public static EResult GetGameCoordinatorServerLogin(SteamDatagramGameCoordinatorServerLogin* pLoginInfo, out int32 pcbSignedBlob, void* pBlob)
		{
			pcbSignedBlob = ?;
			return _iface.GetGameCoordinatorServerLogin(pLoginInfo, &pcbSignedBlob, pBlob);
		}
		public static HSteamNetConnection ConnectP2PCustomSignaling(ISteamNetworkingConnectionSignaling pSignaling, SteamNetworkingIdentity* pPeerIdentity, int32 nRemoteVirtualPort, int32 nOptions, SteamNetworkingConfigValue_t* pOptions)
		{
			return _iface.ConnectP2PCustomSignaling(pSignaling, pPeerIdentity, nRemoteVirtualPort, nOptions, pOptions);
		}
		public static bool ReceivedP2PCustomSignal(void* pMsg, int32 cbMsg, ISteamNetworkingSignalingRecvContext pContext)
		{
			return _iface.ReceivedP2PCustomSignal(pMsg, cbMsg, pContext);
		}
		public static bool GetCertificateRequest(out int32 pcbBlob, void* pBlob, ref SteamNetworkingErrMsg errMsg)
		{
			pcbBlob = ?;
			return _iface.GetCertificateRequest(&pcbBlob, pBlob, ref errMsg);
		}
		public static bool SetCertificate(void* pCertificate, int32 cbCertificate, ref SteamNetworkingErrMsg errMsg)
		{
			return _iface.SetCertificate(pCertificate, cbCertificate, ref errMsg);
		}
		public static void RunCallbacks()
		{
			_iface.RunCallbacks();
		}
	}
}