using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamParties
	{
		static ISteamParties _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamParties()) != 0;
		public static uint32 GetNumActiveBeacons()
		{
			return _iface.GetNumActiveBeacons();
		}
		public static PartyBeaconID_t GetBeaconByIndex(uint32 unIndex)
		{
			return _iface.GetBeaconByIndex(unIndex);
		}
		public static bool GetBeaconDetails(PartyBeaconID_t ulBeaconID, CSteamID* pSteamIDBeaconOwner, SteamPartyBeaconLocation_t* pLocation, char8* pchMetadata, int32 cchMetadata)
		{
			return _iface.GetBeaconDetails(ulBeaconID, pSteamIDBeaconOwner, pLocation, pchMetadata, cchMetadata);
		}
		[NoDiscard]
		public static SteamAPICall_t JoinParty(PartyBeaconID_t ulBeaconID)
		{
			return _iface.JoinParty(ulBeaconID);
		}
		public static bool GetNumAvailableBeaconLocations(out uint32 puNumLocations)
		{
			puNumLocations = ?;
			return _iface.GetNumAvailableBeaconLocations(&puNumLocations);
		}
		public static bool GetAvailableBeaconLocations(SteamPartyBeaconLocation_t* pLocationList, uint32 uMaxNumLocations)
		{
			return _iface.GetAvailableBeaconLocations(pLocationList, uMaxNumLocations);
		}
		[NoDiscard]
		public static SteamAPICall_t CreateBeacon(uint32 unOpenSlots, SteamPartyBeaconLocation_t* pBeaconLocation, StringView pchConnectString, StringView pchMetadata)
		{
			return _iface.CreateBeacon(unOpenSlots, pBeaconLocation, TerminateString!(pchConnectString), TerminateString!(pchMetadata));
		}
		public static void OnReservationCompleted(PartyBeaconID_t ulBeacon, CSteamID steamIDUser)
		{
			_iface.OnReservationCompleted(ulBeacon, steamIDUser);
		}
		public static void CancelReservation(PartyBeaconID_t ulBeacon, CSteamID steamIDUser)
		{
			_iface.CancelReservation(ulBeacon, steamIDUser);
		}
		[NoDiscard]
		public static SteamAPICall_t ChangeNumOpenSlots(PartyBeaconID_t ulBeacon, uint32 unOpenSlots)
		{
			return _iface.ChangeNumOpenSlots(ulBeacon, unOpenSlots);
		}
		public static bool DestroyBeacon(PartyBeaconID_t ulBeacon)
		{
			return _iface.DestroyBeacon(ulBeacon);
		}
		public static bool GetBeaconLocationData(SteamPartyBeaconLocation_t BeaconLocation, ESteamPartyBeaconLocationData eData, char8* pchDataStringOut, int32 cchDataStringOut)
		{
			return _iface.GetBeaconLocationData(BeaconLocation, eData, pchDataStringOut, cchDataStringOut);
		}
	}
}