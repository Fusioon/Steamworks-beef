using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	public static class SteamParties
	{
		static ISteamParties _parties;
		internal static bool Init()
		{
			return (_parties = Accessors.SteamParties()) != 0;
		}

		public static uint32 GetNumActiveBeacons()
		{
			return _parties.GetNumActiveBeacons();
		}

		public static PartyBeaconID_t GetBeaconByIndex(uint32 unIndex)
		{
			return _parties.GetBeaconByIndex(unIndex);
		}

		public static bool GetBeaconDetails(PartyBeaconID_t ulBeaconID, out CSteamID pSteamIDBeaconOwner, out SteamPartyBeaconLocation_t pLocation, Span<char8> pchMetadata)
		{
			pSteamIDBeaconOwner = ?;
			pLocation = ?;
			return _parties.GetBeaconDetails(ulBeaconID, &pSteamIDBeaconOwner, &pLocation, pchMetadata.Ptr, (.)pchMetadata.Length);
		}

		[NoDiscard]
		public static SteamAPICall_t JoinParty(PartyBeaconID_t ulBeaconID)
		{
			return _parties.JoinParty(ulBeaconID);
		}

		public static bool GetNumAvailableBeaconLocations(out uint32 puNumLocations)
		{
			puNumLocations = ?;
			return _parties.GetNumAvailableBeaconLocations(&puNumLocations);
		}

		public static bool GetAvailableBeaconLocations(Span<SteamPartyBeaconLocation_t> pLocationList)
		{
			return _parties.GetAvailableBeaconLocations(pLocationList.Ptr, (.)pLocationList.Length);
		}

		[NoDiscard]
		public static SteamAPICall_t CreateBeacon(uint32 unOpenSlots, ref SteamPartyBeaconLocation_t pBeaconLocation, StringView pchConnectString, StringView pchMetadata)
		{
			return _parties.CreateBeacon(unOpenSlots, &pBeaconLocation, TerminateString!(pchConnectString), TerminateString!(pchMetadata));
		}

		public static void OnReservationCompleted(PartyBeaconID_t ulBeacon, CSteamID steamIDUser)
		{
			_parties.OnReservationCompleted(ulBeacon, steamIDUser);
		}

		public static void CancelReservation(PartyBeaconID_t ulBeacon, CSteamID steamIDUser)
		{
			_parties.CancelReservation(ulBeacon, steamIDUser);
		}

		[NoDiscard]
		public static SteamAPICall_t ChangeNumOpenSlots(PartyBeaconID_t ulBeacon, uint32 unOpenSlots)
		{
			return _parties.ChangeNumOpenSlots(ulBeacon, unOpenSlots);
		}

		public static bool DestroyBeacon(PartyBeaconID_t ulBeacon)
		{
			return _parties.DestroyBeacon(ulBeacon);
		}

		public static bool GetBeaconLocationData(SteamPartyBeaconLocation_t BeaconLocation, ESteamPartyBeaconLocationData eData, Span<char8> pchDataStringOut)
		{
			return _parties.GetBeaconLocationData(BeaconLocation, eData, pchDataStringOut.Ptr, (.)pchDataStringOut.Length);
		}
	}
}
