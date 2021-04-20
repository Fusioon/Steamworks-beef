using System;

namespace Steamworks
{
	[CRepr]
	public struct SteamServersConnected_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 101;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct SteamServerConnectFailure_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 102;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public bool bStillRetrying;
	}

	[CRepr]
	public struct SteamServersDisconnected_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 103;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct ClientGameServerDeny_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 113;
		public static int32 CallbackId => CALLBACK_ID;
		public uint32 uAppID;
		public uint32 unGameServerIP;
		public uint16 usGameServerPort;
		public uint16 bSecure;
		public uint32 uReason;
	}

	[CRepr]
	public struct IPCFailure_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 117;
		public static int32 CallbackId => CALLBACK_ID;
		public enum EFailureType : int32
		{
			FlushedCallbackQueue = 0,
			PipeFail = 1,
		}

		public uint8 eFailureType;
	}

	[CRepr]
	public struct LicensesUpdated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 125;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct ValidateAuthTicketResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 143;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID SteamID;
		public EAuthSessionResponse eAuthSessionResponse;
		public CSteamID OwnerSteamID;
	}

	[CRepr]
	public struct MicroTxnAuthorizationResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 152;
		public static int32 CallbackId => CALLBACK_ID;
		public uint32 unAppID;
		public uint64 ulOrderID;
		public uint8 bAuthorized;
	}

	[CRepr]
	public struct EncryptedAppTicketResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 154;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct GetAuthSessionTicketResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 163;
		public static int32 CallbackId => CALLBACK_ID;
		public HAuthTicket hAuthTicket;
		public EResult eResult;
	}

	[CRepr]
	public struct GameWebCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 164;
		public static int32 CallbackId => CALLBACK_ID;
		public char8[256] szURL;
	}

	[CRepr]
	public struct StoreAuthURLResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 165;
		public static int32 CallbackId => CALLBACK_ID;
		public char8[512] szURL;
	}

	[CRepr]
	public struct MarketEligibilityResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 166;
		public static int32 CallbackId => CALLBACK_ID;
		public bool bAllowed;
		public EMarketNotAllowedReasonFlags eNotAllowedReason;
		public RTime32 rtAllowedAtTime;
		public int32 cdaySteamGuardRequiredDays;
		public int32 cdayNewDeviceCooldown;
	}

	[CRepr]
	public struct DurationControl_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 167;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public AppId_t appid;
		public bool bApplicable;
		public int32 csecsLast5h;
		public EDurationControlProgress progress;
		public EDurationControlNotification notification;
		public int32 csecsToday;
		public int32 csecsRemaining;
	}

	[CRepr]
	public struct PersonaStateChange_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 304;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamID;
		public int32 nChangeFlags;
	}

	[CRepr]
	public struct GameOverlayActivated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 331;
		public static int32 CallbackId => CALLBACK_ID;
		public uint8 bActive;
	}

	[CRepr]
	public struct GameServerChangeRequested_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 332;
		public static int32 CallbackId => CALLBACK_ID;
		public char8[64] rgchServer;
		public char8[64] rgchPassword;
	}

	[CRepr]
	public struct GameLobbyJoinRequested_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 333;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDLobby;
		public CSteamID steamIDFriend;
	}

	[CRepr]
	public struct AvatarImageLoaded_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 334;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamID;
		public int32 iImage;
		public int32 iWide;
		public int32 iTall;
	}

	[CRepr]
	public struct ClanOfficerListResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 335;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDClan;
		public int32 cOfficers;
		public uint8 bSuccess;
	}

	[CRepr]
	public struct FriendRichPresenceUpdate_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 336;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDFriend;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct GameRichPresenceJoinRequested_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 337;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDFriend;
		public char8[256] rgchConnect;
	}

	[CRepr]
	public struct GameConnectedClanChatMsg_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 338;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDClanChat;
		public CSteamID steamIDUser;
		public int32 iMessageID;
	}

	[CRepr]
	public struct GameConnectedChatJoin_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 339;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDClanChat;
		public CSteamID steamIDUser;
	}

	[CRepr]
	public struct GameConnectedChatLeave_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 340;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDClanChat;
		public CSteamID steamIDUser;
		public bool bKicked;
		public bool bDropped;
	}

	[CRepr]
	public struct DownloadClanActivityCountsResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 341;
		public static int32 CallbackId => CALLBACK_ID;
		public bool bSuccess;
	}

	[CRepr]
	public struct JoinClanChatRoomCompletionResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 342;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDClanChat;
		public EChatRoomEnterResponse eChatRoomEnterResponse;
	}

	[CRepr]
	public struct GameConnectedFriendChatMsg_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 343;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDUser;
		public int32 iMessageID;
	}

	[CRepr]
	public struct FriendsGetFollowerCount_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 344;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public CSteamID steamID;
		public int32 nCount;
	}

	[CRepr]
	public struct FriendsIsFollowing_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 345;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public CSteamID steamID;
		public bool bIsFollowing;
	}

	[CRepr]
	public struct FriendsEnumerateFollowingList_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 346;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public CSteamID[50] rgSteamID;
		public int32 nResultsReturned;
		public int32 nTotalResultCount;
	}

	[CRepr]
	public struct SetPersonaNameResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 347;
		public static int32 CallbackId => CALLBACK_ID;
		public bool bSuccess;
		public bool bLocalSuccess;
		public EResult result;
	}

	[CRepr]
	public struct UnreadChatMessagesChanged_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 348;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct OverlayBrowserProtocolNavigation_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 349;
		public static int32 CallbackId => CALLBACK_ID;
		public char8[1024] rgchURI;
	}

	[CRepr]
	public struct IPCountry_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 701;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct LowBatteryPower_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 702;
		public static int32 CallbackId => CALLBACK_ID;
		public uint8 nMinutesBatteryLeft;
	}

	[CRepr]
	public struct SteamAPICallCompleted_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 703;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamAPICall_t hAsyncCall;
		public int32 iCallback;
		public uint32 cubParam;
	}

	[CRepr]
	public struct SteamShutdown_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 704;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct CheckFileSignature_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 705;
		public static int32 CallbackId => CALLBACK_ID;
		public ECheckFileSignature eCheckFileSignature;
	}

	[CRepr]
	public struct GamepadTextInputDismissed_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 714;
		public static int32 CallbackId => CALLBACK_ID;
		public bool bSubmitted;
		public uint32 unSubmittedText;
	}

	[CRepr]
	public struct FavoritesListChanged_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 502;
		public static int32 CallbackId => CALLBACK_ID;
		public uint32 nIP;
		public uint32 nQueryPort;
		public uint32 nConnPort;
		public uint32 nAppID;
		public uint32 nFlags;
		public bool bAdd;
		public AccountID_t unAccountId;
	}

	[CRepr]
	public struct LobbyInvite_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 503;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamIDUser;
		public uint64 ulSteamIDLobby;
		public uint64 ulGameID;
	}

	[CRepr]
	public struct LobbyEnter_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 504;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamIDLobby;
		public uint32 rgfChatPermissions;
		public bool bLocked;
		public uint32 EChatRoomEnterResponse;
	}

	[CRepr]
	public struct LobbyDataUpdate_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 505;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamIDLobby;
		public uint64 ulSteamIDMember;
		public uint8 bSuccess;
	}

	[CRepr]
	public struct LobbyChatUpdate_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 506;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamIDLobby;
		public uint64 ulSteamIDUserChanged;
		public uint64 ulSteamIDMakingChange;
		public uint32 rgfChatMemberStateChange;
	}

	[CRepr]
	public struct LobbyChatMsg_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 507;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamIDLobby;
		public uint64 ulSteamIDUser;
		public uint8 eChatEntryType;
		public uint32 iChatID;
	}

	[CRepr]
	public struct LobbyGameCreated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 509;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamIDLobby;
		public uint64 ulSteamIDGameServer;
		public uint32 unIP;
		public uint16 usPort;
	}

	[CRepr]
	public struct LobbyMatchList_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 510;
		public static int32 CallbackId => CALLBACK_ID;
		public uint32 nLobbiesMatching;
	}

	[CRepr]
	public struct LobbyKicked_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 512;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ulSteamIDLobby;
		public uint64 ulSteamIDAdmin;
		public uint8 bKickedDueToDisconnect;
	}

	[CRepr]
	public struct LobbyCreated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 513;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint64 ulSteamIDLobby;
	}

	[CRepr]
	public struct PSNGameBootInviteResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 515;
		public static int32 CallbackId => CALLBACK_ID;
		public bool bGameBootInviteExists;
		public CSteamID steamIDLobby;
	}

	[CRepr]
	public struct FavoritesListAccountsUpdated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 516;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct SearchForGameProgressCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5201;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ullSearchID;
		public EResult eResult;
		public CSteamID lobbyID;
		public CSteamID steamIDEndedSearch;
		public int32 nSecondsRemainingEstimate;
		public int32 cPlayersSearching;
	}

	[CRepr]
	public struct SearchForGameResultCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5202;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 ullSearchID;
		public EResult eResult;
		public int32 nCountPlayersInGame;
		public int32 nCountAcceptedGame;
		public CSteamID steamIDHost;
		public bool bFinalCallback;
	}

	[CRepr]
	public struct RequestPlayersForGameProgressCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5211;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint64 ullSearchID;
	}

	[CRepr]
	public struct RequestPlayersForGameResultCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5212;
		public static int32 CallbackId => CALLBACK_ID;
		public enum PlayerAcceptState_t : int32
		{
			Unknown = 0,
			Accepted = 1,
			Declined = 2,
		}

		public EResult eResult;
		public uint64 ullSearchID;
		public CSteamID SteamIDPlayerFound;
		public CSteamID SteamIDLobby;
		public PlayerAcceptState_t m_ePlayerAcceptState;
		public int32 nPlayerIndex;
		public int32 nTotalPlayersFound;
		public int32 nTotalPlayersAcceptedGame;
		public int32 nSuggestedTeamIndex;
		public uint64 ullUniqueGameID;
	}

	[CRepr]
	public struct RequestPlayersForGameFinalResultCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5213;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint64 ullSearchID;
		public uint64 ullUniqueGameID;
	}

	[CRepr]
	public struct SubmitPlayerResultResultCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5214;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint64 ullUniqueGameID;
		public CSteamID steamIDPlayer;
	}

	[CRepr]
	public struct EndGameResultCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5215;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint64 ullUniqueGameID;
	}

	[CRepr]
	public struct JoinPartyCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5301;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PartyBeaconID_t ulBeaconID;
		public CSteamID SteamIDBeaconOwner;
		public char8[256] rgchConnectString;
	}

	[CRepr]
	public struct CreateBeaconCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5302;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PartyBeaconID_t ulBeaconID;
	}

	[CRepr]
	public struct ReservationNotificationCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5303;
		public static int32 CallbackId => CALLBACK_ID;
		public PartyBeaconID_t ulBeaconID;
		public CSteamID steamIDJoiner;
	}

	[CRepr]
	public struct ChangeNumOpenSlotsCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5304;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct AvailableBeaconLocationsUpdated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5305;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct ActiveBeaconsUpdated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5306;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct RemoteStorageAppSyncedClient_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1301;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t nAppID;
		public EResult eResult;
		public int32 unNumDownloads;
	}

	[CRepr]
	public struct RemoteStorageAppSyncedServer_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1302;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t nAppID;
		public EResult eResult;
		public int32 unNumUploads;
	}

	[CRepr]
	public struct RemoteStorageAppSyncProgress_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1303;
		public static int32 CallbackId => CALLBACK_ID;
		public char8[260] rgchCurrentFile;
		public AppId_t nAppID;
		public uint32 uBytesTransferredThisChunk;
		public double dAppPercentComplete;
		public bool bUploading;
	}

	[CRepr]
	public struct RemoteStorageAppSyncStatusCheck_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1305;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t nAppID;
		public EResult eResult;
	}

	[CRepr]
	public struct RemoteStorageFileShareResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1307;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public UGCHandle_t hFile;
		public char8[260] rgchFilename;
	}

	[CRepr]
	public struct RemoteStoragePublishFileResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1309;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public bool bUserNeedsToAcceptWorkshopLegalAgreement;
	}

	[CRepr]
	public struct RemoteStorageDeletePublishedFileResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1311;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
	}

	[CRepr]
	public struct RemoteStorageEnumerateUserPublishedFilesResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1312;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public int32 nResultsReturned;
		public int32 nTotalResultCount;
		public PublishedFileId_t[50] rgPublishedFileId;
	}

	[CRepr]
	public struct RemoteStorageSubscribePublishedFileResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1313;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
	}

	[CRepr]
	public struct RemoteStorageEnumerateUserSubscribedFilesResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1314;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public int32 nResultsReturned;
		public int32 nTotalResultCount;
		public PublishedFileId_t[50] rgPublishedFileId;
		public uint32[50] rgRTimeSubscribed;
	}

	[CRepr]
	public struct RemoteStorageUnsubscribePublishedFileResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1315;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
	}

	[CRepr]
	public struct RemoteStorageUpdatePublishedFileResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1316;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public bool bUserNeedsToAcceptWorkshopLegalAgreement;
	}

	[CRepr]
	public struct RemoteStorageDownloadUGCResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1317;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public UGCHandle_t hFile;
		public AppId_t nAppID;
		public int32 nSizeInBytes;
		public char8[260] pchFileName;
		public uint64 ulSteamIDOwner;
	}

	[CRepr]
	public struct RemoteStorageGetPublishedFileDetailsResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1318;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t nCreatorAppID;
		public AppId_t nConsumerAppID;
		public char8[129] rgchTitle;
		public char8[8000] rgchDescription;
		public UGCHandle_t hFile;
		public UGCHandle_t hPreviewFile;
		public uint64 ulSteamIDOwner;
		public uint32 rtimeCreated;
		public uint32 rtimeUpdated;
		public ERemoteStoragePublishedFileVisibility eVisibility;
		public bool bBanned;
		public char8[1025] rgchTags;
		public bool bTagsTruncated;
		public char8[260] pchFileName;
		public int32 nFileSize;
		public int32 nPreviewFileSize;
		public char8[256] rgchURL;
		public EWorkshopFileType eFileType;
		public bool bAcceptedForUse;
	}

	[CRepr]
	public struct RemoteStorageEnumerateWorkshopFilesResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1319;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public int32 nResultsReturned;
		public int32 nTotalResultCount;
		public PublishedFileId_t[50] rgPublishedFileId;
		public float[50] rgScore;
		public AppId_t nAppId;
		public uint32 unStartIndex;
	}

	[CRepr]
	public struct RemoteStorageGetPublishedItemVoteDetailsResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1320;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t unPublishedFileId;
		public int32 nVotesFor;
		public int32 nVotesAgainst;
		public int32 nReports;
		public float fScore;
	}

	[CRepr]
	public struct RemoteStoragePublishedFileSubscribed_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1321;
		public static int32 CallbackId => CALLBACK_ID;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct RemoteStoragePublishedFileUnsubscribed_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1322;
		public static int32 CallbackId => CALLBACK_ID;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct RemoteStoragePublishedFileDeleted_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1323;
		public static int32 CallbackId => CALLBACK_ID;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct RemoteStorageUpdateUserPublishedItemVoteResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1324;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
	}

	[CRepr]
	public struct RemoteStorageUserVoteDetails_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1325;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public EWorkshopVote eVote;
	}

	[CRepr]
	public struct RemoteStorageEnumerateUserSharedWorkshopFilesResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1326;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public int32 nResultsReturned;
		public int32 nTotalResultCount;
		public PublishedFileId_t[50] rgPublishedFileId;
	}

	[CRepr]
	public struct RemoteStorageSetUserPublishedFileActionResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1327;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public EWorkshopFileAction eAction;
	}

	[CRepr]
	public struct RemoteStorageEnumeratePublishedFilesByUserActionResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1328;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public EWorkshopFileAction eAction;
		public int32 nResultsReturned;
		public int32 nTotalResultCount;
		public PublishedFileId_t[50] rgPublishedFileId;
		public uint32[50] rgRTimeUpdated;
	}

	[CRepr]
	public struct RemoteStoragePublishFileProgress_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1329;
		public static int32 CallbackId => CALLBACK_ID;
		public double dPercentFile;
		public bool bPreview;
	}

	[CRepr]
	public struct RemoteStoragePublishedFileUpdated_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1330;
		public static int32 CallbackId => CALLBACK_ID;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t nAppID;
		public uint64 ulUnused;
	}

	[CRepr]
	public struct RemoteStorageFileWriteAsyncComplete_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1331;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct RemoteStorageFileReadAsyncComplete_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1332;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamAPICall_t hFileReadAsync;
		public EResult eResult;
		public uint32 nOffset;
		public uint32 cubRead;
	}

	[CRepr]
	public struct UserStatsReceived_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1101;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 nGameID;
		public EResult eResult;
		public CSteamID steamIDUser;
	}

	[CRepr]
	public struct UserStatsStored_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1102;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 nGameID;
		public EResult eResult;
	}

	[CRepr]
	public struct UserAchievementStored_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1103;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 nGameID;
		public bool bGroupAchievement;
		public char8[128] rgchAchievementName;
		public uint32 nCurProgress;
		public uint32 nMaxProgress;
	}

	[CRepr]
	public struct LeaderboardFindResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1104;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamLeaderboard_t hSteamLeaderboard;
		public uint8 bLeaderboardFound;
	}

	[CRepr]
	public struct LeaderboardScoresDownloaded_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1105;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamLeaderboard_t hSteamLeaderboard;
		public SteamLeaderboardEntries_t hSteamLeaderboardEntries;
		public int32 cEntryCount;
	}

	[CRepr]
	public struct LeaderboardScoreUploaded_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1106;
		public static int32 CallbackId => CALLBACK_ID;
		public uint8 bSuccess;
		public SteamLeaderboard_t hSteamLeaderboard;
		public int32 nScore;
		public uint8 bScoreChanged;
		public int32 nGlobalRankNew;
		public int32 nGlobalRankPrevious;
	}

	[CRepr]
	public struct NumberOfCurrentPlayers_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1107;
		public static int32 CallbackId => CALLBACK_ID;
		public uint8 bSuccess;
		public int32 cPlayers;
	}

	[CRepr]
	public struct UserStatsUnloaded_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1108;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDUser;
	}

	[CRepr]
	public struct UserAchievementIconFetched_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1109;
		public static int32 CallbackId => CALLBACK_ID;
		public CGameID nGameID;
		public char8[128] rgchAchievementName;
		public bool bAchieved;
		public int32 nIconHandle;
	}

	[CRepr]
	public struct GlobalAchievementPercentagesReady_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1110;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 nGameID;
		public EResult eResult;
	}

	[CRepr]
	public struct LeaderboardUGCSet_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1111;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public SteamLeaderboard_t hSteamLeaderboard;
	}

	[CRepr]
	public struct PS3TrophiesInstalled_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1112;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 nGameID;
		public EResult eResult;
		public uint64 ulRequiredDiskSpace;
	}

	[CRepr]
	public struct GlobalStatsReceived_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1112;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 nGameID;
		public EResult eResult;
	}

	[CRepr]
	public struct DlcInstalled_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1005;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct RegisterActivationCodeResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1008;
		public static int32 CallbackId => CALLBACK_ID;
		public ERegisterActivationCodeResult eResult;
		public uint32 unPackageRegistered;
	}

	[CRepr]
	public struct NewUrlLaunchParameters_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1014;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct AppProofOfPurchaseKeyResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1021;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint32 nAppID;
		public uint32 cchKeyLength;
		public char8[240] rgchKey;
	}

	[CRepr]
	public struct FileDetailsResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1023;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint64 ulFileSize;
		public uint8[20] FileSHA;
		public uint32 unFlags;
	}

	[CRepr]
	public struct TimedTrialStatus_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1030;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t unAppID;
		public bool bIsOffline;
		public uint32 unSecondsAllowed;
		public uint32 unSecondsPlayed;
	}

	[CRepr]
	public struct P2PSessionRequest_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1202;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDRemote;
	}

	[CRepr]
	public struct P2PSessionConnectFail_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1203;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDRemote;
		public uint8 eP2PSessionError;
	}

	[CRepr]
	public struct SocketStatusCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1201;
		public static int32 CallbackId => CALLBACK_ID;
		public SNetSocket_t hSocket;
		public SNetListenSocket_t hListenSocket;
		public CSteamID steamIDRemote;
		public int32 eSNetSocketState;
	}

	[CRepr]
	public struct ScreenshotReady_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 2301;
		public static int32 CallbackId => CALLBACK_ID;
		public ScreenshotHandle hLocal;
		public EResult eResult;
	}

	[CRepr]
	public struct ScreenshotRequested_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 2302;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct PlaybackStatusHasChanged_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4001;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct VolumeHasChanged_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4002;
		public static int32 CallbackId => CALLBACK_ID;
		public float flNewVolume;
	}

	[CRepr]
	public struct MusicPlayerRemoteWillActivate_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4101;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerRemoteWillDeactivate_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4102;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerRemoteToFront_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4103;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerWillQuit_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4104;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerWantsPlay_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4105;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerWantsPause_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4106;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerWantsPlayPrevious_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4107;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerWantsPlayNext_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4108;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct MusicPlayerWantsShuffled_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4109;
		public static int32 CallbackId => CALLBACK_ID;
		public bool bShuffled;
	}

	[CRepr]
	public struct MusicPlayerWantsLooped_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4110;
		public static int32 CallbackId => CALLBACK_ID;
		public bool bLooped;
	}

	[CRepr]
	public struct MusicPlayerWantsVolume_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4011;
		public static int32 CallbackId => CALLBACK_ID;
		public float flNewVolume;
	}

	[CRepr]
	public struct MusicPlayerSelectsQueueEntry_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4012;
		public static int32 CallbackId => CALLBACK_ID;
		public int32 nID;
	}

	[CRepr]
	public struct MusicPlayerSelectsPlaylistEntry_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4013;
		public static int32 CallbackId => CALLBACK_ID;
		public int32 nID;
	}

	[CRepr]
	public struct MusicPlayerWantsPlayingRepeatStatus_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4114;
		public static int32 CallbackId => CALLBACK_ID;
		public int32 nPlayingRepeatStatus;
	}

	[CRepr]
	public struct HTTPRequestCompleted_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 2101;
		public static int32 CallbackId => CALLBACK_ID;
		public HTTPRequestHandle hRequest;
		public uint64 ulContextValue;
		public bool bRequestSuccessful;
		public EHTTPStatusCode eStatusCode;
		public uint32 unBodySize;
	}

	[CRepr]
	public struct HTTPRequestHeadersReceived_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 2102;
		public static int32 CallbackId => CALLBACK_ID;
		public HTTPRequestHandle hRequest;
		public uint64 ulContextValue;
	}

	[CRepr]
	public struct HTTPRequestDataReceived_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 2103;
		public static int32 CallbackId => CALLBACK_ID;
		public HTTPRequestHandle hRequest;
		public uint64 ulContextValue;
		public uint32 cOffset;
		public uint32 cBytesReceived;
	}

	[CRepr]
	public struct SteamUGCQueryCompleted_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3401;
		public static int32 CallbackId => CALLBACK_ID;
		public UGCQueryHandle_t handle;
		public EResult eResult;
		public uint32 unNumResultsReturned;
		public uint32 unTotalMatchingResults;
		public bool bCachedData;
		public char8[256] rgchNextCursor;
	}

	[CRepr]
	public struct SteamUGCRequestUGCDetailsResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3402;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamUGCDetails_t details;
		public bool bCachedData;
	}

	[CRepr]
	public struct CreateItemResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3403;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public bool bUserNeedsToAcceptWorkshopLegalAgreement;
	}

	[CRepr]
	public struct SubmitItemUpdateResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3404;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public bool bUserNeedsToAcceptWorkshopLegalAgreement;
		public PublishedFileId_t nPublishedFileId;
	}

	[CRepr]
	public struct ItemInstalled_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3405;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t unAppID;
		public PublishedFileId_t nPublishedFileId;
	}

	[CRepr]
	public struct DownloadItemResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3406;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t unAppID;
		public PublishedFileId_t nPublishedFileId;
		public EResult eResult;
	}

	[CRepr]
	public struct UserFavoriteItemsListChanged_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3407;
		public static int32 CallbackId => CALLBACK_ID;
		public PublishedFileId_t nPublishedFileId;
		public EResult eResult;
		public bool bWasAddRequest;
	}

	[CRepr]
	public struct SetUserItemVoteResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3408;
		public static int32 CallbackId => CALLBACK_ID;
		public PublishedFileId_t nPublishedFileId;
		public EResult eResult;
		public bool bVoteUp;
	}

	[CRepr]
	public struct GetUserItemVoteResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3409;
		public static int32 CallbackId => CALLBACK_ID;
		public PublishedFileId_t nPublishedFileId;
		public EResult eResult;
		public bool bVotedUp;
		public bool bVotedDown;
		public bool bVoteSkipped;
	}

	[CRepr]
	public struct StartPlaytimeTrackingResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3410;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct StopPlaytimeTrackingResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3411;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct AddUGCDependencyResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3412;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public PublishedFileId_t nChildPublishedFileId;
	}

	[CRepr]
	public struct RemoveUGCDependencyResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3413;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public PublishedFileId_t nChildPublishedFileId;
	}

	[CRepr]
	public struct AddAppDependencyResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3414;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct RemoveAppDependencyResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3415;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct GetAppDependenciesResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3416;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
		public AppId_t[32] rgAppIDs;
		public uint32 nNumAppDependencies;
		public uint32 nTotalNumAppDependencies;
	}

	[CRepr]
	public struct DeleteItemResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3417;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public PublishedFileId_t nPublishedFileId;
	}

	[CRepr]
	public struct SteamAppInstalled_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3901;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct SteamAppUninstalled_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 3902;
		public static int32 CallbackId => CALLBACK_ID;
		public AppId_t nAppID;
	}

	[CRepr]
	public struct HTML_BrowserReady_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4501;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
	}

	[CRepr]
	public struct HTML_NeedsPaint_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4502;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pBGRA;
		public uint32 unWide;
		public uint32 unTall;
		public uint32 unUpdateX;
		public uint32 unUpdateY;
		public uint32 unUpdateWide;
		public uint32 unUpdateTall;
		public uint32 unScrollX;
		public uint32 unScrollY;
		public float flPageScale;
		public uint32 unPageSerial;
	}

	[CRepr]
	public struct HTML_StartRequest_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4503;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchURL;
		public char8* pchTarget;
		public char8* pchPostData;
		public bool bIsRedirect;
	}

	[CRepr]
	public struct HTML_CloseBrowser_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4504;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
	}

	[CRepr]
	public struct HTML_URLChanged_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4505;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchURL;
		public char8* pchPostData;
		public bool bIsRedirect;
		public char8* pchPageTitle;
		public bool bNewNavigation;
	}

	[CRepr]
	public struct HTML_FinishedRequest_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4506;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchURL;
		public char8* pchPageTitle;
	}

	[CRepr]
	public struct HTML_OpenLinkInNewTab_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4507;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchURL;
	}

	[CRepr]
	public struct HTML_ChangedTitle_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4508;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchTitle;
	}

	[CRepr]
	public struct HTML_SearchResults_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4509;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public uint32 unResults;
		public uint32 unCurrentMatch;
	}

	[CRepr]
	public struct HTML_CanGoBackAndForward_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4510;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public bool bCanGoBack;
		public bool bCanGoForward;
	}

	[CRepr]
	public struct HTML_HorizontalScroll_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4511;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public uint32 unScrollMax;
		public uint32 unScrollCurrent;
		public float flPageScale;
		public bool bVisible;
		public uint32 unPageSize;
	}

	[CRepr]
	public struct HTML_VerticalScroll_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4512;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public uint32 unScrollMax;
		public uint32 unScrollCurrent;
		public float flPageScale;
		public bool bVisible;
		public uint32 unPageSize;
	}

	[CRepr]
	public struct HTML_LinkAtPosition_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4513;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public uint32 x;
		public uint32 y;
		public char8* pchURL;
		public bool bInput;
		public bool bLiveLink;
	}

	[CRepr]
	public struct HTML_JSAlert_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4514;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchMessage;
	}

	[CRepr]
	public struct HTML_JSConfirm_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4515;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchMessage;
	}

	[CRepr]
	public struct HTML_FileOpenDialog_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4516;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchTitle;
		public char8* pchInitialFile;
	}

	[CRepr]
	public struct HTML_NewWindow_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4521;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchURL;
		public uint32 unX;
		public uint32 unY;
		public uint32 unWide;
		public uint32 unTall;
		public HHTMLBrowser unNewWindow_BrowserHandle_IGNORE;
	}

	[CRepr]
	public struct HTML_SetCursor_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4522;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public uint32 eMouseCursor;
	}

	[CRepr]
	public struct HTML_StatusText_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4523;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchMsg;
	}

	[CRepr]
	public struct HTML_ShowToolTip_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4524;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchMsg;
	}

	[CRepr]
	public struct HTML_UpdateToolTip_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4525;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public char8* pchMsg;
	}

	[CRepr]
	public struct HTML_HideToolTip_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4526;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
	}

	[CRepr]
	public struct HTML_BrowserRestarted_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4527;
		public static int32 CallbackId => CALLBACK_ID;
		public HHTMLBrowser unBrowserHandle;
		public HHTMLBrowser unOldBrowserHandle;
	}

	[CRepr]
	public struct SteamInventoryResultReady_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4700;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamInventoryResult_t handle;
		public EResult result;
	}

	[CRepr]
	public struct SteamInventoryFullUpdate_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4701;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamInventoryResult_t handle;
	}

	[CRepr]
	public struct SteamInventoryDefinitionUpdate_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4702;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct SteamInventoryEligiblePromoItemDefIDs_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4703;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult result;
		public CSteamID steamID;
		public int32 numEligiblePromoItemDefs;
		public bool bCachedData;
	}

	[CRepr]
	public struct SteamInventoryStartPurchaseResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4704;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult result;
		public uint64 ulOrderID;
		public uint64 ulTransID;
	}

	[CRepr]
	public struct SteamInventoryRequestPricesResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4705;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult result;
		public char8[4] rgchCurrency;
	}

	[CRepr]
	public struct GetVideoURLResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4611;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public AppId_t unVideoAppID;
		public char8[256] rgchURL;
	}

	[CRepr]
	public struct GetOPFSettingsResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 4624;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public AppId_t unVideoAppID;
	}

	[CRepr]
	public struct SteamParentalSettingsChanged_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5001;
		public static int32 CallbackId => CALLBACK_ID;
	}

	[CRepr]
	public struct SteamRemotePlaySessionConnected_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5701;
		public static int32 CallbackId => CALLBACK_ID;
		public RemotePlaySessionID_t unSessionID;
	}

	[CRepr]
	public struct SteamRemotePlaySessionDisconnected_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 5702;
		public static int32 CallbackId => CALLBACK_ID;
		public RemotePlaySessionID_t unSessionID;
	}

	[CRepr]
	public struct SteamNetworkingMessagesSessionRequest_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1251;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamNetworkingIdentity identityRemote;
	}

	[CRepr]
	public struct SteamNetworkingMessagesSessionFailed_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1252;
		public static int32 CallbackId => CALLBACK_ID;
		public SteamNetConnectionInfo_t info;
	}

	[CRepr]
	public struct SteamNetConnectionStatusChangedCallback_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1221;
		public static int32 CallbackId => CALLBACK_ID;
		public HSteamNetConnection hConn;
		public SteamNetConnectionInfo_t info;
		public ESteamNetworkingConnectionState eOldState;
	}

	[CRepr]
	public struct SteamNetAuthenticationStatus_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1222;
		public static int32 CallbackId => CALLBACK_ID;
		public ESteamNetworkingAvailability eAvail;
		public char8[256] debugMsg;
	}

	[CRepr]
	public struct SteamRelayNetworkStatus_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1281;
		public static int32 CallbackId => CALLBACK_ID;
		public ESteamNetworkingAvailability eAvail;
		public int32 bPingMeasurementInProgress;
		public ESteamNetworkingAvailability eAvailNetworkConfig;
		public ESteamNetworkingAvailability eAvailAnyRelay;
		public char8[256] debugMsg;
	}

	[CRepr]
	public struct GSClientApprove_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 201;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID SteamID;
		public CSteamID OwnerSteamID;
	}

	[CRepr]
	public struct GSClientDeny_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 202;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID SteamID;
		public EDenyReason eDenyReason;
		public char8[128] rgchOptionalText;
	}

	[CRepr]
	public struct GSClientKick_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 203;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID SteamID;
		public EDenyReason eDenyReason;
	}

	[CRepr]
	public struct GSClientAchievementStatus_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 206;
		public static int32 CallbackId => CALLBACK_ID;
		public uint64 SteamID;
		public char8[128] pchAchievement;
		public bool bUnlocked;
	}

	[CRepr]
	public struct GSPolicyResponse_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 115;
		public static int32 CallbackId => CALLBACK_ID;
		public uint8 bSecure;
	}

	[CRepr]
	public struct GSGameplayStats_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 207;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public int32 nRank;
		public uint32 unTotalConnects;
		public uint32 unTotalMinutesPlayed;
	}

	[CRepr]
	public struct GSClientGroupStatus_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 208;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID SteamIDUser;
		public CSteamID SteamIDGroup;
		public bool bMember;
		public bool bOfficer;
	}

	[CRepr]
	public struct GSReputation_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 209;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public uint32 unReputationScore;
		public bool bBanned;
		public uint32 unBannedIP;
		public uint16 usBannedPort;
		public uint64 ulBannedGameID;
		public uint32 unBanExpires;
	}

	[CRepr]
	public struct AssociateWithClanResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 210;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
	}

	[CRepr]
	public struct ComputeNewPlayerCompatibilityResult_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 211;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public int32 cPlayersThatDontLikeCandidate;
		public int32 cPlayersThatCandidateDoesntLike;
		public int32 cClanPlayersThatDontLikeCandidate;
		public CSteamID SteamIDCandidate;
	}

	[CRepr]
	public struct GSStatsReceived_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1800;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public CSteamID steamIDUser;
	}

	[CRepr]
	public struct GSStatsStored_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1801;
		public static int32 CallbackId => CALLBACK_ID;
		public EResult eResult;
		public CSteamID steamIDUser;
	}

	[CRepr]
	public struct GSStatsUnloaded_t : ICallbackStruct
	{
		public const int32 CALLBACK_ID = 1108;
		public static int32 CallbackId => CALLBACK_ID;
		public CSteamID steamIDUser;
	}


}