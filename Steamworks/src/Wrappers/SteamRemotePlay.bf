using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamRemotePlay
	{
		static ISteamRemotePlay _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamRemotePlay()) != 0;
		public static uint32 GetSessionCount()
		{
			return _iface.GetSessionCount();
		}
		public static RemotePlaySessionID_t GetSessionID(int32 iSessionIndex)
		{
			return _iface.GetSessionID(iSessionIndex);
		}
		public static CSteamID GetSessionSteamID(RemotePlaySessionID_t unSessionID)
		{
			return _iface.GetSessionSteamID(unSessionID);
		}
		public static StringView GetSessionClientName(RemotePlaySessionID_t unSessionID)
		{
			return StringView(_iface.GetSessionClientName(unSessionID));
		}
		public static ESteamDeviceFormFactor GetSessionClientFormFactor(RemotePlaySessionID_t unSessionID)
		{
			return _iface.GetSessionClientFormFactor(unSessionID);
		}
		public static bool BGetSessionClientResolution(RemotePlaySessionID_t unSessionID, out int32 pnResolutionX, out int32 pnResolutionY)
		{
			pnResolutionX = ?;
			pnResolutionY = ?;
			return _iface.BGetSessionClientResolution(unSessionID, &pnResolutionX, &pnResolutionY);
		}
		public static bool BSendRemotePlayTogetherInvite(CSteamID steamIDFriend)
		{
			return _iface.BSendRemotePlayTogetherInvite(steamIDFriend);
		}
	}
}