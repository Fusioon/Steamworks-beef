using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamNetworkingMessages
	{
		static ISteamNetworkingMessages _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamNetworkingMessages_SteamAPI()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerNetworkingMessages_SteamAPI()) != 0;
		public static EResult SendMessageToUser(in SteamNetworkingIdentity identityRemote, void* pubData, uint32 cubData, int32 nSendFlags, int32 nRemoteChannel)
		{
			return _iface.SendMessageToUser(identityRemote, pubData, cubData, nSendFlags, nRemoteChannel);
		}
		public static int32 ReceiveMessagesOnChannel(int32 nLocalChannel, SteamNetworkingMessage_t** ppOutMessages, int32 nMaxMessages)
		{
			return _iface.ReceiveMessagesOnChannel(nLocalChannel, ppOutMessages, nMaxMessages);
		}
		public static bool AcceptSessionWithUser(in SteamNetworkingIdentity identityRemote)
		{
			return _iface.AcceptSessionWithUser(identityRemote);
		}
		public static bool CloseSessionWithUser(in SteamNetworkingIdentity identityRemote)
		{
			return _iface.CloseSessionWithUser(identityRemote);
		}
		public static bool CloseChannelWithUser(in SteamNetworkingIdentity identityRemote, int32 nLocalChannel)
		{
			return _iface.CloseChannelWithUser(identityRemote, nLocalChannel);
		}
		public static ESteamNetworkingConnectionState GetSessionConnectionInfo(in SteamNetworkingIdentity identityRemote, SteamNetConnectionInfo_t* pConnectionInfo, SteamNetworkingQuickConnectionStatus* pQuickStatus)
		{
			return _iface.GetSessionConnectionInfo(identityRemote, pConnectionInfo, pQuickStatus);
		}
	}
}