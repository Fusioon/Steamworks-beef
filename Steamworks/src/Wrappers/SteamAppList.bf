using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamAppList
	{
		static ISteamAppList _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamAppList()) != 0;
		public static uint32 GetNumInstalledApps()
		{
			return _iface.GetNumInstalledApps();
		}
		public static uint32 GetInstalledApps(AppId_t* pvecAppID, uint32 unMaxAppIDs)
		{
			return _iface.GetInstalledApps(pvecAppID, unMaxAppIDs);
		}
		public static int32 GetAppName(AppId_t nAppID, char8* pchName, int32 cchNameMax)
		{
			return _iface.GetAppName(nAppID, pchName, cchNameMax);
		}
		public static int32 GetAppInstallDir(AppId_t nAppID, char8* pchDirectory, int32 cchNameMax)
		{
			return _iface.GetAppInstallDir(nAppID, pchDirectory, cchNameMax);
		}
		public static int32 GetAppBuildId(AppId_t nAppID)
		{
			return _iface.GetAppBuildId(nAppID);
		}
	}
}