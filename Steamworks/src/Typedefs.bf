using System;

namespace Steamworks
{
	public typealias Salt_t = uint8[8];
	public struct GID_t : uint64 {}
	public struct JobID_t : uint64 {}
	public struct TxnID_t : uint64 {}
	public struct PackageId_t : uint32 {}
	public struct BundleId_t : uint32 {}
	public struct AppId_t : uint32 {}
	public struct AssetClassId_t : uint64 {}
	public struct PhysicalItemId_t : uint32 {}
	public struct DepotId_t : uint32 {}
	public typealias RTime32 = uint32;
	public struct CellID_t : uint32 {}
	public struct SteamAPICall_t : uint64 {}
	public struct AccountID_t : uint32 {}
	public struct PartnerId_t : uint32 {}
	public struct ManifestId_t : uint64 {}
	public struct SiteId_t : uint64 {}
	public struct PartyBeaconID_t : uint64 {}
	public struct HAuthTicket : uint32 {}
	public function void PFNLegacyKeyRegistration(char8* arg1,char8* arg2);
	public function bool PFNLegacyKeyInstalled();
	public function void PFNPreMinidumpCallback(void* arg1);
	public typealias BREAKPAD_HANDLE = void*;
	public struct HSteamPipe : int32 {}
	public struct HSteamUser : int32 {}
	public struct FriendsGroupID_t : int16 {}
	public typealias HServerListRequest = void*;
	public struct HServerQuery : int32 {}
	public struct UGCHandle_t : uint64 {}
	public struct PublishedFileUpdateHandle_t : uint64 {}
	public struct PublishedFileId_t : uint64 {}
	public struct UGCFileWriteStreamHandle_t : uint64 {}
	public struct SteamLeaderboard_t : uint64 {}
	public struct SteamLeaderboardEntries_t : uint64 {}
	public struct SNetSocket_t : uint32 {}
	public struct SNetListenSocket_t : uint32 {}
	public struct ScreenshotHandle : uint32 {}
	public struct HTTPRequestHandle : uint32 {}
	public struct HTTPCookieContainerHandle : uint32 {}
	public struct InputHandle_t : uint64 {}
	public struct InputActionSetHandle_t : uint64 {}
	public struct InputDigitalActionHandle_t : uint64 {}
	public struct InputAnalogActionHandle_t : uint64 {}
	public struct ControllerHandle_t : uint64 {}
	public struct ControllerActionSetHandle_t : uint64 {}
	public struct ControllerDigitalActionHandle_t : uint64 {}
	public struct ControllerAnalogActionHandle_t : uint64 {}
	public struct UGCQueryHandle_t : uint64 {}
	public struct UGCUpdateHandle_t : uint64 {}
	public struct HHTMLBrowser : uint32 {}
	public struct SteamItemInstanceID_t : uint64 {}
	public struct SteamItemDef_t : int32 {}
	public struct SteamInventoryResult_t : int32 {}
	public struct SteamInventoryUpdateHandle_t : uint64 {}
	public struct RemotePlaySessionID_t : uint32 {}
	public function void FnSteamNetConnectionStatusChanged(SteamNetConnectionStatusChangedCallback_t* arg1);
	public function void FnSteamNetAuthenticationStatusChanged(SteamNetAuthenticationStatus_t* arg1);
	public function void FnSteamRelayNetworkStatusChanged(SteamRelayNetworkStatus_t* arg1);
	public function void FnSteamNetworkingMessagesSessionRequest(SteamNetworkingMessagesSessionRequest_t* arg1);
	public function void FnSteamNetworkingMessagesSessionFailed(SteamNetworkingMessagesSessionFailed_t* arg1);
	public struct HSteamNetConnection : uint32 {}
	public struct HSteamListenSocket : uint32 {}
	public struct HSteamNetPollGroup : uint32 {}
	public typealias SteamNetworkingErrMsg = char8[1024];
	public typealias SteamNetworkingPOPID = uint32;
	public typealias SteamNetworkingMicroseconds = int64;
	public function void FSteamNetworkingSocketsDebugOutput(ESteamNetworkingSocketsDebugOutputType arg1,char8* arg2);

}