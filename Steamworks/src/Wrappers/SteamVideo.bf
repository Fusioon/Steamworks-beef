using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamVideo
	{
		static ISteamVideo _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamVideo()) != 0;
		public static void GetVideoURL(AppId_t unVideoAppID)
		{
			_iface.GetVideoURL(unVideoAppID);
		}
		public static bool IsBroadcasting(out int32 pnNumViewers)
		{
			pnNumViewers = ?;
			return _iface.IsBroadcasting(&pnNumViewers);
		}
		public static void GetOPFSettings(AppId_t unVideoAppID)
		{
			_iface.GetOPFSettings(unVideoAppID);
		}
		public static bool GetOPFStringForApp(AppId_t unVideoAppID, char8* pchBuffer, ref int32 pnBufferSize)
		{
			return _iface.GetOPFStringForApp(unVideoAppID, pchBuffer, &pnBufferSize);
		}
	}
}