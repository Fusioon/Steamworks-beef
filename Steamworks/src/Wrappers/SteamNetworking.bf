using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamNetworking
	{
		static ISteamNetworking _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamNetworking()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerNetworking()) != 0;
		public static bool SendP2PPacket(CSteamID steamIDRemote, void* pubData, uint32 cubData, EP2PSend eP2PSendType, int32 nChannel)
		{
			return _iface.SendP2PPacket(steamIDRemote, pubData, cubData, eP2PSendType, nChannel);
		}
		public static bool IsP2PPacketAvailable(out uint32 pcubMsgSize, int32 nChannel)
		{
			pcubMsgSize = ?;
			return _iface.IsP2PPacketAvailable(&pcubMsgSize, nChannel);
		}
		public static bool ReadP2PPacket(void* pubDest, uint32 cubDest, out uint32 pcubMsgSize, CSteamID* psteamIDRemote, int32 nChannel)
		{
			pcubMsgSize = ?;
			return _iface.ReadP2PPacket(pubDest, cubDest, &pcubMsgSize, psteamIDRemote, nChannel);
		}
		public static bool AcceptP2PSessionWithUser(CSteamID steamIDRemote)
		{
			return _iface.AcceptP2PSessionWithUser(steamIDRemote);
		}
		public static bool CloseP2PSessionWithUser(CSteamID steamIDRemote)
		{
			return _iface.CloseP2PSessionWithUser(steamIDRemote);
		}
		public static bool CloseP2PChannelWithUser(CSteamID steamIDRemote, int32 nChannel)
		{
			return _iface.CloseP2PChannelWithUser(steamIDRemote, nChannel);
		}
		public static bool GetP2PSessionState(CSteamID steamIDRemote, P2PSessionState_t* pConnectionState)
		{
			return _iface.GetP2PSessionState(steamIDRemote, pConnectionState);
		}
		public static bool AllowP2PPacketRelay(bool bAllow)
		{
			return _iface.AllowP2PPacketRelay(bAllow);
		}
		public static SNetListenSocket_t CreateListenSocket(int32 nVirtualP2PPort, SteamIPAddress_t nIP, uint16 nPort, bool bAllowUseOfPacketRelay)
		{
			return _iface.CreateListenSocket(nVirtualP2PPort, nIP, nPort, bAllowUseOfPacketRelay);
		}
		public static SNetSocket_t CreateP2PConnectionSocket(CSteamID steamIDTarget, int32 nVirtualPort, int32 nTimeoutSec, bool bAllowUseOfPacketRelay)
		{
			return _iface.CreateP2PConnectionSocket(steamIDTarget, nVirtualPort, nTimeoutSec, bAllowUseOfPacketRelay);
		}
		public static SNetSocket_t CreateConnectionSocket(SteamIPAddress_t nIP, uint16 nPort, int32 nTimeoutSec)
		{
			return _iface.CreateConnectionSocket(nIP, nPort, nTimeoutSec);
		}
		public static bool DestroySocket(SNetSocket_t hSocket, bool bNotifyRemoteEnd)
		{
			return _iface.DestroySocket(hSocket, bNotifyRemoteEnd);
		}
		public static bool DestroyListenSocket(SNetListenSocket_t hSocket, bool bNotifyRemoteEnd)
		{
			return _iface.DestroyListenSocket(hSocket, bNotifyRemoteEnd);
		}
		public static bool SendDataOnSocket(SNetSocket_t hSocket, void* pubData, uint32 cubData, bool bReliable)
		{
			return _iface.SendDataOnSocket(hSocket, pubData, cubData, bReliable);
		}
		public static bool IsDataAvailableOnSocket(SNetSocket_t hSocket, out uint32 pcubMsgSize)
		{
			pcubMsgSize = ?;
			return _iface.IsDataAvailableOnSocket(hSocket, &pcubMsgSize);
		}
		public static bool RetrieveDataFromSocket(SNetSocket_t hSocket, void* pubDest, uint32 cubDest, out uint32 pcubMsgSize)
		{
			pcubMsgSize = ?;
			return _iface.RetrieveDataFromSocket(hSocket, pubDest, cubDest, &pcubMsgSize);
		}
		public static bool IsDataAvailable(SNetListenSocket_t hListenSocket, out uint32 pcubMsgSize, SNetSocket_t* phSocket)
		{
			pcubMsgSize = ?;
			return _iface.IsDataAvailable(hListenSocket, &pcubMsgSize, phSocket);
		}
		public static bool RetrieveData(SNetListenSocket_t hListenSocket, void* pubDest, uint32 cubDest, out uint32 pcubMsgSize, SNetSocket_t* phSocket)
		{
			pcubMsgSize = ?;
			return _iface.RetrieveData(hListenSocket, pubDest, cubDest, &pcubMsgSize, phSocket);
		}
		public static bool GetSocketInfo(SNetSocket_t hSocket, CSteamID* pSteamIDRemote, out int32 peSocketStatus, SteamIPAddress_t* punIPRemote, out uint16 punPortRemote)
		{
			peSocketStatus = ?;
			punPortRemote = ?;
			return _iface.GetSocketInfo(hSocket, pSteamIDRemote, &peSocketStatus, punIPRemote, &punPortRemote);
		}
		public static bool GetListenSocketInfo(SNetListenSocket_t hListenSocket, SteamIPAddress_t* pnIP, out uint16 pnPort)
		{
			pnPort = ?;
			return _iface.GetListenSocketInfo(hListenSocket, pnIP, &pnPort);
		}
		public static ESNetSocketConnectionType GetSocketConnectionType(SNetSocket_t hSocket)
		{
			return _iface.GetSocketConnectionType(hSocket);
		}
		public static int32 GetMaxPacketSize(SNetSocket_t hSocket)
		{
			return _iface.GetMaxPacketSize(hSocket);
		}
	}
}