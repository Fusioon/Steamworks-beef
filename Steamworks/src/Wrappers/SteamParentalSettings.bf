using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamParentalSettings
	{
		static ISteamParentalSettings _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamParentalSettings()) != 0;
		public static bool BIsParentalLockEnabled()
		{
			return _iface.BIsParentalLockEnabled();
		}
		public static bool BIsParentalLockLocked()
		{
			return _iface.BIsParentalLockLocked();
		}
		public static bool BIsAppBlocked(AppId_t nAppID)
		{
			return _iface.BIsAppBlocked(nAppID);
		}
		public static bool BIsAppInBlockList(AppId_t nAppID)
		{
			return _iface.BIsAppInBlockList(nAppID);
		}
		public static bool BIsFeatureBlocked(EParentalFeature eFeature)
		{
			return _iface.BIsFeatureBlocked(eFeature);
		}
		public static bool BIsFeatureInBlockList(EParentalFeature eFeature)
		{
			return _iface.BIsFeatureInBlockList(eFeature);
		}
	}
}