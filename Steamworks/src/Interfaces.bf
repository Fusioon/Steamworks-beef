using System;

namespace Steamworks
{
	public struct ISteamClient : uint
	{
		[LinkName("SteamAPI_ISteamClient_CreateSteamPipe")]
		public extern HSteamPipe CreateSteamPipe();
		[LinkName("SteamAPI_ISteamClient_BReleaseSteamPipe")]
		public extern bool BReleaseSteamPipe(HSteamPipe hSteamPipe);
		[LinkName("SteamAPI_ISteamClient_ConnectToGlobalUser")]
		public extern HSteamUser ConnectToGlobalUser(HSteamPipe hSteamPipe);
		[LinkName("SteamAPI_ISteamClient_CreateLocalUser")]
		public extern HSteamUser CreateLocalUser(HSteamPipe* phSteamPipe,EAccountType eAccountType);
		[LinkName("SteamAPI_ISteamClient_ReleaseUser")]
		public extern void ReleaseUser(HSteamPipe hSteamPipe,HSteamUser hUser);
		[LinkName("SteamAPI_ISteamClient_GetISteamUser")]
		public extern ISteamUser* GetISteamUser(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamGameServer")]
		public extern ISteamGameServer* GetISteamGameServer(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_SetLocalIPBinding")]
		public extern void SetLocalIPBinding(in SteamIPAddress_t unIP,uint16 usPort);
		[LinkName("SteamAPI_ISteamClient_GetISteamFriends")]
		public extern ISteamFriends* GetISteamFriends(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamUtils")]
		public extern ISteamUtils* GetISteamUtils(HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamMatchmaking")]
		public extern ISteamMatchmaking* GetISteamMatchmaking(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamMatchmakingServers")]
		public extern ISteamMatchmakingServers* GetISteamMatchmakingServers(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamGenericInterface")]
		public extern void* GetISteamGenericInterface(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamUserStats")]
		public extern ISteamUserStats* GetISteamUserStats(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamGameServerStats")]
		public extern ISteamGameServerStats* GetISteamGameServerStats(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamApps")]
		public extern ISteamApps* GetISteamApps(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamNetworking")]
		public extern ISteamNetworking* GetISteamNetworking(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamRemoteStorage")]
		public extern ISteamRemoteStorage* GetISteamRemoteStorage(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamScreenshots")]
		public extern ISteamScreenshots* GetISteamScreenshots(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamGameSearch")]
		public extern ISteamGameSearch* GetISteamGameSearch(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetIPCCallCount")]
		public extern uint32 GetIPCCallCount();
		[LinkName("SteamAPI_ISteamClient_SetWarningMessageHook")]
		public extern void SetWarningMessageHook(SteamAPIWarningMessageHook_t pFunction);
		[LinkName("SteamAPI_ISteamClient_BShutdownIfAllPipesClosed")]
		public extern bool BShutdownIfAllPipesClosed();
		[LinkName("SteamAPI_ISteamClient_GetISteamHTTP")]
		public extern ISteamHTTP* GetISteamHTTP(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamController")]
		public extern ISteamController* GetISteamController(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamUGC")]
		public extern ISteamUGC* GetISteamUGC(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamAppList")]
		public extern ISteamAppList* GetISteamAppList(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamMusic")]
		public extern ISteamMusic* GetISteamMusic(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamMusicRemote")]
		public extern ISteamMusicRemote* GetISteamMusicRemote(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamHTMLSurface")]
		public extern ISteamHTMLSurface* GetISteamHTMLSurface(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamInventory")]
		public extern ISteamInventory* GetISteamInventory(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamVideo")]
		public extern ISteamVideo* GetISteamVideo(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamParentalSettings")]
		public extern ISteamParentalSettings* GetISteamParentalSettings(HSteamUser hSteamuser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamInput")]
		public extern ISteamInput* GetISteamInput(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamParties")]
		public extern ISteamParties* GetISteamParties(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
		[LinkName("SteamAPI_ISteamClient_GetISteamRemotePlay")]
		public extern ISteamRemotePlay* GetISteamRemotePlay(HSteamUser hSteamUser,HSteamPipe hSteamPipe,char8* pchVersion);
	}
	public struct ISteamUser : uint
	{
		[LinkName("SteamAPI_ISteamUser_GetHSteamUser")]
		public extern HSteamUser GetHSteamUser();
		[LinkName("SteamAPI_ISteamUser_BLoggedOn")]
		public extern bool BLoggedOn();
		[LinkName("SteamAPI_ISteamUser_GetSteamID")]
		public extern CSteamID GetSteamID();
		[LinkName("SteamAPI_ISteamUser_InitiateGameConnection")]
		public extern int32 InitiateGameConnection(void* pAuthBlob,int32 cbMaxAuthBlob,CSteamID steamIDGameServer,uint32 unIPServer,uint16 usPortServer,bool bSecure);
		[LinkName("SteamAPI_ISteamUser_TerminateGameConnection")]
		public extern void TerminateGameConnection(uint32 unIPServer,uint16 usPortServer);
		[LinkName("SteamAPI_ISteamUser_TrackAppUsageEvent")]
		public extern void TrackAppUsageEvent(CGameID gameID,int32 eAppUsageEvent,char8* pchExtraInfo);
		[LinkName("SteamAPI_ISteamUser_GetUserDataFolder")]
		public extern bool GetUserDataFolder(char8* pchBuffer,int32 cubBuffer);
		[LinkName("SteamAPI_ISteamUser_StartVoiceRecording")]
		public extern void StartVoiceRecording();
		[LinkName("SteamAPI_ISteamUser_StopVoiceRecording")]
		public extern void StopVoiceRecording();
		[LinkName("SteamAPI_ISteamUser_GetAvailableVoice")]
		public extern EVoiceResult GetAvailableVoice(uint32* pcbCompressed,uint32* pcbUncompressed_Deprecated,uint32 nUncompressedVoiceDesiredSampleRate_Deprecated);
		[LinkName("SteamAPI_ISteamUser_GetVoice")]
		public extern EVoiceResult GetVoice(bool bWantCompressed,void* pDestBuffer,uint32 cbDestBufferSize,uint32* nBytesWritten,bool bWantUncompressed_Deprecated,void* pUncompressedDestBuffer_Deprecated,uint32 cbUncompressedDestBufferSize_Deprecated,uint32* nUncompressBytesWritten_Deprecated,uint32 nUncompressedVoiceDesiredSampleRate_Deprecated);
		[LinkName("SteamAPI_ISteamUser_DecompressVoice")]
		public extern EVoiceResult DecompressVoice(void* pCompressed,uint32 cbCompressed,void* pDestBuffer,uint32 cbDestBufferSize,uint32* nBytesWritten,uint32 nDesiredSampleRate);
		[LinkName("SteamAPI_ISteamUser_GetVoiceOptimalSampleRate")]
		public extern uint32 GetVoiceOptimalSampleRate();
		[LinkName("SteamAPI_ISteamUser_GetAuthSessionTicket")]
		public extern HAuthTicket GetAuthSessionTicket(void* pTicket,int32 cbMaxTicket,uint32* pcbTicket);
		[LinkName("SteamAPI_ISteamUser_BeginAuthSession")]
		public extern EBeginAuthSessionResult BeginAuthSession(void* pAuthTicket,int32 cbAuthTicket,CSteamID steamID);
		[LinkName("SteamAPI_ISteamUser_EndAuthSession")]
		public extern void EndAuthSession(CSteamID steamID);
		[LinkName("SteamAPI_ISteamUser_CancelAuthTicket")]
		public extern void CancelAuthTicket(HAuthTicket hAuthTicket);
		[LinkName("SteamAPI_ISteamUser_UserHasLicenseForApp")]
		public extern EUserHasLicenseForAppResult UserHasLicenseForApp(CSteamID steamID,AppId_t appID);
		[LinkName("SteamAPI_ISteamUser_BIsBehindNAT")]
		public extern bool BIsBehindNAT();
		[LinkName("SteamAPI_ISteamUser_AdvertiseGame")]
		public extern void AdvertiseGame(CSteamID steamIDGameServer,uint32 unIPServer,uint16 usPortServer);
		[LinkName("SteamAPI_ISteamUser_RequestEncryptedAppTicket")]
		public extern SteamAPICall_t RequestEncryptedAppTicket(void* pDataToInclude,int32 cbDataToInclude);
		[LinkName("SteamAPI_ISteamUser_GetEncryptedAppTicket")]
		public extern bool GetEncryptedAppTicket(void* pTicket,int32 cbMaxTicket,uint32* pcbTicket);
		[LinkName("SteamAPI_ISteamUser_GetGameBadgeLevel")]
		public extern int32 GetGameBadgeLevel(int32 nSeries,bool bFoil);
		[LinkName("SteamAPI_ISteamUser_GetPlayerSteamLevel")]
		public extern int32 GetPlayerSteamLevel();
		[LinkName("SteamAPI_ISteamUser_RequestStoreAuthURL")]
		public extern SteamAPICall_t RequestStoreAuthURL(char8* pchRedirectURL);
		[LinkName("SteamAPI_ISteamUser_BIsPhoneVerified")]
		public extern bool BIsPhoneVerified();
		[LinkName("SteamAPI_ISteamUser_BIsTwoFactorEnabled")]
		public extern bool BIsTwoFactorEnabled();
		[LinkName("SteamAPI_ISteamUser_BIsPhoneIdentifying")]
		public extern bool BIsPhoneIdentifying();
		[LinkName("SteamAPI_ISteamUser_BIsPhoneRequiringVerification")]
		public extern bool BIsPhoneRequiringVerification();
		[LinkName("SteamAPI_ISteamUser_GetMarketEligibility")]
		public extern SteamAPICall_t GetMarketEligibility();
		[LinkName("SteamAPI_ISteamUser_GetDurationControl")]
		public extern SteamAPICall_t GetDurationControl();
		[LinkName("SteamAPI_ISteamUser_BSetDurationControlOnlineState")]
		public extern bool BSetDurationControlOnlineState(EDurationControlOnlineState eNewState);
	}
	public struct ISteamFriends : uint
	{
		[LinkName("SteamAPI_ISteamFriends_GetPersonaName")]
		public extern char8* GetPersonaName();
		[LinkName("SteamAPI_ISteamFriends_SetPersonaName")]
		public extern SteamAPICall_t SetPersonaName(char8* pchPersonaName);
		[LinkName("SteamAPI_ISteamFriends_GetPersonaState")]
		public extern EPersonaState GetPersonaState();
		[LinkName("SteamAPI_ISteamFriends_GetFriendCount")]
		public extern int32 GetFriendCount(int32 iFriendFlags);
		[LinkName("SteamAPI_ISteamFriends_GetFriendByIndex")]
		public extern CSteamID GetFriendByIndex(int32 iFriend,int32 iFriendFlags);
		[LinkName("SteamAPI_ISteamFriends_GetFriendRelationship")]
		public extern EFriendRelationship GetFriendRelationship(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetFriendPersonaState")]
		public extern EPersonaState GetFriendPersonaState(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetFriendPersonaName")]
		public extern char8* GetFriendPersonaName(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetFriendGamePlayed")]
		public extern bool GetFriendGamePlayed(CSteamID steamIDFriend,FriendGameInfo_t* pFriendGameInfo);
		[LinkName("SteamAPI_ISteamFriends_GetFriendPersonaNameHistory")]
		public extern char8* GetFriendPersonaNameHistory(CSteamID steamIDFriend,int32 iPersonaName);
		[LinkName("SteamAPI_ISteamFriends_GetFriendSteamLevel")]
		public extern int32 GetFriendSteamLevel(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetPlayerNickname")]
		public extern char8* GetPlayerNickname(CSteamID steamIDPlayer);
		[LinkName("SteamAPI_ISteamFriends_GetFriendsGroupCount")]
		public extern int32 GetFriendsGroupCount();
		[LinkName("SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex")]
		public extern FriendsGroupID_t GetFriendsGroupIDByIndex(int32 iFG);
		[LinkName("SteamAPI_ISteamFriends_GetFriendsGroupName")]
		public extern char8* GetFriendsGroupName(FriendsGroupID_t friendsGroupID);
		[LinkName("SteamAPI_ISteamFriends_GetFriendsGroupMembersCount")]
		public extern int32 GetFriendsGroupMembersCount(FriendsGroupID_t friendsGroupID);
		[LinkName("SteamAPI_ISteamFriends_GetFriendsGroupMembersList")]
		public extern void GetFriendsGroupMembersList(FriendsGroupID_t friendsGroupID,CSteamID* pOutSteamIDMembers,int32 nMembersCount);
		[LinkName("SteamAPI_ISteamFriends_HasFriend")]
		public extern bool HasFriend(CSteamID steamIDFriend,int32 iFriendFlags);
		[LinkName("SteamAPI_ISteamFriends_GetClanCount")]
		public extern int32 GetClanCount();
		[LinkName("SteamAPI_ISteamFriends_GetClanByIndex")]
		public extern CSteamID GetClanByIndex(int32 iClan);
		[LinkName("SteamAPI_ISteamFriends_GetClanName")]
		public extern char8* GetClanName(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetClanTag")]
		public extern char8* GetClanTag(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetClanActivityCounts")]
		public extern bool GetClanActivityCounts(CSteamID steamIDClan,int32* pnOnline,int32* pnInGame,int32* pnChatting);
		[LinkName("SteamAPI_ISteamFriends_DownloadClanActivityCounts")]
		public extern SteamAPICall_t DownloadClanActivityCounts(CSteamID* psteamIDClans,int32 cClansToRequest);
		[LinkName("SteamAPI_ISteamFriends_GetFriendCountFromSource")]
		public extern int32 GetFriendCountFromSource(CSteamID steamIDSource);
		[LinkName("SteamAPI_ISteamFriends_GetFriendFromSourceByIndex")]
		public extern CSteamID GetFriendFromSourceByIndex(CSteamID steamIDSource,int32 iFriend);
		[LinkName("SteamAPI_ISteamFriends_IsUserInSource")]
		public extern bool IsUserInSource(CSteamID steamIDUser,CSteamID steamIDSource);
		[LinkName("SteamAPI_ISteamFriends_SetInGameVoiceSpeaking")]
		public extern void SetInGameVoiceSpeaking(CSteamID steamIDUser,bool bSpeaking);
		[LinkName("SteamAPI_ISteamFriends_ActivateGameOverlay")]
		public extern void ActivateGameOverlay(char8* pchDialog);
		[LinkName("SteamAPI_ISteamFriends_ActivateGameOverlayToUser")]
		public extern void ActivateGameOverlayToUser(char8* pchDialog,CSteamID steamID);
		[LinkName("SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage")]
		public extern void ActivateGameOverlayToWebPage(char8* pchURL,EActivateGameOverlayToWebPageMode eMode);
		[LinkName("SteamAPI_ISteamFriends_ActivateGameOverlayToStore")]
		public extern void ActivateGameOverlayToStore(AppId_t nAppID,EOverlayToStoreFlag eFlag);
		[LinkName("SteamAPI_ISteamFriends_SetPlayedWith")]
		public extern void SetPlayedWith(CSteamID steamIDUserPlayedWith);
		[LinkName("SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog")]
		public extern void ActivateGameOverlayInviteDialog(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamFriends_GetSmallFriendAvatar")]
		public extern int32 GetSmallFriendAvatar(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetMediumFriendAvatar")]
		public extern int32 GetMediumFriendAvatar(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetLargeFriendAvatar")]
		public extern int32 GetLargeFriendAvatar(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_RequestUserInformation")]
		public extern bool RequestUserInformation(CSteamID steamIDUser,bool bRequireNameOnly);
		[LinkName("SteamAPI_ISteamFriends_RequestClanOfficerList")]
		public extern SteamAPICall_t RequestClanOfficerList(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetClanOwner")]
		public extern CSteamID GetClanOwner(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetClanOfficerCount")]
		public extern int32 GetClanOfficerCount(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetClanOfficerByIndex")]
		public extern CSteamID GetClanOfficerByIndex(CSteamID steamIDClan,int32 iOfficer);
		[LinkName("SteamAPI_ISteamFriends_GetUserRestrictions")]
		public extern uint32 GetUserRestrictions();
		[LinkName("SteamAPI_ISteamFriends_SetRichPresence")]
		public extern bool SetRichPresence(char8* pchKey,char8* pchValue);
		[LinkName("SteamAPI_ISteamFriends_ClearRichPresence")]
		public extern void ClearRichPresence();
		[LinkName("SteamAPI_ISteamFriends_GetFriendRichPresence")]
		public extern char8* GetFriendRichPresence(CSteamID steamIDFriend,char8* pchKey);
		[LinkName("SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount")]
		public extern int32 GetFriendRichPresenceKeyCount(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex")]
		public extern char8* GetFriendRichPresenceKeyByIndex(CSteamID steamIDFriend,int32 iKey);
		[LinkName("SteamAPI_ISteamFriends_RequestFriendRichPresence")]
		public extern void RequestFriendRichPresence(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_InviteUserToGame")]
		public extern bool InviteUserToGame(CSteamID steamIDFriend,char8* pchConnectString);
		[LinkName("SteamAPI_ISteamFriends_GetCoplayFriendCount")]
		public extern int32 GetCoplayFriendCount();
		[LinkName("SteamAPI_ISteamFriends_GetCoplayFriend")]
		public extern CSteamID GetCoplayFriend(int32 iCoplayFriend);
		[LinkName("SteamAPI_ISteamFriends_GetFriendCoplayTime")]
		public extern int32 GetFriendCoplayTime(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_GetFriendCoplayGame")]
		public extern AppId_t GetFriendCoplayGame(CSteamID steamIDFriend);
		[LinkName("SteamAPI_ISteamFriends_JoinClanChatRoom")]
		public extern SteamAPICall_t JoinClanChatRoom(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_LeaveClanChatRoom")]
		public extern bool LeaveClanChatRoom(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetClanChatMemberCount")]
		public extern int32 GetClanChatMemberCount(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetChatMemberByIndex")]
		public extern CSteamID GetChatMemberByIndex(CSteamID steamIDClan,int32 iUser);
		[LinkName("SteamAPI_ISteamFriends_SendClanChatMessage")]
		public extern bool SendClanChatMessage(CSteamID steamIDClanChat,char8* pchText);
		[LinkName("SteamAPI_ISteamFriends_GetClanChatMessage")]
		public extern int32 GetClanChatMessage(CSteamID steamIDClanChat,int32 iMessage,void* prgchText,int32 cchTextMax,EChatEntryType* peChatEntryType,CSteamID* psteamidChatter);
		[LinkName("SteamAPI_ISteamFriends_IsClanChatAdmin")]
		public extern bool IsClanChatAdmin(CSteamID steamIDClanChat,CSteamID steamIDUser);
		[LinkName("SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam")]
		public extern bool IsClanChatWindowOpenInSteam(CSteamID steamIDClanChat);
		[LinkName("SteamAPI_ISteamFriends_OpenClanChatWindowInSteam")]
		public extern bool OpenClanChatWindowInSteam(CSteamID steamIDClanChat);
		[LinkName("SteamAPI_ISteamFriends_CloseClanChatWindowInSteam")]
		public extern bool CloseClanChatWindowInSteam(CSteamID steamIDClanChat);
		[LinkName("SteamAPI_ISteamFriends_SetListenForFriendsMessages")]
		public extern bool SetListenForFriendsMessages(bool bInterceptEnabled);
		[LinkName("SteamAPI_ISteamFriends_ReplyToFriendMessage")]
		public extern bool ReplyToFriendMessage(CSteamID steamIDFriend,char8* pchMsgToSend);
		[LinkName("SteamAPI_ISteamFriends_GetFriendMessage")]
		public extern int32 GetFriendMessage(CSteamID steamIDFriend,int32 iMessageID,void* pvData,int32 cubData,EChatEntryType* peChatEntryType);
		[LinkName("SteamAPI_ISteamFriends_GetFollowerCount")]
		public extern SteamAPICall_t GetFollowerCount(CSteamID steamID);
		[LinkName("SteamAPI_ISteamFriends_IsFollowing")]
		public extern SteamAPICall_t IsFollowing(CSteamID steamID);
		[LinkName("SteamAPI_ISteamFriends_EnumerateFollowingList")]
		public extern SteamAPICall_t EnumerateFollowingList(uint32 unStartIndex);
		[LinkName("SteamAPI_ISteamFriends_IsClanPublic")]
		public extern bool IsClanPublic(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_IsClanOfficialGameGroup")]
		public extern bool IsClanOfficialGameGroup(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages")]
		public extern int32 GetNumChatsWithUnreadPriorityMessages();
		[LinkName("SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog")]
		public extern void ActivateGameOverlayRemotePlayTogetherInviteDialog(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser")]
		public extern bool RegisterProtocolInOverlayBrowser(char8* pchProtocol);
		[LinkName("SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString")]
		public extern void ActivateGameOverlayInviteDialogConnectString(char8* pchConnectString);
	}
	public struct ISteamUtils : uint
	{
		[LinkName("SteamAPI_ISteamUtils_GetSecondsSinceAppActive")]
		public extern uint32 GetSecondsSinceAppActive();
		[LinkName("SteamAPI_ISteamUtils_GetSecondsSinceComputerActive")]
		public extern uint32 GetSecondsSinceComputerActive();
		[LinkName("SteamAPI_ISteamUtils_GetConnectedUniverse")]
		public extern EUniverse GetConnectedUniverse();
		[LinkName("SteamAPI_ISteamUtils_GetServerRealTime")]
		public extern uint32 GetServerRealTime();
		[LinkName("SteamAPI_ISteamUtils_GetIPCountry")]
		public extern char8* GetIPCountry();
		[LinkName("SteamAPI_ISteamUtils_GetImageSize")]
		public extern bool GetImageSize(int32 iImage,uint32* pnWidth,uint32* pnHeight);
		[LinkName("SteamAPI_ISteamUtils_GetImageRGBA")]
		public extern bool GetImageRGBA(int32 iImage,uint8* pubDest,int32 nDestBufferSize);
		[LinkName("SteamAPI_ISteamUtils_GetCurrentBatteryPower")]
		public extern uint8 GetCurrentBatteryPower();
		[LinkName("SteamAPI_ISteamUtils_GetAppID")]
		public extern uint32 GetAppID();
		[LinkName("SteamAPI_ISteamUtils_SetOverlayNotificationPosition")]
		public extern void SetOverlayNotificationPosition(ENotificationPosition eNotificationPosition);
		[LinkName("SteamAPI_ISteamUtils_IsAPICallCompleted")]
		public extern bool IsAPICallCompleted(SteamAPICall_t hSteamAPICall,bool* pbFailed);
		[LinkName("SteamAPI_ISteamUtils_GetAPICallFailureReason")]
		public extern ESteamAPICallFailure GetAPICallFailureReason(SteamAPICall_t hSteamAPICall);
		[LinkName("SteamAPI_ISteamUtils_GetAPICallResult")]
		public extern bool GetAPICallResult(SteamAPICall_t hSteamAPICall,void* pCallback,int32 cubCallback,int32 iCallbackExpected,bool* pbFailed);
		[LinkName("SteamAPI_ISteamUtils_GetIPCCallCount")]
		public extern uint32 GetIPCCallCount();
		[LinkName("SteamAPI_ISteamUtils_SetWarningMessageHook")]
		public extern void SetWarningMessageHook(SteamAPIWarningMessageHook_t pFunction);
		[LinkName("SteamAPI_ISteamUtils_IsOverlayEnabled")]
		public extern bool IsOverlayEnabled();
		[LinkName("SteamAPI_ISteamUtils_BOverlayNeedsPresent")]
		public extern bool BOverlayNeedsPresent();
		[LinkName("SteamAPI_ISteamUtils_CheckFileSignature")]
		public extern SteamAPICall_t CheckFileSignature(char8* szFileName);
		[LinkName("SteamAPI_ISteamUtils_ShowGamepadTextInput")]
		public extern bool ShowGamepadTextInput(EGamepadTextInputMode eInputMode,EGamepadTextInputLineMode eLineInputMode,char8* pchDescription,uint32 unCharMax,char8* pchExistingText);
		[LinkName("SteamAPI_ISteamUtils_GetEnteredGamepadTextLength")]
		public extern uint32 GetEnteredGamepadTextLength();
		[LinkName("SteamAPI_ISteamUtils_GetEnteredGamepadTextInput")]
		public extern bool GetEnteredGamepadTextInput(char8* pchText,uint32 cchText);
		[LinkName("SteamAPI_ISteamUtils_GetSteamUILanguage")]
		public extern char8* GetSteamUILanguage();
		[LinkName("SteamAPI_ISteamUtils_IsSteamRunningInVR")]
		public extern bool IsSteamRunningInVR();
		[LinkName("SteamAPI_ISteamUtils_SetOverlayNotificationInset")]
		public extern void SetOverlayNotificationInset(int32 nHorizontalInset,int32 nVerticalInset);
		[LinkName("SteamAPI_ISteamUtils_IsSteamInBigPictureMode")]
		public extern bool IsSteamInBigPictureMode();
		[LinkName("SteamAPI_ISteamUtils_StartVRDashboard")]
		public extern void StartVRDashboard();
		[LinkName("SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled")]
		public extern bool IsVRHeadsetStreamingEnabled();
		[LinkName("SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled")]
		public extern void SetVRHeadsetStreamingEnabled(bool bEnabled);
		[LinkName("SteamAPI_ISteamUtils_IsSteamChinaLauncher")]
		public extern bool IsSteamChinaLauncher();
		[LinkName("SteamAPI_ISteamUtils_InitFilterText")]
		public extern bool InitFilterText(uint32 unFilterOptions);
		[LinkName("SteamAPI_ISteamUtils_FilterText")]
		public extern int32 FilterText(ETextFilteringContext eContext,CSteamID sourceSteamID,char8* pchInputMessage,char8* pchOutFilteredText,uint32 nByteSizeOutFilteredText);
		[LinkName("SteamAPI_ISteamUtils_GetIPv6ConnectivityState")]
		public extern ESteamIPv6ConnectivityState GetIPv6ConnectivityState(ESteamIPv6ConnectivityProtocol eProtocol);
	}
	public struct ISteamMatchmaking : uint
	{
		[LinkName("SteamAPI_ISteamMatchmaking_GetFavoriteGameCount")]
		public extern int32 GetFavoriteGameCount();
		[LinkName("SteamAPI_ISteamMatchmaking_GetFavoriteGame")]
		public extern bool GetFavoriteGame(int32 iGame,AppId_t* pnAppID,uint32* pnIP,uint16* pnConnPort,uint16* pnQueryPort,uint32* punFlags,uint32* pRTime32LastPlayedOnServer);
		[LinkName("SteamAPI_ISteamMatchmaking_AddFavoriteGame")]
		public extern int32 AddFavoriteGame(AppId_t nAppID,uint32 nIP,uint16 nConnPort,uint16 nQueryPort,uint32 unFlags,uint32 rTime32LastPlayedOnServer);
		[LinkName("SteamAPI_ISteamMatchmaking_RemoveFavoriteGame")]
		public extern bool RemoveFavoriteGame(AppId_t nAppID,uint32 nIP,uint16 nConnPort,uint16 nQueryPort,uint32 unFlags);
		[LinkName("SteamAPI_ISteamMatchmaking_RequestLobbyList")]
		public extern SteamAPICall_t RequestLobbyList();
		[LinkName("SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter")]
		public extern void AddRequestLobbyListStringFilter(char8* pchKeyToMatch,char8* pchValueToMatch,ELobbyComparison eComparisonType);
		[LinkName("SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter")]
		public extern void AddRequestLobbyListNumericalFilter(char8* pchKeyToMatch,int32 nValueToMatch,ELobbyComparison eComparisonType);
		[LinkName("SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter")]
		public extern void AddRequestLobbyListNearValueFilter(char8* pchKeyToMatch,int32 nValueToBeCloseTo);
		[LinkName("SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable")]
		public extern void AddRequestLobbyListFilterSlotsAvailable(int32 nSlotsAvailable);
		[LinkName("SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter")]
		public extern void AddRequestLobbyListDistanceFilter(ELobbyDistanceFilter eLobbyDistanceFilter);
		[LinkName("SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter")]
		public extern void AddRequestLobbyListResultCountFilter(int32 cMaxResults);
		[LinkName("SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter")]
		public extern void AddRequestLobbyListCompatibleMembersFilter(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyByIndex")]
		public extern CSteamID GetLobbyByIndex(int32 iLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_CreateLobby")]
		public extern SteamAPICall_t CreateLobby(ELobbyType eLobbyType,int32 cMaxMembers);
		[LinkName("SteamAPI_ISteamMatchmaking_JoinLobby")]
		public extern SteamAPICall_t JoinLobby(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_LeaveLobby")]
		public extern void LeaveLobby(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_InviteUserToLobby")]
		public extern bool InviteUserToLobby(CSteamID steamIDLobby,CSteamID steamIDInvitee);
		[LinkName("SteamAPI_ISteamMatchmaking_GetNumLobbyMembers")]
		public extern int32 GetNumLobbyMembers(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex")]
		public extern CSteamID GetLobbyMemberByIndex(CSteamID steamIDLobby,int32 iMember);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyData")]
		public extern char8* GetLobbyData(CSteamID steamIDLobby,char8* pchKey);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLobbyData")]
		public extern bool SetLobbyData(CSteamID steamIDLobby,char8* pchKey,char8* pchValue);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyDataCount")]
		public extern int32 GetLobbyDataCount(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex")]
		public extern bool GetLobbyDataByIndex(CSteamID steamIDLobby,int32 iLobbyData,char8* pchKey,int32 cchKeyBufferSize,char8* pchValue,int32 cchValueBufferSize);
		[LinkName("SteamAPI_ISteamMatchmaking_DeleteLobbyData")]
		public extern bool DeleteLobbyData(CSteamID steamIDLobby,char8* pchKey);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyMemberData")]
		public extern char8* GetLobbyMemberData(CSteamID steamIDLobby,CSteamID steamIDUser,char8* pchKey);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLobbyMemberData")]
		public extern void SetLobbyMemberData(CSteamID steamIDLobby,char8* pchKey,char8* pchValue);
		[LinkName("SteamAPI_ISteamMatchmaking_SendLobbyChatMsg")]
		public extern bool SendLobbyChatMsg(CSteamID steamIDLobby,void* pvMsgBody,int32 cubMsgBody);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyChatEntry")]
		public extern int32 GetLobbyChatEntry(CSteamID steamIDLobby,int32 iChatID,CSteamID* pSteamIDUser,void* pvData,int32 cubData,EChatEntryType* peChatEntryType);
		[LinkName("SteamAPI_ISteamMatchmaking_RequestLobbyData")]
		public extern bool RequestLobbyData(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLobbyGameServer")]
		public extern void SetLobbyGameServer(CSteamID steamIDLobby,uint32 unGameServerIP,uint16 unGameServerPort,CSteamID steamIDGameServer);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyGameServer")]
		public extern bool GetLobbyGameServer(CSteamID steamIDLobby,uint32* punGameServerIP,uint16* punGameServerPort,CSteamID* psteamIDGameServer);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit")]
		public extern bool SetLobbyMemberLimit(CSteamID steamIDLobby,int32 cMaxMembers);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit")]
		public extern int32 GetLobbyMemberLimit(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLobbyType")]
		public extern bool SetLobbyType(CSteamID steamIDLobby,ELobbyType eLobbyType);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLobbyJoinable")]
		public extern bool SetLobbyJoinable(CSteamID steamIDLobby,bool bLobbyJoinable);
		[LinkName("SteamAPI_ISteamMatchmaking_GetLobbyOwner")]
		public extern CSteamID GetLobbyOwner(CSteamID steamIDLobby);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLobbyOwner")]
		public extern bool SetLobbyOwner(CSteamID steamIDLobby,CSteamID steamIDNewOwner);
		[LinkName("SteamAPI_ISteamMatchmaking_SetLinkedLobby")]
		public extern bool SetLinkedLobby(CSteamID steamIDLobby,CSteamID steamIDLobbyDependent);
	}
	public struct ISteamMatchmakingServerListResponse : uint
	{
		[LinkName("SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded")]
		public extern void ServerResponded(HServerListRequest hRequest,int32 iServer);
		[LinkName("SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond")]
		public extern void ServerFailedToRespond(HServerListRequest hRequest,int32 iServer);
		[LinkName("SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete")]
		public extern void RefreshComplete(HServerListRequest hRequest,EMatchMakingServerResponse response);
	}
	public struct ISteamMatchmakingPingResponse : uint
	{
		[LinkName("SteamAPI_ISteamMatchmakingPingResponse_ServerResponded")]
		public extern void ServerResponded(ref gameserveritem_t server);
		[LinkName("SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond")]
		public extern void ServerFailedToRespond();
	}
	public struct ISteamMatchmakingPlayersResponse : uint
	{
		[LinkName("SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList")]
		public extern void AddPlayerToList(char8* pchName,int32 nScore,float flTimePlayed);
		[LinkName("SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond")]
		public extern void PlayersFailedToRespond();
		[LinkName("SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete")]
		public extern void PlayersRefreshComplete();
	}
	public struct ISteamMatchmakingRulesResponse : uint
	{
		[LinkName("SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded")]
		public extern void RulesResponded(char8* pchRule,char8* pchValue);
		[LinkName("SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond")]
		public extern void RulesFailedToRespond();
		[LinkName("SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete")]
		public extern void RulesRefreshComplete();
	}
	public struct ISteamMatchmakingServers : uint
	{
		[LinkName("SteamAPI_ISteamMatchmakingServers_RequestInternetServerList")]
		public extern HServerListRequest RequestInternetServerList(AppId_t iApp,MatchMakingKeyValuePair_t** ppchFilters,uint32 nFilters,ISteamMatchmakingServerListResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_RequestLANServerList")]
		public extern HServerListRequest RequestLANServerList(AppId_t iApp,ISteamMatchmakingServerListResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList")]
		public extern HServerListRequest RequestFriendsServerList(AppId_t iApp,MatchMakingKeyValuePair_t** ppchFilters,uint32 nFilters,ISteamMatchmakingServerListResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList")]
		public extern HServerListRequest RequestFavoritesServerList(AppId_t iApp,MatchMakingKeyValuePair_t** ppchFilters,uint32 nFilters,ISteamMatchmakingServerListResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList")]
		public extern HServerListRequest RequestHistoryServerList(AppId_t iApp,MatchMakingKeyValuePair_t** ppchFilters,uint32 nFilters,ISteamMatchmakingServerListResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList")]
		public extern HServerListRequest RequestSpectatorServerList(AppId_t iApp,MatchMakingKeyValuePair_t** ppchFilters,uint32 nFilters,ISteamMatchmakingServerListResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_ReleaseRequest")]
		public extern void ReleaseRequest(HServerListRequest hServerListRequest);
		[LinkName("SteamAPI_ISteamMatchmakingServers_GetServerDetails")]
		public extern gameserveritem_t* GetServerDetails(HServerListRequest hRequest,int32 iServer);
		[LinkName("SteamAPI_ISteamMatchmakingServers_CancelQuery")]
		public extern void CancelQuery(HServerListRequest hRequest);
		[LinkName("SteamAPI_ISteamMatchmakingServers_RefreshQuery")]
		public extern void RefreshQuery(HServerListRequest hRequest);
		[LinkName("SteamAPI_ISteamMatchmakingServers_IsRefreshing")]
		public extern bool IsRefreshing(HServerListRequest hRequest);
		[LinkName("SteamAPI_ISteamMatchmakingServers_GetServerCount")]
		public extern int32 GetServerCount(HServerListRequest hRequest);
		[LinkName("SteamAPI_ISteamMatchmakingServers_RefreshServer")]
		public extern void RefreshServer(HServerListRequest hRequest,int32 iServer);
		[LinkName("SteamAPI_ISteamMatchmakingServers_PingServer")]
		public extern HServerQuery PingServer(uint32 unIP,uint16 usPort,ISteamMatchmakingPingResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_PlayerDetails")]
		public extern HServerQuery PlayerDetails(uint32 unIP,uint16 usPort,ISteamMatchmakingPlayersResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_ServerRules")]
		public extern HServerQuery ServerRules(uint32 unIP,uint16 usPort,ISteamMatchmakingRulesResponse pRequestServersResponse);
		[LinkName("SteamAPI_ISteamMatchmakingServers_CancelServerQuery")]
		public extern void CancelServerQuery(HServerQuery hServerQuery);
	}
	public struct ISteamGameSearch : uint
	{
		[LinkName("SteamAPI_ISteamGameSearch_AddGameSearchParams")]
		public extern EGameSearchErrorCode_t AddGameSearchParams(char8* pchKeyToFind,char8* pchValuesToFind);
		[LinkName("SteamAPI_ISteamGameSearch_SearchForGameWithLobby")]
		public extern EGameSearchErrorCode_t SearchForGameWithLobby(CSteamID steamIDLobby,int32 nPlayerMin,int32 nPlayerMax);
		[LinkName("SteamAPI_ISteamGameSearch_SearchForGameSolo")]
		public extern EGameSearchErrorCode_t SearchForGameSolo(int32 nPlayerMin,int32 nPlayerMax);
		[LinkName("SteamAPI_ISteamGameSearch_AcceptGame")]
		public extern EGameSearchErrorCode_t AcceptGame();
		[LinkName("SteamAPI_ISteamGameSearch_DeclineGame")]
		public extern EGameSearchErrorCode_t DeclineGame();
		[LinkName("SteamAPI_ISteamGameSearch_RetrieveConnectionDetails")]
		public extern EGameSearchErrorCode_t RetrieveConnectionDetails(CSteamID steamIDHost,char8* pchConnectionDetails,int32 cubConnectionDetails);
		[LinkName("SteamAPI_ISteamGameSearch_EndGameSearch")]
		public extern EGameSearchErrorCode_t EndGameSearch();
		[LinkName("SteamAPI_ISteamGameSearch_SetGameHostParams")]
		public extern EGameSearchErrorCode_t SetGameHostParams(char8* pchKey,char8* pchValue);
		[LinkName("SteamAPI_ISteamGameSearch_SetConnectionDetails")]
		public extern EGameSearchErrorCode_t SetConnectionDetails(char8* pchConnectionDetails,int32 cubConnectionDetails);
		[LinkName("SteamAPI_ISteamGameSearch_RequestPlayersForGame")]
		public extern EGameSearchErrorCode_t RequestPlayersForGame(int32 nPlayerMin,int32 nPlayerMax,int32 nMaxTeamSize);
		[LinkName("SteamAPI_ISteamGameSearch_HostConfirmGameStart")]
		public extern EGameSearchErrorCode_t HostConfirmGameStart(uint64 ullUniqueGameID);
		[LinkName("SteamAPI_ISteamGameSearch_CancelRequestPlayersForGame")]
		public extern EGameSearchErrorCode_t CancelRequestPlayersForGame();
		[LinkName("SteamAPI_ISteamGameSearch_SubmitPlayerResult")]
		public extern EGameSearchErrorCode_t SubmitPlayerResult(uint64 ullUniqueGameID,CSteamID steamIDPlayer,EPlayerResult_t EPlayerResult);
		[LinkName("SteamAPI_ISteamGameSearch_EndGame")]
		public extern EGameSearchErrorCode_t EndGame(uint64 ullUniqueGameID);
	}
	public struct ISteamParties : uint
	{
		[LinkName("SteamAPI_ISteamParties_GetNumActiveBeacons")]
		public extern uint32 GetNumActiveBeacons();
		[LinkName("SteamAPI_ISteamParties_GetBeaconByIndex")]
		public extern PartyBeaconID_t GetBeaconByIndex(uint32 unIndex);
		[LinkName("SteamAPI_ISteamParties_GetBeaconDetails")]
		public extern bool GetBeaconDetails(PartyBeaconID_t ulBeaconID,CSteamID* pSteamIDBeaconOwner,SteamPartyBeaconLocation_t* pLocation,char8* pchMetadata,int32 cchMetadata);
		[LinkName("SteamAPI_ISteamParties_JoinParty")]
		public extern SteamAPICall_t JoinParty(PartyBeaconID_t ulBeaconID);
		[LinkName("SteamAPI_ISteamParties_GetNumAvailableBeaconLocations")]
		public extern bool GetNumAvailableBeaconLocations(uint32* puNumLocations);
		[LinkName("SteamAPI_ISteamParties_GetAvailableBeaconLocations")]
		public extern bool GetAvailableBeaconLocations(SteamPartyBeaconLocation_t* pLocationList,uint32 uMaxNumLocations);
		[LinkName("SteamAPI_ISteamParties_CreateBeacon")]
		public extern SteamAPICall_t CreateBeacon(uint32 unOpenSlots,SteamPartyBeaconLocation_t* pBeaconLocation,char8* pchConnectString,char8* pchMetadata);
		[LinkName("SteamAPI_ISteamParties_OnReservationCompleted")]
		public extern void OnReservationCompleted(PartyBeaconID_t ulBeacon,CSteamID steamIDUser);
		[LinkName("SteamAPI_ISteamParties_CancelReservation")]
		public extern void CancelReservation(PartyBeaconID_t ulBeacon,CSteamID steamIDUser);
		[LinkName("SteamAPI_ISteamParties_ChangeNumOpenSlots")]
		public extern SteamAPICall_t ChangeNumOpenSlots(PartyBeaconID_t ulBeacon,uint32 unOpenSlots);
		[LinkName("SteamAPI_ISteamParties_DestroyBeacon")]
		public extern bool DestroyBeacon(PartyBeaconID_t ulBeacon);
		[LinkName("SteamAPI_ISteamParties_GetBeaconLocationData")]
		public extern bool GetBeaconLocationData(SteamPartyBeaconLocation_t BeaconLocation,ESteamPartyBeaconLocationData eData,char8* pchDataStringOut,int32 cchDataStringOut);
	}
	public struct ISteamRemoteStorage : uint
	{
		[LinkName("SteamAPI_ISteamRemoteStorage_FileWrite")]
		public extern bool FileWrite(char8* pchFile,void* pvData,int32 cubData);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileRead")]
		public extern int32 FileRead(char8* pchFile,void* pvData,int32 cubDataToRead);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileWriteAsync")]
		public extern SteamAPICall_t FileWriteAsync(char8* pchFile,void* pvData,uint32 cubData);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileReadAsync")]
		public extern SteamAPICall_t FileReadAsync(char8* pchFile,uint32 nOffset,uint32 cubToRead);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete")]
		public extern bool FileReadAsyncComplete(SteamAPICall_t hReadCall,void* pvBuffer,uint32 cubToRead);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileForget")]
		public extern bool FileForget(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileDelete")]
		public extern bool FileDelete(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileShare")]
		public extern SteamAPICall_t FileShare(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_SetSyncPlatforms")]
		public extern bool SetSyncPlatforms(char8* pchFile,ERemoteStoragePlatform eRemoteStoragePlatform);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen")]
		public extern UGCFileWriteStreamHandle_t FileWriteStreamOpen(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk")]
		public extern bool FileWriteStreamWriteChunk(UGCFileWriteStreamHandle_t writeHandle,void* pvData,int32 cubData);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileWriteStreamClose")]
		public extern bool FileWriteStreamClose(UGCFileWriteStreamHandle_t writeHandle);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel")]
		public extern bool FileWriteStreamCancel(UGCFileWriteStreamHandle_t writeHandle);
		[LinkName("SteamAPI_ISteamRemoteStorage_FileExists")]
		public extern bool FileExists(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_FilePersisted")]
		public extern bool FilePersisted(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetFileSize")]
		public extern int32 GetFileSize(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetFileTimestamp")]
		public extern int64 GetFileTimestamp(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetSyncPlatforms")]
		public extern ERemoteStoragePlatform GetSyncPlatforms(char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetFileCount")]
		public extern int32 GetFileCount();
		[LinkName("SteamAPI_ISteamRemoteStorage_GetFileNameAndSize")]
		public extern char8* GetFileNameAndSize(int32 iFile,int32* pnFileSizeInBytes);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetQuota")]
		public extern bool GetQuota(uint64* pnTotalBytes,uint64* puAvailableBytes);
		[LinkName("SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount")]
		public extern bool IsCloudEnabledForAccount();
		[LinkName("SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp")]
		public extern bool IsCloudEnabledForApp();
		[LinkName("SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp")]
		public extern void SetCloudEnabledForApp(bool bEnabled);
		[LinkName("SteamAPI_ISteamRemoteStorage_UGCDownload")]
		public extern SteamAPICall_t UGCDownload(UGCHandle_t hContent,uint32 unPriority);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress")]
		public extern bool GetUGCDownloadProgress(UGCHandle_t hContent,int32* pnBytesDownloaded,int32* pnBytesExpected);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetUGCDetails")]
		public extern bool GetUGCDetails(UGCHandle_t hContent,AppId_t* pnAppID,char8** ppchName,int32* pnFileSizeInBytes,CSteamID* pSteamIDOwner);
		[LinkName("SteamAPI_ISteamRemoteStorage_UGCRead")]
		public extern int32 UGCRead(UGCHandle_t hContent,void* pvData,int32 cubDataToRead,uint32 cOffset,EUGCReadAction eAction);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetCachedUGCCount")]
		public extern int32 GetCachedUGCCount();
		[LinkName("SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle")]
		public extern UGCHandle_t GetCachedUGCHandle(int32 iCachedContent);
		[LinkName("SteamAPI_ISteamRemoteStorage_PublishWorkshopFile")]
		public extern SteamAPICall_t PublishWorkshopFile(char8* pchFile,char8* pchPreviewFile,AppId_t nConsumerAppId,char8* pchTitle,char8* pchDescription,ERemoteStoragePublishedFileVisibility eVisibility,SteamParamStringArray_t* pTags,EWorkshopFileType eWorkshopFileType);
		[LinkName("SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest")]
		public extern PublishedFileUpdateHandle_t CreatePublishedFileUpdateRequest(PublishedFileId_t unPublishedFileId);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile")]
		public extern bool UpdatePublishedFileFile(PublishedFileUpdateHandle_t updateHandle,char8* pchFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile")]
		public extern bool UpdatePublishedFilePreviewFile(PublishedFileUpdateHandle_t updateHandle,char8* pchPreviewFile);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle")]
		public extern bool UpdatePublishedFileTitle(PublishedFileUpdateHandle_t updateHandle,char8* pchTitle);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription")]
		public extern bool UpdatePublishedFileDescription(PublishedFileUpdateHandle_t updateHandle,char8* pchDescription);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility")]
		public extern bool UpdatePublishedFileVisibility(PublishedFileUpdateHandle_t updateHandle,ERemoteStoragePublishedFileVisibility eVisibility);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags")]
		public extern bool UpdatePublishedFileTags(PublishedFileUpdateHandle_t updateHandle,SteamParamStringArray_t* pTags);
		[LinkName("SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate")]
		public extern SteamAPICall_t CommitPublishedFileUpdate(PublishedFileUpdateHandle_t updateHandle);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails")]
		public extern SteamAPICall_t GetPublishedFileDetails(PublishedFileId_t unPublishedFileId,uint32 unMaxSecondsOld);
		[LinkName("SteamAPI_ISteamRemoteStorage_DeletePublishedFile")]
		public extern SteamAPICall_t DeletePublishedFile(PublishedFileId_t unPublishedFileId);
		[LinkName("SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles")]
		public extern SteamAPICall_t EnumerateUserPublishedFiles(uint32 unStartIndex);
		[LinkName("SteamAPI_ISteamRemoteStorage_SubscribePublishedFile")]
		public extern SteamAPICall_t SubscribePublishedFile(PublishedFileId_t unPublishedFileId);
		[LinkName("SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles")]
		public extern SteamAPICall_t EnumerateUserSubscribedFiles(uint32 unStartIndex);
		[LinkName("SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile")]
		public extern SteamAPICall_t UnsubscribePublishedFile(PublishedFileId_t unPublishedFileId);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription")]
		public extern bool UpdatePublishedFileSetChangeDescription(PublishedFileUpdateHandle_t updateHandle,char8* pchChangeDescription);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails")]
		public extern SteamAPICall_t GetPublishedItemVoteDetails(PublishedFileId_t unPublishedFileId);
		[LinkName("SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote")]
		public extern SteamAPICall_t UpdateUserPublishedItemVote(PublishedFileId_t unPublishedFileId,bool bVoteUp);
		[LinkName("SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails")]
		public extern SteamAPICall_t GetUserPublishedItemVoteDetails(PublishedFileId_t unPublishedFileId);
		[LinkName("SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles")]
		public extern SteamAPICall_t EnumerateUserSharedWorkshopFiles(CSteamID steamId,uint32 unStartIndex,SteamParamStringArray_t* pRequiredTags,SteamParamStringArray_t* pExcludedTags);
		[LinkName("SteamAPI_ISteamRemoteStorage_PublishVideo")]
		public extern SteamAPICall_t PublishVideo(EWorkshopVideoProvider eVideoProvider,char8* pchVideoAccount,char8* pchVideoIdentifier,char8* pchPreviewFile,AppId_t nConsumerAppId,char8* pchTitle,char8* pchDescription,ERemoteStoragePublishedFileVisibility eVisibility,SteamParamStringArray_t* pTags);
		[LinkName("SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction")]
		public extern SteamAPICall_t SetUserPublishedFileAction(PublishedFileId_t unPublishedFileId,EWorkshopFileAction eAction);
		[LinkName("SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction")]
		public extern SteamAPICall_t EnumeratePublishedFilesByUserAction(EWorkshopFileAction eAction,uint32 unStartIndex);
		[LinkName("SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles")]
		public extern SteamAPICall_t EnumeratePublishedWorkshopFiles(EWorkshopEnumerationType eEnumerationType,uint32 unStartIndex,uint32 unCount,uint32 unDays,SteamParamStringArray_t* pTags,SteamParamStringArray_t* pUserTags);
		[LinkName("SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation")]
		public extern SteamAPICall_t UGCDownloadToLocation(UGCHandle_t hContent,char8* pchLocation,uint32 unPriority);
	}
	public struct ISteamUserStats : uint
	{
		[LinkName("SteamAPI_ISteamUserStats_RequestCurrentStats")]
		public extern bool RequestCurrentStats();
		[LinkName("SteamAPI_ISteamUserStats_GetStatInt32")]
		public extern bool GetStat(char8* pchName,int32* pData);
		[LinkName("SteamAPI_ISteamUserStats_GetStatFloat")]
		public extern bool GetStat(char8* pchName,float* pData);
		[LinkName("SteamAPI_ISteamUserStats_SetStatInt32")]
		public extern bool SetStat(char8* pchName,int32 nData);
		[LinkName("SteamAPI_ISteamUserStats_SetStatFloat")]
		public extern bool SetStat(char8* pchName,float fData);
		[LinkName("SteamAPI_ISteamUserStats_UpdateAvgRateStat")]
		public extern bool UpdateAvgRateStat(char8* pchName,float flCountThisSession,double dSessionLength);
		[LinkName("SteamAPI_ISteamUserStats_GetAchievement")]
		public extern bool GetAchievement(char8* pchName,bool* pbAchieved);
		[LinkName("SteamAPI_ISteamUserStats_SetAchievement")]
		public extern bool SetAchievement(char8* pchName);
		[LinkName("SteamAPI_ISteamUserStats_ClearAchievement")]
		public extern bool ClearAchievement(char8* pchName);
		[LinkName("SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime")]
		public extern bool GetAchievementAndUnlockTime(char8* pchName,bool* pbAchieved,uint32* punUnlockTime);
		[LinkName("SteamAPI_ISteamUserStats_StoreStats")]
		public extern bool StoreStats();
		[LinkName("SteamAPI_ISteamUserStats_GetAchievementIcon")]
		public extern int32 GetAchievementIcon(char8* pchName);
		[LinkName("SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute")]
		public extern char8* GetAchievementDisplayAttribute(char8* pchName,char8* pchKey);
		[LinkName("SteamAPI_ISteamUserStats_IndicateAchievementProgress")]
		public extern bool IndicateAchievementProgress(char8* pchName,uint32 nCurProgress,uint32 nMaxProgress);
		[LinkName("SteamAPI_ISteamUserStats_GetNumAchievements")]
		public extern uint32 GetNumAchievements();
		[LinkName("SteamAPI_ISteamUserStats_GetAchievementName")]
		public extern char8* GetAchievementName(uint32 iAchievement);
		[LinkName("SteamAPI_ISteamUserStats_RequestUserStats")]
		public extern SteamAPICall_t RequestUserStats(CSteamID steamIDUser);
		[LinkName("SteamAPI_ISteamUserStats_GetUserStatInt32")]
		public extern bool GetUserStat(CSteamID steamIDUser,char8* pchName,int32* pData);
		[LinkName("SteamAPI_ISteamUserStats_GetUserStatFloat")]
		public extern bool GetUserStat(CSteamID steamIDUser,char8* pchName,float* pData);
		[LinkName("SteamAPI_ISteamUserStats_GetUserAchievement")]
		public extern bool GetUserAchievement(CSteamID steamIDUser,char8* pchName,bool* pbAchieved);
		[LinkName("SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime")]
		public extern bool GetUserAchievementAndUnlockTime(CSteamID steamIDUser,char8* pchName,bool* pbAchieved,uint32* punUnlockTime);
		[LinkName("SteamAPI_ISteamUserStats_ResetAllStats")]
		public extern bool ResetAllStats(bool bAchievementsToo);
		[LinkName("SteamAPI_ISteamUserStats_FindOrCreateLeaderboard")]
		public extern SteamAPICall_t FindOrCreateLeaderboard(char8* pchLeaderboardName,ELeaderboardSortMethod eLeaderboardSortMethod,ELeaderboardDisplayType eLeaderboardDisplayType);
		[LinkName("SteamAPI_ISteamUserStats_FindLeaderboard")]
		public extern SteamAPICall_t FindLeaderboard(char8* pchLeaderboardName);
		[LinkName("SteamAPI_ISteamUserStats_GetLeaderboardName")]
		public extern char8* GetLeaderboardName(SteamLeaderboard_t hSteamLeaderboard);
		[LinkName("SteamAPI_ISteamUserStats_GetLeaderboardEntryCount")]
		public extern int32 GetLeaderboardEntryCount(SteamLeaderboard_t hSteamLeaderboard);
		[LinkName("SteamAPI_ISteamUserStats_GetLeaderboardSortMethod")]
		public extern ELeaderboardSortMethod GetLeaderboardSortMethod(SteamLeaderboard_t hSteamLeaderboard);
		[LinkName("SteamAPI_ISteamUserStats_GetLeaderboardDisplayType")]
		public extern ELeaderboardDisplayType GetLeaderboardDisplayType(SteamLeaderboard_t hSteamLeaderboard);
		[LinkName("SteamAPI_ISteamUserStats_DownloadLeaderboardEntries")]
		public extern SteamAPICall_t DownloadLeaderboardEntries(SteamLeaderboard_t hSteamLeaderboard,ELeaderboardDataRequest eLeaderboardDataRequest,int32 nRangeStart,int32 nRangeEnd);
		[LinkName("SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers")]
		public extern SteamAPICall_t DownloadLeaderboardEntriesForUsers(SteamLeaderboard_t hSteamLeaderboard,CSteamID* prgUsers,int32 cUsers);
		[LinkName("SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry")]
		public extern bool GetDownloadedLeaderboardEntry(SteamLeaderboardEntries_t hSteamLeaderboardEntries,int32 index,LeaderboardEntry_t* pLeaderboardEntry,int32* pDetails,int32 cDetailsMax);
		[LinkName("SteamAPI_ISteamUserStats_UploadLeaderboardScore")]
		public extern SteamAPICall_t UploadLeaderboardScore(SteamLeaderboard_t hSteamLeaderboard,ELeaderboardUploadScoreMethod eLeaderboardUploadScoreMethod,int32 nScore,int32* pScoreDetails,int32 cScoreDetailsCount);
		[LinkName("SteamAPI_ISteamUserStats_AttachLeaderboardUGC")]
		public extern SteamAPICall_t AttachLeaderboardUGC(SteamLeaderboard_t hSteamLeaderboard,UGCHandle_t hUGC);
		[LinkName("SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers")]
		public extern SteamAPICall_t GetNumberOfCurrentPlayers();
		[LinkName("SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages")]
		public extern SteamAPICall_t RequestGlobalAchievementPercentages();
		[LinkName("SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo")]
		public extern int32 GetMostAchievedAchievementInfo(char8* pchName,uint32 unNameBufLen,float* pflPercent,bool* pbAchieved);
		[LinkName("SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo")]
		public extern int32 GetNextMostAchievedAchievementInfo(int32 iIteratorPrevious,char8* pchName,uint32 unNameBufLen,float* pflPercent,bool* pbAchieved);
		[LinkName("SteamAPI_ISteamUserStats_GetAchievementAchievedPercent")]
		public extern bool GetAchievementAchievedPercent(char8* pchName,float* pflPercent);
		[LinkName("SteamAPI_ISteamUserStats_RequestGlobalStats")]
		public extern SteamAPICall_t RequestGlobalStats(int32 nHistoryDays);
		[LinkName("SteamAPI_ISteamUserStats_GetGlobalStatInt64")]
		public extern bool GetGlobalStat(char8* pchStatName,int64* pData);
		[LinkName("SteamAPI_ISteamUserStats_GetGlobalStatDouble")]
		public extern bool GetGlobalStat(char8* pchStatName,double* pData);
		[LinkName("SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64")]
		public extern int32 GetGlobalStatHistory(char8* pchStatName,int64* pData,uint32 cubData);
		[LinkName("SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble")]
		public extern int32 GetGlobalStatHistory(char8* pchStatName,double* pData,uint32 cubData);
		[LinkName("SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32")]
		public extern bool GetAchievementProgressLimits(char8* pchName,int32* pnMinProgress,int32* pnMaxProgress);
		[LinkName("SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat")]
		public extern bool GetAchievementProgressLimits(char8* pchName,float* pfMinProgress,float* pfMaxProgress);
	}
	public struct ISteamApps : uint
	{
		[LinkName("SteamAPI_ISteamApps_BIsSubscribed")]
		public extern bool BIsSubscribed();
		[LinkName("SteamAPI_ISteamApps_BIsLowViolence")]
		public extern bool BIsLowViolence();
		[LinkName("SteamAPI_ISteamApps_BIsCybercafe")]
		public extern bool BIsCybercafe();
		[LinkName("SteamAPI_ISteamApps_BIsVACBanned")]
		public extern bool BIsVACBanned();
		[LinkName("SteamAPI_ISteamApps_GetCurrentGameLanguage")]
		public extern char8* GetCurrentGameLanguage();
		[LinkName("SteamAPI_ISteamApps_GetAvailableGameLanguages")]
		public extern char8* GetAvailableGameLanguages();
		[LinkName("SteamAPI_ISteamApps_BIsSubscribedApp")]
		public extern bool BIsSubscribedApp(AppId_t appID);
		[LinkName("SteamAPI_ISteamApps_BIsDlcInstalled")]
		public extern bool BIsDlcInstalled(AppId_t appID);
		[LinkName("SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime")]
		public extern uint32 GetEarliestPurchaseUnixTime(AppId_t nAppID);
		[LinkName("SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend")]
		public extern bool BIsSubscribedFromFreeWeekend();
		[LinkName("SteamAPI_ISteamApps_GetDLCCount")]
		public extern int32 GetDLCCount();
		[LinkName("SteamAPI_ISteamApps_BGetDLCDataByIndex")]
		public extern bool BGetDLCDataByIndex(int32 iDLC,AppId_t* pAppID,bool* pbAvailable,char8* pchName,int32 cchNameBufferSize);
		[LinkName("SteamAPI_ISteamApps_InstallDLC")]
		public extern void InstallDLC(AppId_t nAppID);
		[LinkName("SteamAPI_ISteamApps_UninstallDLC")]
		public extern void UninstallDLC(AppId_t nAppID);
		[LinkName("SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey")]
		public extern void RequestAppProofOfPurchaseKey(AppId_t nAppID);
		[LinkName("SteamAPI_ISteamApps_GetCurrentBetaName")]
		public extern bool GetCurrentBetaName(char8* pchName,int32 cchNameBufferSize);
		[LinkName("SteamAPI_ISteamApps_MarkContentCorrupt")]
		public extern bool MarkContentCorrupt(bool bMissingFilesOnly);
		[LinkName("SteamAPI_ISteamApps_GetInstalledDepots")]
		public extern uint32 GetInstalledDepots(AppId_t appID,DepotId_t* pvecDepots,uint32 cMaxDepots);
		[LinkName("SteamAPI_ISteamApps_GetAppInstallDir")]
		public extern uint32 GetAppInstallDir(AppId_t appID,char8* pchFolder,uint32 cchFolderBufferSize);
		[LinkName("SteamAPI_ISteamApps_BIsAppInstalled")]
		public extern bool BIsAppInstalled(AppId_t appID);
		[LinkName("SteamAPI_ISteamApps_GetAppOwner")]
		public extern CSteamID GetAppOwner();
		[LinkName("SteamAPI_ISteamApps_GetLaunchQueryParam")]
		public extern char8* GetLaunchQueryParam(char8* pchKey);
		[LinkName("SteamAPI_ISteamApps_GetDlcDownloadProgress")]
		public extern bool GetDlcDownloadProgress(AppId_t nAppID,uint64* punBytesDownloaded,uint64* punBytesTotal);
		[LinkName("SteamAPI_ISteamApps_GetAppBuildId")]
		public extern int32 GetAppBuildId();
		[LinkName("SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys")]
		public extern void RequestAllProofOfPurchaseKeys();
		[LinkName("SteamAPI_ISteamApps_GetFileDetails")]
		public extern SteamAPICall_t GetFileDetails(char8* pszFileName);
		[LinkName("SteamAPI_ISteamApps_GetLaunchCommandLine")]
		public extern int32 GetLaunchCommandLine(char8* pszCommandLine,int32 cubCommandLine);
		[LinkName("SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing")]
		public extern bool BIsSubscribedFromFamilySharing();
		[LinkName("SteamAPI_ISteamApps_BIsTimedTrial")]
		public extern bool BIsTimedTrial(uint32* punSecondsAllowed,uint32* punSecondsPlayed);
	}
	public struct ISteamNetworking : uint
	{
		[LinkName("SteamAPI_ISteamNetworking_SendP2PPacket")]
		public extern bool SendP2PPacket(CSteamID steamIDRemote,void* pubData,uint32 cubData,EP2PSend eP2PSendType,int32 nChannel);
		[LinkName("SteamAPI_ISteamNetworking_IsP2PPacketAvailable")]
		public extern bool IsP2PPacketAvailable(uint32* pcubMsgSize,int32 nChannel);
		[LinkName("SteamAPI_ISteamNetworking_ReadP2PPacket")]
		public extern bool ReadP2PPacket(void* pubDest,uint32 cubDest,uint32* pcubMsgSize,CSteamID* psteamIDRemote,int32 nChannel);
		[LinkName("SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser")]
		public extern bool AcceptP2PSessionWithUser(CSteamID steamIDRemote);
		[LinkName("SteamAPI_ISteamNetworking_CloseP2PSessionWithUser")]
		public extern bool CloseP2PSessionWithUser(CSteamID steamIDRemote);
		[LinkName("SteamAPI_ISteamNetworking_CloseP2PChannelWithUser")]
		public extern bool CloseP2PChannelWithUser(CSteamID steamIDRemote,int32 nChannel);
		[LinkName("SteamAPI_ISteamNetworking_GetP2PSessionState")]
		public extern bool GetP2PSessionState(CSteamID steamIDRemote,P2PSessionState_t* pConnectionState);
		[LinkName("SteamAPI_ISteamNetworking_AllowP2PPacketRelay")]
		public extern bool AllowP2PPacketRelay(bool bAllow);
		[LinkName("SteamAPI_ISteamNetworking_CreateListenSocket")]
		public extern SNetListenSocket_t CreateListenSocket(int32 nVirtualP2PPort,SteamIPAddress_t nIP,uint16 nPort,bool bAllowUseOfPacketRelay);
		[LinkName("SteamAPI_ISteamNetworking_CreateP2PConnectionSocket")]
		public extern SNetSocket_t CreateP2PConnectionSocket(CSteamID steamIDTarget,int32 nVirtualPort,int32 nTimeoutSec,bool bAllowUseOfPacketRelay);
		[LinkName("SteamAPI_ISteamNetworking_CreateConnectionSocket")]
		public extern SNetSocket_t CreateConnectionSocket(SteamIPAddress_t nIP,uint16 nPort,int32 nTimeoutSec);
		[LinkName("SteamAPI_ISteamNetworking_DestroySocket")]
		public extern bool DestroySocket(SNetSocket_t hSocket,bool bNotifyRemoteEnd);
		[LinkName("SteamAPI_ISteamNetworking_DestroyListenSocket")]
		public extern bool DestroyListenSocket(SNetListenSocket_t hSocket,bool bNotifyRemoteEnd);
		[LinkName("SteamAPI_ISteamNetworking_SendDataOnSocket")]
		public extern bool SendDataOnSocket(SNetSocket_t hSocket,void* pubData,uint32 cubData,bool bReliable);
		[LinkName("SteamAPI_ISteamNetworking_IsDataAvailableOnSocket")]
		public extern bool IsDataAvailableOnSocket(SNetSocket_t hSocket,uint32* pcubMsgSize);
		[LinkName("SteamAPI_ISteamNetworking_RetrieveDataFromSocket")]
		public extern bool RetrieveDataFromSocket(SNetSocket_t hSocket,void* pubDest,uint32 cubDest,uint32* pcubMsgSize);
		[LinkName("SteamAPI_ISteamNetworking_IsDataAvailable")]
		public extern bool IsDataAvailable(SNetListenSocket_t hListenSocket,uint32* pcubMsgSize,SNetSocket_t* phSocket);
		[LinkName("SteamAPI_ISteamNetworking_RetrieveData")]
		public extern bool RetrieveData(SNetListenSocket_t hListenSocket,void* pubDest,uint32 cubDest,uint32* pcubMsgSize,SNetSocket_t* phSocket);
		[LinkName("SteamAPI_ISteamNetworking_GetSocketInfo")]
		public extern bool GetSocketInfo(SNetSocket_t hSocket,CSteamID* pSteamIDRemote,int32* peSocketStatus,SteamIPAddress_t* punIPRemote,uint16* punPortRemote);
		[LinkName("SteamAPI_ISteamNetworking_GetListenSocketInfo")]
		public extern bool GetListenSocketInfo(SNetListenSocket_t hListenSocket,SteamIPAddress_t* pnIP,uint16* pnPort);
		[LinkName("SteamAPI_ISteamNetworking_GetSocketConnectionType")]
		public extern ESNetSocketConnectionType GetSocketConnectionType(SNetSocket_t hSocket);
		[LinkName("SteamAPI_ISteamNetworking_GetMaxPacketSize")]
		public extern int32 GetMaxPacketSize(SNetSocket_t hSocket);
	}
	public struct ISteamScreenshots : uint
	{
		[LinkName("SteamAPI_ISteamScreenshots_WriteScreenshot")]
		public extern ScreenshotHandle WriteScreenshot(void* pubRGB,uint32 cubRGB,int32 nWidth,int32 nHeight);
		[LinkName("SteamAPI_ISteamScreenshots_AddScreenshotToLibrary")]
		public extern ScreenshotHandle AddScreenshotToLibrary(char8* pchFilename,char8* pchThumbnailFilename,int32 nWidth,int32 nHeight);
		[LinkName("SteamAPI_ISteamScreenshots_TriggerScreenshot")]
		public extern void TriggerScreenshot();
		[LinkName("SteamAPI_ISteamScreenshots_HookScreenshots")]
		public extern void HookScreenshots(bool bHook);
		[LinkName("SteamAPI_ISteamScreenshots_SetLocation")]
		public extern bool SetLocation(ScreenshotHandle hScreenshot,char8* pchLocation);
		[LinkName("SteamAPI_ISteamScreenshots_TagUser")]
		public extern bool TagUser(ScreenshotHandle hScreenshot,CSteamID steamID);
		[LinkName("SteamAPI_ISteamScreenshots_TagPublishedFile")]
		public extern bool TagPublishedFile(ScreenshotHandle hScreenshot,PublishedFileId_t unPublishedFileID);
		[LinkName("SteamAPI_ISteamScreenshots_IsScreenshotsHooked")]
		public extern bool IsScreenshotsHooked();
		[LinkName("SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary")]
		public extern ScreenshotHandle AddVRScreenshotToLibrary(EVRScreenshotType eType,char8* pchFilename,char8* pchVRFilename);
	}
	public struct ISteamMusic : uint
	{
		[LinkName("SteamAPI_ISteamMusic_BIsEnabled")]
		public extern bool BIsEnabled();
		[LinkName("SteamAPI_ISteamMusic_BIsPlaying")]
		public extern bool BIsPlaying();
		[LinkName("SteamAPI_ISteamMusic_GetPlaybackStatus")]
		public extern AudioPlayback_Status GetPlaybackStatus();
		[LinkName("SteamAPI_ISteamMusic_Play")]
		public extern void Play();
		[LinkName("SteamAPI_ISteamMusic_Pause")]
		public extern void Pause();
		[LinkName("SteamAPI_ISteamMusic_PlayPrevious")]
		public extern void PlayPrevious();
		[LinkName("SteamAPI_ISteamMusic_PlayNext")]
		public extern void PlayNext();
		[LinkName("SteamAPI_ISteamMusic_SetVolume")]
		public extern void SetVolume(float flVolume);
		[LinkName("SteamAPI_ISteamMusic_GetVolume")]
		public extern float GetVolume();
	}
	public struct ISteamMusicRemote : uint
	{
		[LinkName("SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote")]
		public extern bool RegisterSteamMusicRemote(char8* pchName);
		[LinkName("SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote")]
		public extern bool DeregisterSteamMusicRemote();
		[LinkName("SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote")]
		public extern bool BIsCurrentMusicRemote();
		[LinkName("SteamAPI_ISteamMusicRemote_BActivationSuccess")]
		public extern bool BActivationSuccess(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_SetDisplayName")]
		public extern bool SetDisplayName(char8* pchDisplayName);
		[LinkName("SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64")]
		public extern bool SetPNGIcon_64x64(void* pvBuffer,uint32 cbBufferLength);
		[LinkName("SteamAPI_ISteamMusicRemote_EnablePlayPrevious")]
		public extern bool EnablePlayPrevious(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_EnablePlayNext")]
		public extern bool EnablePlayNext(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_EnableShuffled")]
		public extern bool EnableShuffled(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_EnableLooped")]
		public extern bool EnableLooped(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_EnableQueue")]
		public extern bool EnableQueue(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_EnablePlaylists")]
		public extern bool EnablePlaylists(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus")]
		public extern bool UpdatePlaybackStatus(AudioPlayback_Status nStatus);
		[LinkName("SteamAPI_ISteamMusicRemote_UpdateShuffled")]
		public extern bool UpdateShuffled(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_UpdateLooped")]
		public extern bool UpdateLooped(bool bValue);
		[LinkName("SteamAPI_ISteamMusicRemote_UpdateVolume")]
		public extern bool UpdateVolume(float flValue);
		[LinkName("SteamAPI_ISteamMusicRemote_CurrentEntryWillChange")]
		public extern bool CurrentEntryWillChange();
		[LinkName("SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable")]
		public extern bool CurrentEntryIsAvailable(bool bAvailable);
		[LinkName("SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText")]
		public extern bool UpdateCurrentEntryText(char8* pchText);
		[LinkName("SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds")]
		public extern bool UpdateCurrentEntryElapsedSeconds(int32 nValue);
		[LinkName("SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt")]
		public extern bool UpdateCurrentEntryCoverArt(void* pvBuffer,uint32 cbBufferLength);
		[LinkName("SteamAPI_ISteamMusicRemote_CurrentEntryDidChange")]
		public extern bool CurrentEntryDidChange();
		[LinkName("SteamAPI_ISteamMusicRemote_QueueWillChange")]
		public extern bool QueueWillChange();
		[LinkName("SteamAPI_ISteamMusicRemote_ResetQueueEntries")]
		public extern bool ResetQueueEntries();
		[LinkName("SteamAPI_ISteamMusicRemote_SetQueueEntry")]
		public extern bool SetQueueEntry(int32 nID,int32 nPosition,char8* pchEntryText);
		[LinkName("SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry")]
		public extern bool SetCurrentQueueEntry(int32 nID);
		[LinkName("SteamAPI_ISteamMusicRemote_QueueDidChange")]
		public extern bool QueueDidChange();
		[LinkName("SteamAPI_ISteamMusicRemote_PlaylistWillChange")]
		public extern bool PlaylistWillChange();
		[LinkName("SteamAPI_ISteamMusicRemote_ResetPlaylistEntries")]
		public extern bool ResetPlaylistEntries();
		[LinkName("SteamAPI_ISteamMusicRemote_SetPlaylistEntry")]
		public extern bool SetPlaylistEntry(int32 nID,int32 nPosition,char8* pchEntryText);
		[LinkName("SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry")]
		public extern bool SetCurrentPlaylistEntry(int32 nID);
		[LinkName("SteamAPI_ISteamMusicRemote_PlaylistDidChange")]
		public extern bool PlaylistDidChange();
	}
	public struct ISteamHTTP : uint
	{
		[LinkName("SteamAPI_ISteamHTTP_CreateHTTPRequest")]
		public extern HTTPRequestHandle CreateHTTPRequest(EHTTPMethod eHTTPRequestMethod,char8* pchAbsoluteURL);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestContextValue")]
		public extern bool SetHTTPRequestContextValue(HTTPRequestHandle hRequest,uint64 ulContextValue);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout")]
		public extern bool SetHTTPRequestNetworkActivityTimeout(HTTPRequestHandle hRequest,uint32 unTimeoutSeconds);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue")]
		public extern bool SetHTTPRequestHeaderValue(HTTPRequestHandle hRequest,char8* pchHeaderName,char8* pchHeaderValue);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter")]
		public extern bool SetHTTPRequestGetOrPostParameter(HTTPRequestHandle hRequest,char8* pchParamName,char8* pchParamValue);
		[LinkName("SteamAPI_ISteamHTTP_SendHTTPRequest")]
		public extern bool SendHTTPRequest(HTTPRequestHandle hRequest,SteamAPICall_t* pCallHandle);
		[LinkName("SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse")]
		public extern bool SendHTTPRequestAndStreamResponse(HTTPRequestHandle hRequest,SteamAPICall_t* pCallHandle);
		[LinkName("SteamAPI_ISteamHTTP_DeferHTTPRequest")]
		public extern bool DeferHTTPRequest(HTTPRequestHandle hRequest);
		[LinkName("SteamAPI_ISteamHTTP_PrioritizeHTTPRequest")]
		public extern bool PrioritizeHTTPRequest(HTTPRequestHandle hRequest);
		[LinkName("SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize")]
		public extern bool GetHTTPResponseHeaderSize(HTTPRequestHandle hRequest,char8* pchHeaderName,uint32* unResponseHeaderSize);
		[LinkName("SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue")]
		public extern bool GetHTTPResponseHeaderValue(HTTPRequestHandle hRequest,char8* pchHeaderName,uint8* pHeaderValueBuffer,uint32 unBufferSize);
		[LinkName("SteamAPI_ISteamHTTP_GetHTTPResponseBodySize")]
		public extern bool GetHTTPResponseBodySize(HTTPRequestHandle hRequest,uint32* unBodySize);
		[LinkName("SteamAPI_ISteamHTTP_GetHTTPResponseBodyData")]
		public extern bool GetHTTPResponseBodyData(HTTPRequestHandle hRequest,uint8* pBodyDataBuffer,uint32 unBufferSize);
		[LinkName("SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData")]
		public extern bool GetHTTPStreamingResponseBodyData(HTTPRequestHandle hRequest,uint32 cOffset,uint8* pBodyDataBuffer,uint32 unBufferSize);
		[LinkName("SteamAPI_ISteamHTTP_ReleaseHTTPRequest")]
		public extern bool ReleaseHTTPRequest(HTTPRequestHandle hRequest);
		[LinkName("SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct")]
		public extern bool GetHTTPDownloadProgressPct(HTTPRequestHandle hRequest,float* pflPercentOut);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody")]
		public extern bool SetHTTPRequestRawPostBody(HTTPRequestHandle hRequest,char8* pchContentType,uint8* pubBody,uint32 unBodyLen);
		[LinkName("SteamAPI_ISteamHTTP_CreateCookieContainer")]
		public extern HTTPCookieContainerHandle CreateCookieContainer(bool bAllowResponsesToModify);
		[LinkName("SteamAPI_ISteamHTTP_ReleaseCookieContainer")]
		public extern bool ReleaseCookieContainer(HTTPCookieContainerHandle hCookieContainer);
		[LinkName("SteamAPI_ISteamHTTP_SetCookie")]
		public extern bool SetCookie(HTTPCookieContainerHandle hCookieContainer,char8* pchHost,char8* pchUrl,char8* pchCookie);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer")]
		public extern bool SetHTTPRequestCookieContainer(HTTPRequestHandle hRequest,HTTPCookieContainerHandle hCookieContainer);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo")]
		public extern bool SetHTTPRequestUserAgentInfo(HTTPRequestHandle hRequest,char8* pchUserAgentInfo);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate")]
		public extern bool SetHTTPRequestRequiresVerifiedCertificate(HTTPRequestHandle hRequest,bool bRequireVerifiedCertificate);
		[LinkName("SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS")]
		public extern bool SetHTTPRequestAbsoluteTimeoutMS(HTTPRequestHandle hRequest,uint32 unMilliseconds);
		[LinkName("SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut")]
		public extern bool GetHTTPRequestWasTimedOut(HTTPRequestHandle hRequest,bool* pbWasTimedOut);
	}
	public struct ISteamInput : uint
	{
		[LinkName("SteamAPI_ISteamInput_Init")]
		public extern bool Init();
		[LinkName("SteamAPI_ISteamInput_Shutdown")]
		public extern bool Shutdown();
		[LinkName("SteamAPI_ISteamInput_RunFrame")]
		public extern void RunFrame();
		[LinkName("SteamAPI_ISteamInput_GetConnectedControllers")]
		public extern int32 GetConnectedControllers(InputHandle_t handlesOut);
		[LinkName("SteamAPI_ISteamInput_GetActionSetHandle")]
		public extern InputActionSetHandle_t GetActionSetHandle(char8* pszActionSetName);
		[LinkName("SteamAPI_ISteamInput_ActivateActionSet")]
		public extern void ActivateActionSet(InputHandle_t inputHandle,InputActionSetHandle_t actionSetHandle);
		[LinkName("SteamAPI_ISteamInput_GetCurrentActionSet")]
		public extern InputActionSetHandle_t GetCurrentActionSet(InputHandle_t inputHandle);
		[LinkName("SteamAPI_ISteamInput_ActivateActionSetLayer")]
		public extern void ActivateActionSetLayer(InputHandle_t inputHandle,InputActionSetHandle_t actionSetLayerHandle);
		[LinkName("SteamAPI_ISteamInput_DeactivateActionSetLayer")]
		public extern void DeactivateActionSetLayer(InputHandle_t inputHandle,InputActionSetHandle_t actionSetLayerHandle);
		[LinkName("SteamAPI_ISteamInput_DeactivateAllActionSetLayers")]
		public extern void DeactivateAllActionSetLayers(InputHandle_t inputHandle);
		[LinkName("SteamAPI_ISteamInput_GetActiveActionSetLayers")]
		public extern int32 GetActiveActionSetLayers(InputHandle_t inputHandle,InputActionSetHandle_t handlesOut);
		[LinkName("SteamAPI_ISteamInput_GetDigitalActionHandle")]
		public extern InputDigitalActionHandle_t GetDigitalActionHandle(char8* pszActionName);
		[LinkName("SteamAPI_ISteamInput_GetDigitalActionData")]
		public extern InputDigitalActionData_t GetDigitalActionData(InputHandle_t inputHandle,InputDigitalActionHandle_t digitalActionHandle);
		[LinkName("SteamAPI_ISteamInput_GetDigitalActionOrigins")]
		public extern int32 GetDigitalActionOrigins(InputHandle_t inputHandle,InputActionSetHandle_t actionSetHandle,InputDigitalActionHandle_t digitalActionHandle,EInputActionOrigin* originsOut);
		[LinkName("SteamAPI_ISteamInput_GetAnalogActionHandle")]
		public extern InputAnalogActionHandle_t GetAnalogActionHandle(char8* pszActionName);
		[LinkName("SteamAPI_ISteamInput_GetAnalogActionData")]
		public extern InputAnalogActionData_t GetAnalogActionData(InputHandle_t inputHandle,InputAnalogActionHandle_t analogActionHandle);
		[LinkName("SteamAPI_ISteamInput_GetAnalogActionOrigins")]
		public extern int32 GetAnalogActionOrigins(InputHandle_t inputHandle,InputActionSetHandle_t actionSetHandle,InputAnalogActionHandle_t analogActionHandle,EInputActionOrigin* originsOut);
		[LinkName("SteamAPI_ISteamInput_GetGlyphForActionOrigin")]
		public extern char8* GetGlyphForActionOrigin(EInputActionOrigin eOrigin);
		[LinkName("SteamAPI_ISteamInput_GetStringForActionOrigin")]
		public extern char8* GetStringForActionOrigin(EInputActionOrigin eOrigin);
		[LinkName("SteamAPI_ISteamInput_StopAnalogActionMomentum")]
		public extern void StopAnalogActionMomentum(InputHandle_t inputHandle,InputAnalogActionHandle_t eAction);
		[LinkName("SteamAPI_ISteamInput_GetMotionData")]
		public extern InputMotionData_t GetMotionData(InputHandle_t inputHandle);
		[LinkName("SteamAPI_ISteamInput_TriggerVibration")]
		public extern void TriggerVibration(InputHandle_t inputHandle,uint16 usLeftSpeed,uint16 usRightSpeed);
		[LinkName("SteamAPI_ISteamInput_SetLEDColor")]
		public extern void SetLEDColor(InputHandle_t inputHandle,uint8 nColorR,uint8 nColorG,uint8 nColorB,uint32 nFlags);
		[LinkName("SteamAPI_ISteamInput_TriggerHapticPulse")]
		public extern void TriggerHapticPulse(InputHandle_t inputHandle,ESteamControllerPad eTargetPad,uint16 usDurationMicroSec);
		[LinkName("SteamAPI_ISteamInput_TriggerRepeatedHapticPulse")]
		public extern void TriggerRepeatedHapticPulse(InputHandle_t inputHandle,ESteamControllerPad eTargetPad,uint16 usDurationMicroSec,uint16 usOffMicroSec,uint16 unRepeat,uint32 nFlags);
		[LinkName("SteamAPI_ISteamInput_ShowBindingPanel")]
		public extern bool ShowBindingPanel(InputHandle_t inputHandle);
		[LinkName("SteamAPI_ISteamInput_GetInputTypeForHandle")]
		public extern ESteamInputType GetInputTypeForHandle(InputHandle_t inputHandle);
		[LinkName("SteamAPI_ISteamInput_GetControllerForGamepadIndex")]
		public extern InputHandle_t GetControllerForGamepadIndex(int32 nIndex);
		[LinkName("SteamAPI_ISteamInput_GetGamepadIndexForController")]
		public extern int32 GetGamepadIndexForController(InputHandle_t ulinputHandle);
		[LinkName("SteamAPI_ISteamInput_GetStringForXboxOrigin")]
		public extern char8* GetStringForXboxOrigin(EXboxOrigin eOrigin);
		[LinkName("SteamAPI_ISteamInput_GetGlyphForXboxOrigin")]
		public extern char8* GetGlyphForXboxOrigin(EXboxOrigin eOrigin);
		[LinkName("SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin")]
		public extern EInputActionOrigin GetActionOriginFromXboxOrigin(InputHandle_t inputHandle,EXboxOrigin eOrigin);
		[LinkName("SteamAPI_ISteamInput_TranslateActionOrigin")]
		public extern EInputActionOrigin TranslateActionOrigin(ESteamInputType eDestinationInputType,EInputActionOrigin eSourceOrigin);
		[LinkName("SteamAPI_ISteamInput_GetDeviceBindingRevision")]
		public extern bool GetDeviceBindingRevision(InputHandle_t inputHandle,int32* pMajor,int32* pMinor);
		[LinkName("SteamAPI_ISteamInput_GetRemotePlaySessionID")]
		public extern uint32 GetRemotePlaySessionID(InputHandle_t inputHandle);
	}
	public struct ISteamController : uint
	{
		[LinkName("SteamAPI_ISteamController_Init")]
		public extern bool Init();
		[LinkName("SteamAPI_ISteamController_Shutdown")]
		public extern bool Shutdown();
		[LinkName("SteamAPI_ISteamController_RunFrame")]
		public extern void RunFrame();
		[LinkName("SteamAPI_ISteamController_GetConnectedControllers")]
		public extern int32 GetConnectedControllers(ControllerHandle_t* handlesOut);
		[LinkName("SteamAPI_ISteamController_GetActionSetHandle")]
		public extern ControllerActionSetHandle_t GetActionSetHandle(char8* pszActionSetName);
		[LinkName("SteamAPI_ISteamController_ActivateActionSet")]
		public extern void ActivateActionSet(ControllerHandle_t controllerHandle,ControllerActionSetHandle_t actionSetHandle);
		[LinkName("SteamAPI_ISteamController_GetCurrentActionSet")]
		public extern ControllerActionSetHandle_t GetCurrentActionSet(ControllerHandle_t controllerHandle);
		[LinkName("SteamAPI_ISteamController_ActivateActionSetLayer")]
		public extern void ActivateActionSetLayer(ControllerHandle_t controllerHandle,ControllerActionSetHandle_t actionSetLayerHandle);
		[LinkName("SteamAPI_ISteamController_DeactivateActionSetLayer")]
		public extern void DeactivateActionSetLayer(ControllerHandle_t controllerHandle,ControllerActionSetHandle_t actionSetLayerHandle);
		[LinkName("SteamAPI_ISteamController_DeactivateAllActionSetLayers")]
		public extern void DeactivateAllActionSetLayers(ControllerHandle_t controllerHandle);
		[LinkName("SteamAPI_ISteamController_GetActiveActionSetLayers")]
		public extern int32 GetActiveActionSetLayers(ControllerHandle_t controllerHandle,ControllerActionSetHandle_t* handlesOut);
		[LinkName("SteamAPI_ISteamController_GetDigitalActionHandle")]
		public extern ControllerDigitalActionHandle_t GetDigitalActionHandle(char8* pszActionName);
		[LinkName("SteamAPI_ISteamController_GetDigitalActionData")]
		public extern InputDigitalActionData_t GetDigitalActionData(ControllerHandle_t controllerHandle,ControllerDigitalActionHandle_t digitalActionHandle);
		[LinkName("SteamAPI_ISteamController_GetDigitalActionOrigins")]
		public extern int32 GetDigitalActionOrigins(ControllerHandle_t controllerHandle,ControllerActionSetHandle_t actionSetHandle,ControllerDigitalActionHandle_t digitalActionHandle,EControllerActionOrigin* originsOut);
		[LinkName("SteamAPI_ISteamController_GetAnalogActionHandle")]
		public extern ControllerAnalogActionHandle_t GetAnalogActionHandle(char8* pszActionName);
		[LinkName("SteamAPI_ISteamController_GetAnalogActionData")]
		public extern InputAnalogActionData_t GetAnalogActionData(ControllerHandle_t controllerHandle,ControllerAnalogActionHandle_t analogActionHandle);
		[LinkName("SteamAPI_ISteamController_GetAnalogActionOrigins")]
		public extern int32 GetAnalogActionOrigins(ControllerHandle_t controllerHandle,ControllerActionSetHandle_t actionSetHandle,ControllerAnalogActionHandle_t analogActionHandle,EControllerActionOrigin* originsOut);
		[LinkName("SteamAPI_ISteamController_GetGlyphForActionOrigin")]
		public extern char8* GetGlyphForActionOrigin(EControllerActionOrigin eOrigin);
		[LinkName("SteamAPI_ISteamController_GetStringForActionOrigin")]
		public extern char8* GetStringForActionOrigin(EControllerActionOrigin eOrigin);
		[LinkName("SteamAPI_ISteamController_StopAnalogActionMomentum")]
		public extern void StopAnalogActionMomentum(ControllerHandle_t controllerHandle,ControllerAnalogActionHandle_t eAction);
		[LinkName("SteamAPI_ISteamController_GetMotionData")]
		public extern InputMotionData_t GetMotionData(ControllerHandle_t controllerHandle);
		[LinkName("SteamAPI_ISteamController_TriggerHapticPulse")]
		public extern void TriggerHapticPulse(ControllerHandle_t controllerHandle,ESteamControllerPad eTargetPad,uint16 usDurationMicroSec);
		[LinkName("SteamAPI_ISteamController_TriggerRepeatedHapticPulse")]
		public extern void TriggerRepeatedHapticPulse(ControllerHandle_t controllerHandle,ESteamControllerPad eTargetPad,uint16 usDurationMicroSec,uint16 usOffMicroSec,uint16 unRepeat,uint32 nFlags);
		[LinkName("SteamAPI_ISteamController_TriggerVibration")]
		public extern void TriggerVibration(ControllerHandle_t controllerHandle,uint16 usLeftSpeed,uint16 usRightSpeed);
		[LinkName("SteamAPI_ISteamController_SetLEDColor")]
		public extern void SetLEDColor(ControllerHandle_t controllerHandle,uint8 nColorR,uint8 nColorG,uint8 nColorB,uint32 nFlags);
		[LinkName("SteamAPI_ISteamController_ShowBindingPanel")]
		public extern bool ShowBindingPanel(ControllerHandle_t controllerHandle);
		[LinkName("SteamAPI_ISteamController_GetInputTypeForHandle")]
		public extern ESteamInputType GetInputTypeForHandle(ControllerHandle_t controllerHandle);
		[LinkName("SteamAPI_ISteamController_GetControllerForGamepadIndex")]
		public extern ControllerHandle_t GetControllerForGamepadIndex(int32 nIndex);
		[LinkName("SteamAPI_ISteamController_GetGamepadIndexForController")]
		public extern int32 GetGamepadIndexForController(ControllerHandle_t ulControllerHandle);
		[LinkName("SteamAPI_ISteamController_GetStringForXboxOrigin")]
		public extern char8* GetStringForXboxOrigin(EXboxOrigin eOrigin);
		[LinkName("SteamAPI_ISteamController_GetGlyphForXboxOrigin")]
		public extern char8* GetGlyphForXboxOrigin(EXboxOrigin eOrigin);
		[LinkName("SteamAPI_ISteamController_GetActionOriginFromXboxOrigin")]
		public extern EControllerActionOrigin GetActionOriginFromXboxOrigin(ControllerHandle_t controllerHandle,EXboxOrigin eOrigin);
		[LinkName("SteamAPI_ISteamController_TranslateActionOrigin")]
		public extern EControllerActionOrigin TranslateActionOrigin(ESteamInputType eDestinationInputType,EControllerActionOrigin eSourceOrigin);
		[LinkName("SteamAPI_ISteamController_GetControllerBindingRevision")]
		public extern bool GetControllerBindingRevision(ControllerHandle_t controllerHandle,int32* pMajor,int32* pMinor);
	}
	public struct ISteamUGC : uint
	{
		[LinkName("SteamAPI_ISteamUGC_CreateQueryUserUGCRequest")]
		public extern UGCQueryHandle_t CreateQueryUserUGCRequest(AccountID_t unAccountID,EUserUGCList eListType,EUGCMatchingUGCType eMatchingUGCType,EUserUGCListSortOrder eSortOrder,AppId_t nCreatorAppID,AppId_t nConsumerAppID,uint32 unPage);
		[LinkName("SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage")]
		public extern UGCQueryHandle_t CreateQueryAllUGCRequest(EUGCQuery eQueryType,EUGCMatchingUGCType eMatchingeMatchingUGCTypeFileType,AppId_t nCreatorAppID,AppId_t nConsumerAppID,uint32 unPage);
		[LinkName("SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor")]
		public extern UGCQueryHandle_t CreateQueryAllUGCRequest(EUGCQuery eQueryType,EUGCMatchingUGCType eMatchingeMatchingUGCTypeFileType,AppId_t nCreatorAppID,AppId_t nConsumerAppID,char8* pchCursor);
		[LinkName("SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest")]
		public extern UGCQueryHandle_t CreateQueryUGCDetailsRequest(PublishedFileId_t* pvecPublishedFileID,uint32 unNumPublishedFileIDs);
		[LinkName("SteamAPI_ISteamUGC_SendQueryUGCRequest")]
		public extern SteamAPICall_t SendQueryUGCRequest(UGCQueryHandle_t handle);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCResult")]
		public extern bool GetQueryUGCResult(UGCQueryHandle_t handle,uint32 index,SteamUGCDetails_t* pDetails);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCNumTags")]
		public extern uint32 GetQueryUGCNumTags(UGCQueryHandle_t handle,uint32 index);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCTag")]
		public extern bool GetQueryUGCTag(UGCQueryHandle_t handle,uint32 index,uint32 indexTag,char8* pchValue,uint32 cchValueSize);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCTagDisplayName")]
		public extern bool GetQueryUGCTagDisplayName(UGCQueryHandle_t handle,uint32 index,uint32 indexTag,char8* pchValue,uint32 cchValueSize);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCPreviewURL")]
		public extern bool GetQueryUGCPreviewURL(UGCQueryHandle_t handle,uint32 index,char8* pchURL,uint32 cchURLSize);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCMetadata")]
		public extern bool GetQueryUGCMetadata(UGCQueryHandle_t handle,uint32 index,char8* pchMetadata,uint32 cchMetadatasize);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCChildren")]
		public extern bool GetQueryUGCChildren(UGCQueryHandle_t handle,uint32 index,PublishedFileId_t* pvecPublishedFileID,uint32 cMaxEntries);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCStatistic")]
		public extern bool GetQueryUGCStatistic(UGCQueryHandle_t handle,uint32 index,EItemStatistic eStatType,uint64* pStatValue);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews")]
		public extern uint32 GetQueryUGCNumAdditionalPreviews(UGCQueryHandle_t handle,uint32 index);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview")]
		public extern bool GetQueryUGCAdditionalPreview(UGCQueryHandle_t handle,uint32 index,uint32 previewIndex,char8* pchURLOrVideoID,uint32 cchURLSize,char8* pchOriginalFileName,uint32 cchOriginalFileNameSize,EItemPreviewType* pPreviewType);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags")]
		public extern uint32 GetQueryUGCNumKeyValueTags(UGCQueryHandle_t handle,uint32 index);
		[LinkName("SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag")]
		public extern bool GetQueryUGCKeyValueTag(UGCQueryHandle_t handle,uint32 index,uint32 keyValueTagIndex,char8* pchKey,uint32 cchKeySize,char8* pchValue,uint32 cchValueSize);
		[LinkName("SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag")]
		public extern bool GetQueryUGCKeyValueTag(UGCQueryHandle_t handle,uint32 index,char8* pchKey,char8* pchValue,uint32 cchValueSize);
		[LinkName("SteamAPI_ISteamUGC_ReleaseQueryUGCRequest")]
		public extern bool ReleaseQueryUGCRequest(UGCQueryHandle_t handle);
		[LinkName("SteamAPI_ISteamUGC_AddRequiredTag")]
		public extern bool AddRequiredTag(UGCQueryHandle_t handle,char8* pTagName);
		[LinkName("SteamAPI_ISteamUGC_AddRequiredTagGroup")]
		public extern bool AddRequiredTagGroup(UGCQueryHandle_t handle,SteamParamStringArray_t* pTagGroups);
		[LinkName("SteamAPI_ISteamUGC_AddExcludedTag")]
		public extern bool AddExcludedTag(UGCQueryHandle_t handle,char8* pTagName);
		[LinkName("SteamAPI_ISteamUGC_SetReturnOnlyIDs")]
		public extern bool SetReturnOnlyIDs(UGCQueryHandle_t handle,bool bReturnOnlyIDs);
		[LinkName("SteamAPI_ISteamUGC_SetReturnKeyValueTags")]
		public extern bool SetReturnKeyValueTags(UGCQueryHandle_t handle,bool bReturnKeyValueTags);
		[LinkName("SteamAPI_ISteamUGC_SetReturnLongDescription")]
		public extern bool SetReturnLongDescription(UGCQueryHandle_t handle,bool bReturnLongDescription);
		[LinkName("SteamAPI_ISteamUGC_SetReturnMetadata")]
		public extern bool SetReturnMetadata(UGCQueryHandle_t handle,bool bReturnMetadata);
		[LinkName("SteamAPI_ISteamUGC_SetReturnChildren")]
		public extern bool SetReturnChildren(UGCQueryHandle_t handle,bool bReturnChildren);
		[LinkName("SteamAPI_ISteamUGC_SetReturnAdditionalPreviews")]
		public extern bool SetReturnAdditionalPreviews(UGCQueryHandle_t handle,bool bReturnAdditionalPreviews);
		[LinkName("SteamAPI_ISteamUGC_SetReturnTotalOnly")]
		public extern bool SetReturnTotalOnly(UGCQueryHandle_t handle,bool bReturnTotalOnly);
		[LinkName("SteamAPI_ISteamUGC_SetReturnPlaytimeStats")]
		public extern bool SetReturnPlaytimeStats(UGCQueryHandle_t handle,uint32 unDays);
		[LinkName("SteamAPI_ISteamUGC_SetLanguage")]
		public extern bool SetLanguage(UGCQueryHandle_t handle,char8* pchLanguage);
		[LinkName("SteamAPI_ISteamUGC_SetAllowCachedResponse")]
		public extern bool SetAllowCachedResponse(UGCQueryHandle_t handle,uint32 unMaxAgeSeconds);
		[LinkName("SteamAPI_ISteamUGC_SetCloudFileNameFilter")]
		public extern bool SetCloudFileNameFilter(UGCQueryHandle_t handle,char8* pMatchCloudFileName);
		[LinkName("SteamAPI_ISteamUGC_SetMatchAnyTag")]
		public extern bool SetMatchAnyTag(UGCQueryHandle_t handle,bool bMatchAnyTag);
		[LinkName("SteamAPI_ISteamUGC_SetSearchText")]
		public extern bool SetSearchText(UGCQueryHandle_t handle,char8* pSearchText);
		[LinkName("SteamAPI_ISteamUGC_SetRankedByTrendDays")]
		public extern bool SetRankedByTrendDays(UGCQueryHandle_t handle,uint32 unDays);
		[LinkName("SteamAPI_ISteamUGC_AddRequiredKeyValueTag")]
		public extern bool AddRequiredKeyValueTag(UGCQueryHandle_t handle,char8* pKey,char8* pValue);
		[LinkName("SteamAPI_ISteamUGC_RequestUGCDetails")]
		public extern SteamAPICall_t RequestUGCDetails(PublishedFileId_t nPublishedFileID,uint32 unMaxAgeSeconds);
		[LinkName("SteamAPI_ISteamUGC_CreateItem")]
		public extern SteamAPICall_t CreateItem(AppId_t nConsumerAppId,EWorkshopFileType eFileType);
		[LinkName("SteamAPI_ISteamUGC_StartItemUpdate")]
		public extern UGCUpdateHandle_t StartItemUpdate(AppId_t nConsumerAppId,PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_SetItemTitle")]
		public extern bool SetItemTitle(UGCUpdateHandle_t handle,char8* pchTitle);
		[LinkName("SteamAPI_ISteamUGC_SetItemDescription")]
		public extern bool SetItemDescription(UGCUpdateHandle_t handle,char8* pchDescription);
		[LinkName("SteamAPI_ISteamUGC_SetItemUpdateLanguage")]
		public extern bool SetItemUpdateLanguage(UGCUpdateHandle_t handle,char8* pchLanguage);
		[LinkName("SteamAPI_ISteamUGC_SetItemMetadata")]
		public extern bool SetItemMetadata(UGCUpdateHandle_t handle,char8* pchMetaData);
		[LinkName("SteamAPI_ISteamUGC_SetItemVisibility")]
		public extern bool SetItemVisibility(UGCUpdateHandle_t handle,ERemoteStoragePublishedFileVisibility eVisibility);
		[LinkName("SteamAPI_ISteamUGC_SetItemTags")]
		public extern bool SetItemTags(UGCUpdateHandle_t updateHandle,SteamParamStringArray_t* pTags);
		[LinkName("SteamAPI_ISteamUGC_SetItemContent")]
		public extern bool SetItemContent(UGCUpdateHandle_t handle,char8* pszContentFolder);
		[LinkName("SteamAPI_ISteamUGC_SetItemPreview")]
		public extern bool SetItemPreview(UGCUpdateHandle_t handle,char8* pszPreviewFile);
		[LinkName("SteamAPI_ISteamUGC_SetAllowLegacyUpload")]
		public extern bool SetAllowLegacyUpload(UGCUpdateHandle_t handle,bool bAllowLegacyUpload);
		[LinkName("SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags")]
		public extern bool RemoveAllItemKeyValueTags(UGCUpdateHandle_t handle);
		[LinkName("SteamAPI_ISteamUGC_RemoveItemKeyValueTags")]
		public extern bool RemoveItemKeyValueTags(UGCUpdateHandle_t handle,char8* pchKey);
		[LinkName("SteamAPI_ISteamUGC_AddItemKeyValueTag")]
		public extern bool AddItemKeyValueTag(UGCUpdateHandle_t handle,char8* pchKey,char8* pchValue);
		[LinkName("SteamAPI_ISteamUGC_AddItemPreviewFile")]
		public extern bool AddItemPreviewFile(UGCUpdateHandle_t handle,char8* pszPreviewFile,EItemPreviewType type);
		[LinkName("SteamAPI_ISteamUGC_AddItemPreviewVideo")]
		public extern bool AddItemPreviewVideo(UGCUpdateHandle_t handle,char8* pszVideoID);
		[LinkName("SteamAPI_ISteamUGC_UpdateItemPreviewFile")]
		public extern bool UpdateItemPreviewFile(UGCUpdateHandle_t handle,uint32 index,char8* pszPreviewFile);
		[LinkName("SteamAPI_ISteamUGC_UpdateItemPreviewVideo")]
		public extern bool UpdateItemPreviewVideo(UGCUpdateHandle_t handle,uint32 index,char8* pszVideoID);
		[LinkName("SteamAPI_ISteamUGC_RemoveItemPreview")]
		public extern bool RemoveItemPreview(UGCUpdateHandle_t handle,uint32 index);
		[LinkName("SteamAPI_ISteamUGC_SubmitItemUpdate")]
		public extern SteamAPICall_t SubmitItemUpdate(UGCUpdateHandle_t handle,char8* pchChangeNote);
		[LinkName("SteamAPI_ISteamUGC_GetItemUpdateProgress")]
		public extern EItemUpdateStatus GetItemUpdateProgress(UGCUpdateHandle_t handle,uint64* punBytesProcessed,uint64* punBytesTotal);
		[LinkName("SteamAPI_ISteamUGC_SetUserItemVote")]
		public extern SteamAPICall_t SetUserItemVote(PublishedFileId_t nPublishedFileID,bool bVoteUp);
		[LinkName("SteamAPI_ISteamUGC_GetUserItemVote")]
		public extern SteamAPICall_t GetUserItemVote(PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_AddItemToFavorites")]
		public extern SteamAPICall_t AddItemToFavorites(AppId_t nAppId,PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_RemoveItemFromFavorites")]
		public extern SteamAPICall_t RemoveItemFromFavorites(AppId_t nAppId,PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_SubscribeItem")]
		public extern SteamAPICall_t SubscribeItem(PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_UnsubscribeItem")]
		public extern SteamAPICall_t UnsubscribeItem(PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_GetNumSubscribedItems")]
		public extern uint32 GetNumSubscribedItems();
		[LinkName("SteamAPI_ISteamUGC_GetSubscribedItems")]
		public extern uint32 GetSubscribedItems(PublishedFileId_t* pvecPublishedFileID,uint32 cMaxEntries);
		[LinkName("SteamAPI_ISteamUGC_GetItemState")]
		public extern uint32 GetItemState(PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_GetItemInstallInfo")]
		public extern bool GetItemInstallInfo(PublishedFileId_t nPublishedFileID,uint64* punSizeOnDisk,char8* pchFolder,uint32 cchFolderSize,uint32* punTimeStamp);
		[LinkName("SteamAPI_ISteamUGC_GetItemDownloadInfo")]
		public extern bool GetItemDownloadInfo(PublishedFileId_t nPublishedFileID,uint64* punBytesDownloaded,uint64* punBytesTotal);
		[LinkName("SteamAPI_ISteamUGC_DownloadItem")]
		public extern bool DownloadItem(PublishedFileId_t nPublishedFileID,bool bHighPriority);
		[LinkName("SteamAPI_ISteamUGC_BInitWorkshopForGameServer")]
		public extern bool BInitWorkshopForGameServer(DepotId_t unWorkshopDepotID,char8* pszFolder);
		[LinkName("SteamAPI_ISteamUGC_SuspendDownloads")]
		public extern void SuspendDownloads(bool bSuspend);
		[LinkName("SteamAPI_ISteamUGC_StartPlaytimeTracking")]
		public extern SteamAPICall_t StartPlaytimeTracking(PublishedFileId_t* pvecPublishedFileID,uint32 unNumPublishedFileIDs);
		[LinkName("SteamAPI_ISteamUGC_StopPlaytimeTracking")]
		public extern SteamAPICall_t StopPlaytimeTracking(PublishedFileId_t* pvecPublishedFileID,uint32 unNumPublishedFileIDs);
		[LinkName("SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems")]
		public extern SteamAPICall_t StopPlaytimeTrackingForAllItems();
		[LinkName("SteamAPI_ISteamUGC_AddDependency")]
		public extern SteamAPICall_t AddDependency(PublishedFileId_t nParentPublishedFileID,PublishedFileId_t nChildPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_RemoveDependency")]
		public extern SteamAPICall_t RemoveDependency(PublishedFileId_t nParentPublishedFileID,PublishedFileId_t nChildPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_AddAppDependency")]
		public extern SteamAPICall_t AddAppDependency(PublishedFileId_t nPublishedFileID,AppId_t nAppID);
		[LinkName("SteamAPI_ISteamUGC_RemoveAppDependency")]
		public extern SteamAPICall_t RemoveAppDependency(PublishedFileId_t nPublishedFileID,AppId_t nAppID);
		[LinkName("SteamAPI_ISteamUGC_GetAppDependencies")]
		public extern SteamAPICall_t GetAppDependencies(PublishedFileId_t nPublishedFileID);
		[LinkName("SteamAPI_ISteamUGC_DeleteItem")]
		public extern SteamAPICall_t DeleteItem(PublishedFileId_t nPublishedFileID);
	}
	public struct ISteamAppList : uint
	{
		[LinkName("SteamAPI_ISteamAppList_GetNumInstalledApps")]
		public extern uint32 GetNumInstalledApps();
		[LinkName("SteamAPI_ISteamAppList_GetInstalledApps")]
		public extern uint32 GetInstalledApps(AppId_t* pvecAppID,uint32 unMaxAppIDs);
		[LinkName("SteamAPI_ISteamAppList_GetAppName")]
		public extern int32 GetAppName(AppId_t nAppID,char8* pchName,int32 cchNameMax);
		[LinkName("SteamAPI_ISteamAppList_GetAppInstallDir")]
		public extern int32 GetAppInstallDir(AppId_t nAppID,char8* pchDirectory,int32 cchNameMax);
		[LinkName("SteamAPI_ISteamAppList_GetAppBuildId")]
		public extern int32 GetAppBuildId(AppId_t nAppID);
	}
	public struct ISteamHTMLSurface : uint
	{
		public enum EHTMLMouseButton : int32
		{
			Left = 0,
			Right = 1,
			Middle = 2,
		}
		public enum EMouseCursor : int32
		{
			dc_user = 0,
			dc_none = 1,
			dc_arrow = 2,
			dc_ibeam = 3,
			dc_hourglass = 4,
			dc_waitarrow = 5,
			dc_crosshair = 6,
			dc_up = 7,
			dc_sizenw = 8,
			dc_sizese = 9,
			dc_sizene = 10,
			dc_sizesw = 11,
			dc_sizew = 12,
			dc_sizee = 13,
			dc_sizen = 14,
			dc_sizes = 15,
			dc_sizewe = 16,
			dc_sizens = 17,
			dc_sizeall = 18,
			dc_no = 19,
			dc_hand = 20,
			dc_blank = 21,
			dc_middle_pan = 22,
			dc_north_pan = 23,
			dc_north_east_pan = 24,
			dc_east_pan = 25,
			dc_south_east_pan = 26,
			dc_south_pan = 27,
			dc_south_west_pan = 28,
			dc_west_pan = 29,
			dc_north_west_pan = 30,
			dc_alias = 31,
			dc_cell = 32,
			dc_colresize = 33,
			dc_copycur = 34,
			dc_verticaltext = 35,
			dc_rowresize = 36,
			dc_zoomin = 37,
			dc_zoomout = 38,
			dc_help = 39,
			dc_custom = 40,
			dc_last = 41,
		}
		public enum EHTMLKeyModifiers : int32
		{
			Modifier_None = 0,
			Modifier_AltDown = 1,
			Modifier_CtrlDown = 2,
			Modifier_ShiftDown = 4,
		}
		[LinkName("SteamAPI_ISteamHTMLSurface_Init")]
		public extern bool Init();
		[LinkName("SteamAPI_ISteamHTMLSurface_Shutdown")]
		public extern bool Shutdown();
		[LinkName("SteamAPI_ISteamHTMLSurface_CreateBrowser")]
		public extern SteamAPICall_t CreateBrowser(char8* pchUserAgent,char8* pchUserCSS);
		[LinkName("SteamAPI_ISteamHTMLSurface_RemoveBrowser")]
		public extern void RemoveBrowser(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_LoadURL")]
		public extern void LoadURL(HHTMLBrowser unBrowserHandle,char8* pchURL,char8* pchPostData);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetSize")]
		public extern void SetSize(HHTMLBrowser unBrowserHandle,uint32 unWidth,uint32 unHeight);
		[LinkName("SteamAPI_ISteamHTMLSurface_StopLoad")]
		public extern void StopLoad(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_Reload")]
		public extern void Reload(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_GoBack")]
		public extern void GoBack(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_GoForward")]
		public extern void GoForward(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_AddHeader")]
		public extern void AddHeader(HHTMLBrowser unBrowserHandle,char8* pchKey,char8* pchValue);
		[LinkName("SteamAPI_ISteamHTMLSurface_ExecuteJavascript")]
		public extern void ExecuteJavascript(HHTMLBrowser unBrowserHandle,char8* pchScript);
		[LinkName("SteamAPI_ISteamHTMLSurface_MouseUp")]
		public extern void MouseUp(HHTMLBrowser unBrowserHandle,EHTMLMouseButton eMouseButton);
		[LinkName("SteamAPI_ISteamHTMLSurface_MouseDown")]
		public extern void MouseDown(HHTMLBrowser unBrowserHandle,EHTMLMouseButton eMouseButton);
		[LinkName("SteamAPI_ISteamHTMLSurface_MouseDoubleClick")]
		public extern void MouseDoubleClick(HHTMLBrowser unBrowserHandle,EHTMLMouseButton eMouseButton);
		[LinkName("SteamAPI_ISteamHTMLSurface_MouseMove")]
		public extern void MouseMove(HHTMLBrowser unBrowserHandle,int32 x,int32 y);
		[LinkName("SteamAPI_ISteamHTMLSurface_MouseWheel")]
		public extern void MouseWheel(HHTMLBrowser unBrowserHandle,int32 nDelta);
		[LinkName("SteamAPI_ISteamHTMLSurface_KeyDown")]
		public extern void KeyDown(HHTMLBrowser unBrowserHandle,uint32 nNativeKeyCode,EHTMLKeyModifiers eHTMLKeyModifiers,bool bIsSystemKey);
		[LinkName("SteamAPI_ISteamHTMLSurface_KeyUp")]
		public extern void KeyUp(HHTMLBrowser unBrowserHandle,uint32 nNativeKeyCode,EHTMLKeyModifiers eHTMLKeyModifiers);
		[LinkName("SteamAPI_ISteamHTMLSurface_KeyChar")]
		public extern void KeyChar(HHTMLBrowser unBrowserHandle,uint32 cUnicodeChar,EHTMLKeyModifiers eHTMLKeyModifiers);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetHorizontalScroll")]
		public extern void SetHorizontalScroll(HHTMLBrowser unBrowserHandle,uint32 nAbsolutePixelScroll);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetVerticalScroll")]
		public extern void SetVerticalScroll(HHTMLBrowser unBrowserHandle,uint32 nAbsolutePixelScroll);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetKeyFocus")]
		public extern void SetKeyFocus(HHTMLBrowser unBrowserHandle,bool bHasKeyFocus);
		[LinkName("SteamAPI_ISteamHTMLSurface_ViewSource")]
		public extern void ViewSource(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_CopyToClipboard")]
		public extern void CopyToClipboard(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_PasteFromClipboard")]
		public extern void PasteFromClipboard(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_Find")]
		public extern void Find(HHTMLBrowser unBrowserHandle,char8* pchSearchStr,bool bCurrentlyInFind,bool bReverse);
		[LinkName("SteamAPI_ISteamHTMLSurface_StopFind")]
		public extern void StopFind(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_GetLinkAtPosition")]
		public extern void GetLinkAtPosition(HHTMLBrowser unBrowserHandle,int32 x,int32 y);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetCookie")]
		public extern void SetCookie(char8* pchHostname,char8* pchKey,char8* pchValue,char8* pchPath,RTime32 nExpires,bool bSecure,bool bHTTPOnly);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetPageScaleFactor")]
		public extern void SetPageScaleFactor(HHTMLBrowser unBrowserHandle,float flZoom,int32 nPointX,int32 nPointY);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetBackgroundMode")]
		public extern void SetBackgroundMode(HHTMLBrowser unBrowserHandle,bool bBackgroundMode);
		[LinkName("SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor")]
		public extern void SetDPIScalingFactor(HHTMLBrowser unBrowserHandle,float flDPIScaling);
		[LinkName("SteamAPI_ISteamHTMLSurface_OpenDeveloperTools")]
		public extern void OpenDeveloperTools(HHTMLBrowser unBrowserHandle);
		[LinkName("SteamAPI_ISteamHTMLSurface_AllowStartRequest")]
		public extern void AllowStartRequest(HHTMLBrowser unBrowserHandle,bool bAllowed);
		[LinkName("SteamAPI_ISteamHTMLSurface_JSDialogResponse")]
		public extern void JSDialogResponse(HHTMLBrowser unBrowserHandle,bool bResult);
		[LinkName("SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse")]
		public extern void FileLoadDialogResponse(HHTMLBrowser unBrowserHandle,char8** pchSelectedFiles);
	}
	public struct ISteamInventory : uint
	{
		[LinkName("SteamAPI_ISteamInventory_GetResultStatus")]
		public extern EResult GetResultStatus(SteamInventoryResult_t resultHandle);
		[LinkName("SteamAPI_ISteamInventory_GetResultItems")]
		public extern bool GetResultItems(SteamInventoryResult_t resultHandle,SteamItemDetails_t* pOutItemsArray,uint32* punOutItemsArraySize);
		[LinkName("SteamAPI_ISteamInventory_GetResultItemProperty")]
		public extern bool GetResultItemProperty(SteamInventoryResult_t resultHandle,uint32 unItemIndex,char8* pchPropertyName,char8* pchValueBuffer,uint32* punValueBufferSizeOut);
		[LinkName("SteamAPI_ISteamInventory_GetResultTimestamp")]
		public extern uint32 GetResultTimestamp(SteamInventoryResult_t resultHandle);
		[LinkName("SteamAPI_ISteamInventory_CheckResultSteamID")]
		public extern bool CheckResultSteamID(SteamInventoryResult_t resultHandle,CSteamID steamIDExpected);
		[LinkName("SteamAPI_ISteamInventory_DestroyResult")]
		public extern void DestroyResult(SteamInventoryResult_t resultHandle);
		[LinkName("SteamAPI_ISteamInventory_GetAllItems")]
		public extern bool GetAllItems(SteamInventoryResult_t* pResultHandle);
		[LinkName("SteamAPI_ISteamInventory_GetItemsByID")]
		public extern bool GetItemsByID(SteamInventoryResult_t* pResultHandle,SteamItemInstanceID_t* pInstanceIDs,uint32 unCountInstanceIDs);
		[LinkName("SteamAPI_ISteamInventory_SerializeResult")]
		public extern bool SerializeResult(SteamInventoryResult_t resultHandle,void* pOutBuffer,uint32* punOutBufferSize);
		[LinkName("SteamAPI_ISteamInventory_DeserializeResult")]
		public extern bool DeserializeResult(SteamInventoryResult_t* pOutResultHandle,void* pBuffer,uint32 unBufferSize,bool bRESERVED_MUST_BE_FALSE);
		[LinkName("SteamAPI_ISteamInventory_GenerateItems")]
		public extern bool GenerateItems(SteamInventoryResult_t* pResultHandle,SteamItemDef_t* pArrayItemDefs,uint32* punArrayQuantity,uint32 unArrayLength);
		[LinkName("SteamAPI_ISteamInventory_GrantPromoItems")]
		public extern bool GrantPromoItems(SteamInventoryResult_t* pResultHandle);
		[LinkName("SteamAPI_ISteamInventory_AddPromoItem")]
		public extern bool AddPromoItem(SteamInventoryResult_t* pResultHandle,SteamItemDef_t itemDef);
		[LinkName("SteamAPI_ISteamInventory_AddPromoItems")]
		public extern bool AddPromoItems(SteamInventoryResult_t* pResultHandle,SteamItemDef_t* pArrayItemDefs,uint32 unArrayLength);
		[LinkName("SteamAPI_ISteamInventory_ConsumeItem")]
		public extern bool ConsumeItem(SteamInventoryResult_t* pResultHandle,SteamItemInstanceID_t itemConsume,uint32 unQuantity);
		[LinkName("SteamAPI_ISteamInventory_ExchangeItems")]
		public extern bool ExchangeItems(SteamInventoryResult_t* pResultHandle,SteamItemDef_t* pArrayGenerate,uint32* punArrayGenerateQuantity,uint32 unArrayGenerateLength,SteamItemInstanceID_t* pArrayDestroy,uint32* punArrayDestroyQuantity,uint32 unArrayDestroyLength);
		[LinkName("SteamAPI_ISteamInventory_TransferItemQuantity")]
		public extern bool TransferItemQuantity(SteamInventoryResult_t* pResultHandle,SteamItemInstanceID_t itemIdSource,uint32 unQuantity,SteamItemInstanceID_t itemIdDest);
		[LinkName("SteamAPI_ISteamInventory_SendItemDropHeartbeat")]
		public extern void SendItemDropHeartbeat();
		[LinkName("SteamAPI_ISteamInventory_TriggerItemDrop")]
		public extern bool TriggerItemDrop(SteamInventoryResult_t* pResultHandle,SteamItemDef_t dropListDefinition);
		[LinkName("SteamAPI_ISteamInventory_TradeItems")]
		public extern bool TradeItems(SteamInventoryResult_t* pResultHandle,CSteamID steamIDTradePartner,SteamItemInstanceID_t* pArrayGive,uint32* pArrayGiveQuantity,uint32 nArrayGiveLength,SteamItemInstanceID_t* pArrayGet,uint32* pArrayGetQuantity,uint32 nArrayGetLength);
		[LinkName("SteamAPI_ISteamInventory_LoadItemDefinitions")]
		public extern bool LoadItemDefinitions();
		[LinkName("SteamAPI_ISteamInventory_GetItemDefinitionIDs")]
		public extern bool GetItemDefinitionIDs(SteamItemDef_t* pItemDefIDs,uint32* punItemDefIDsArraySize);
		[LinkName("SteamAPI_ISteamInventory_GetItemDefinitionProperty")]
		public extern bool GetItemDefinitionProperty(SteamItemDef_t iDefinition,char8* pchPropertyName,char8* pchValueBuffer,uint32* punValueBufferSizeOut);
		[LinkName("SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs")]
		public extern SteamAPICall_t RequestEligiblePromoItemDefinitionsIDs(CSteamID steamID);
		[LinkName("SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs")]
		public extern bool GetEligiblePromoItemDefinitionIDs(CSteamID steamID,SteamItemDef_t* pItemDefIDs,uint32* punItemDefIDsArraySize);
		[LinkName("SteamAPI_ISteamInventory_StartPurchase")]
		public extern SteamAPICall_t StartPurchase(SteamItemDef_t* pArrayItemDefs,uint32* punArrayQuantity,uint32 unArrayLength);
		[LinkName("SteamAPI_ISteamInventory_RequestPrices")]
		public extern SteamAPICall_t RequestPrices();
		[LinkName("SteamAPI_ISteamInventory_GetNumItemsWithPrices")]
		public extern uint32 GetNumItemsWithPrices();
		[LinkName("SteamAPI_ISteamInventory_GetItemsWithPrices")]
		public extern bool GetItemsWithPrices(SteamItemDef_t* pArrayItemDefs,uint64* pCurrentPrices,uint64* pBasePrices,uint32 unArrayLength);
		[LinkName("SteamAPI_ISteamInventory_GetItemPrice")]
		public extern bool GetItemPrice(SteamItemDef_t iDefinition,uint64* pCurrentPrice,uint64* pBasePrice);
		[LinkName("SteamAPI_ISteamInventory_StartUpdateProperties")]
		public extern SteamInventoryUpdateHandle_t StartUpdateProperties();
		[LinkName("SteamAPI_ISteamInventory_RemoveProperty")]
		public extern bool RemoveProperty(SteamInventoryUpdateHandle_t handle,SteamItemInstanceID_t nItemID,char8* pchPropertyName);
		[LinkName("SteamAPI_ISteamInventory_SetPropertyString")]
		public extern bool SetProperty(SteamInventoryUpdateHandle_t handle,SteamItemInstanceID_t nItemID,char8* pchPropertyName,char8* pchPropertyValue);
		[LinkName("SteamAPI_ISteamInventory_SetPropertyBool")]
		public extern bool SetProperty(SteamInventoryUpdateHandle_t handle,SteamItemInstanceID_t nItemID,char8* pchPropertyName,bool bValue);
		[LinkName("SteamAPI_ISteamInventory_SetPropertyInt64")]
		public extern bool SetProperty(SteamInventoryUpdateHandle_t handle,SteamItemInstanceID_t nItemID,char8* pchPropertyName,int64 nValue);
		[LinkName("SteamAPI_ISteamInventory_SetPropertyFloat")]
		public extern bool SetProperty(SteamInventoryUpdateHandle_t handle,SteamItemInstanceID_t nItemID,char8* pchPropertyName,float flValue);
		[LinkName("SteamAPI_ISteamInventory_SubmitUpdateProperties")]
		public extern bool SubmitUpdateProperties(SteamInventoryUpdateHandle_t handle,SteamInventoryResult_t* pResultHandle);
		[LinkName("SteamAPI_ISteamInventory_InspectItem")]
		public extern bool InspectItem(SteamInventoryResult_t* pResultHandle,char8* pchItemToken);
	}
	public struct ISteamVideo : uint
	{
		[LinkName("SteamAPI_ISteamVideo_GetVideoURL")]
		public extern void GetVideoURL(AppId_t unVideoAppID);
		[LinkName("SteamAPI_ISteamVideo_IsBroadcasting")]
		public extern bool IsBroadcasting(int32* pnNumViewers);
		[LinkName("SteamAPI_ISteamVideo_GetOPFSettings")]
		public extern void GetOPFSettings(AppId_t unVideoAppID);
		[LinkName("SteamAPI_ISteamVideo_GetOPFStringForApp")]
		public extern bool GetOPFStringForApp(AppId_t unVideoAppID,char8* pchBuffer,int32* pnBufferSize);
	}
	public struct ISteamParentalSettings : uint
	{
		[LinkName("SteamAPI_ISteamParentalSettings_BIsParentalLockEnabled")]
		public extern bool BIsParentalLockEnabled();
		[LinkName("SteamAPI_ISteamParentalSettings_BIsParentalLockLocked")]
		public extern bool BIsParentalLockLocked();
		[LinkName("SteamAPI_ISteamParentalSettings_BIsAppBlocked")]
		public extern bool BIsAppBlocked(AppId_t nAppID);
		[LinkName("SteamAPI_ISteamParentalSettings_BIsAppInBlockList")]
		public extern bool BIsAppInBlockList(AppId_t nAppID);
		[LinkName("SteamAPI_ISteamParentalSettings_BIsFeatureBlocked")]
		public extern bool BIsFeatureBlocked(EParentalFeature eFeature);
		[LinkName("SteamAPI_ISteamParentalSettings_BIsFeatureInBlockList")]
		public extern bool BIsFeatureInBlockList(EParentalFeature eFeature);
	}
	public struct ISteamRemotePlay : uint
	{
		[LinkName("SteamAPI_ISteamRemotePlay_GetSessionCount")]
		public extern uint32 GetSessionCount();
		[LinkName("SteamAPI_ISteamRemotePlay_GetSessionID")]
		public extern RemotePlaySessionID_t GetSessionID(int32 iSessionIndex);
		[LinkName("SteamAPI_ISteamRemotePlay_GetSessionSteamID")]
		public extern CSteamID GetSessionSteamID(RemotePlaySessionID_t unSessionID);
		[LinkName("SteamAPI_ISteamRemotePlay_GetSessionClientName")]
		public extern char8* GetSessionClientName(RemotePlaySessionID_t unSessionID);
		[LinkName("SteamAPI_ISteamRemotePlay_GetSessionClientFormFactor")]
		public extern ESteamDeviceFormFactor GetSessionClientFormFactor(RemotePlaySessionID_t unSessionID);
		[LinkName("SteamAPI_ISteamRemotePlay_BGetSessionClientResolution")]
		public extern bool BGetSessionClientResolution(RemotePlaySessionID_t unSessionID,int32* pnResolutionX,int32* pnResolutionY);
		[LinkName("SteamAPI_ISteamRemotePlay_BSendRemotePlayTogetherInvite")]
		public extern bool BSendRemotePlayTogetherInvite(CSteamID steamIDFriend);
	}
	public struct ISteamNetworkingMessages : uint
	{
		[LinkName("SteamAPI_ISteamNetworkingMessages_SendMessageToUser")]
		public extern EResult SendMessageToUser(in SteamNetworkingIdentity identityRemote,void* pubData,uint32 cubData,int32 nSendFlags,int32 nRemoteChannel);
		[LinkName("SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel")]
		public extern int32 ReceiveMessagesOnChannel(int32 nLocalChannel,SteamNetworkingMessage_t** ppOutMessages,int32 nMaxMessages);
		[LinkName("SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser")]
		public extern bool AcceptSessionWithUser(in SteamNetworkingIdentity identityRemote);
		[LinkName("SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser")]
		public extern bool CloseSessionWithUser(in SteamNetworkingIdentity identityRemote);
		[LinkName("SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser")]
		public extern bool CloseChannelWithUser(in SteamNetworkingIdentity identityRemote,int32 nLocalChannel);
		[LinkName("SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo")]
		public extern ESteamNetworkingConnectionState GetSessionConnectionInfo(in SteamNetworkingIdentity identityRemote,SteamNetConnectionInfo_t* pConnectionInfo,SteamNetworkingQuickConnectionStatus* pQuickStatus);
	}
	public struct ISteamNetworkingSockets : uint
	{
		[LinkName("SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP")]
		public extern HSteamListenSocket CreateListenSocketIP(in SteamNetworkingIPAddr localAddress,int32 nOptions,SteamNetworkingConfigValue_t* pOptions);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress")]
		public extern HSteamNetConnection ConnectByIPAddress(in SteamNetworkingIPAddr address,int32 nOptions,SteamNetworkingConfigValue_t* pOptions);
		[LinkName("SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P")]
		public extern HSteamListenSocket CreateListenSocketP2P(int32 nLocalVirtualPort,int32 nOptions,SteamNetworkingConfigValue_t* pOptions);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ConnectP2P")]
		public extern HSteamNetConnection ConnectP2P(in SteamNetworkingIdentity identityRemote,int32 nRemoteVirtualPort,int32 nOptions,SteamNetworkingConfigValue_t* pOptions);
		[LinkName("SteamAPI_ISteamNetworkingSockets_AcceptConnection")]
		public extern EResult AcceptConnection(HSteamNetConnection hConn);
		[LinkName("SteamAPI_ISteamNetworkingSockets_CloseConnection")]
		public extern bool CloseConnection(HSteamNetConnection hPeer,int32 nReason,char8* pszDebug,bool bEnableLinger);
		[LinkName("SteamAPI_ISteamNetworkingSockets_CloseListenSocket")]
		public extern bool CloseListenSocket(HSteamListenSocket hSocket);
		[LinkName("SteamAPI_ISteamNetworkingSockets_SetConnectionUserData")]
		public extern bool SetConnectionUserData(HSteamNetConnection hPeer,int64 nUserData);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetConnectionUserData")]
		public extern int64 GetConnectionUserData(HSteamNetConnection hPeer);
		[LinkName("SteamAPI_ISteamNetworkingSockets_SetConnectionName")]
		public extern void SetConnectionName(HSteamNetConnection hPeer,char8* pszName);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetConnectionName")]
		public extern bool GetConnectionName(HSteamNetConnection hPeer,char8* pszName,int32 nMaxLen);
		[LinkName("SteamAPI_ISteamNetworkingSockets_SendMessageToConnection")]
		public extern EResult SendMessageToConnection(HSteamNetConnection hConn,void* pData,uint32 cbData,int32 nSendFlags,int64* pOutMessageNumber);
		[LinkName("SteamAPI_ISteamNetworkingSockets_SendMessages")]
		public extern void SendMessages(int32 nMessages,SteamNetworkingMessage_t** pMessages,int64* pOutMessageNumberOrResult);
		[LinkName("SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection")]
		public extern EResult FlushMessagesOnConnection(HSteamNetConnection hConn);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection")]
		public extern int32 ReceiveMessagesOnConnection(HSteamNetConnection hConn,SteamNetworkingMessage_t** ppOutMessages,int32 nMaxMessages);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetConnectionInfo")]
		public extern bool GetConnectionInfo(HSteamNetConnection hConn,SteamNetConnectionInfo_t* pInfo);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetQuickConnectionStatus")]
		public extern bool GetQuickConnectionStatus(HSteamNetConnection hConn,SteamNetworkingQuickConnectionStatus* pStats);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus")]
		public extern int32 GetDetailedConnectionStatus(HSteamNetConnection hConn,char8* pszBuf,int32 cbBuf);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress")]
		public extern bool GetListenSocketAddress(HSteamListenSocket hSocket,SteamNetworkingIPAddr* address);
		[LinkName("SteamAPI_ISteamNetworkingSockets_CreateSocketPair")]
		public extern bool CreateSocketPair(HSteamNetConnection* pOutConnection1,HSteamNetConnection* pOutConnection2,bool bUseNetworkLoopback,SteamNetworkingIdentity* pIdentity1,SteamNetworkingIdentity* pIdentity2);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetIdentity")]
		public extern bool GetIdentity(SteamNetworkingIdentity* pIdentity);
		[LinkName("SteamAPI_ISteamNetworkingSockets_InitAuthentication")]
		public extern ESteamNetworkingAvailability InitAuthentication();
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus")]
		public extern ESteamNetworkingAvailability GetAuthenticationStatus(SteamNetAuthenticationStatus_t* pDetails);
		[LinkName("SteamAPI_ISteamNetworkingSockets_CreatePollGroup")]
		public extern HSteamNetPollGroup CreatePollGroup();
		[LinkName("SteamAPI_ISteamNetworkingSockets_DestroyPollGroup")]
		public extern bool DestroyPollGroup(HSteamNetPollGroup hPollGroup);
		[LinkName("SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup")]
		public extern bool SetConnectionPollGroup(HSteamNetConnection hConn,HSteamNetPollGroup hPollGroup);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup")]
		public extern int32 ReceiveMessagesOnPollGroup(HSteamNetPollGroup hPollGroup,SteamNetworkingMessage_t** ppOutMessages,int32 nMaxMessages);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket")]
		public extern bool ReceivedRelayAuthTicket(void* pvTicket,int32 cbTicket,SteamDatagramRelayAuthTicket* pOutParsedTicket);
		[LinkName("SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer")]
		public extern int32 FindRelayAuthTicketForServer(in SteamNetworkingIdentity identityGameServer,int32 nRemoteVirtualPort,SteamDatagramRelayAuthTicket* pOutParsedTicket);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer")]
		public extern HSteamNetConnection ConnectToHostedDedicatedServer(in SteamNetworkingIdentity identityTarget,int32 nRemoteVirtualPort,int32 nOptions,SteamNetworkingConfigValue_t* pOptions);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort")]
		public extern uint16 GetHostedDedicatedServerPort();
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID")]
		public extern SteamNetworkingPOPID GetHostedDedicatedServerPOPID();
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress")]
		public extern EResult GetHostedDedicatedServerAddress(SteamDatagramHostedAddress* pRouting);
		[LinkName("SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket")]
		public extern HSteamListenSocket CreateHostedDedicatedServerListenSocket(int32 nLocalVirtualPort,int32 nOptions,SteamNetworkingConfigValue_t* pOptions);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin")]
		public extern EResult GetGameCoordinatorServerLogin(SteamDatagramGameCoordinatorServerLogin* pLoginInfo,int32* pcbSignedBlob,void* pBlob);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling")]
		public extern HSteamNetConnection ConnectP2PCustomSignaling(ISteamNetworkingConnectionSignaling pSignaling,SteamNetworkingIdentity* pPeerIdentity,int32 nRemoteVirtualPort,int32 nOptions,SteamNetworkingConfigValue_t* pOptions);
		[LinkName("SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal")]
		public extern bool ReceivedP2PCustomSignal(void* pMsg,int32 cbMsg,ISteamNetworkingSignalingRecvContext pContext);
		[LinkName("SteamAPI_ISteamNetworkingSockets_GetCertificateRequest")]
		public extern bool GetCertificateRequest(int32* pcbBlob,void* pBlob,ref SteamNetworkingErrMsg errMsg);
		[LinkName("SteamAPI_ISteamNetworkingSockets_SetCertificate")]
		public extern bool SetCertificate(void* pCertificate,int32 cbCertificate,ref SteamNetworkingErrMsg errMsg);
		[LinkName("SteamAPI_ISteamNetworkingSockets_RunCallbacks")]
		public extern void RunCallbacks();
	}
	public struct ISteamNetworkingUtils : uint
	{
		[LinkName("SteamAPI_ISteamNetworkingUtils_AllocateMessage")]
		public extern SteamNetworkingMessage_t* AllocateMessage(int32 cbAllocateBuffer);
		[LinkName("SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess")]
		public extern void InitRelayNetworkAccess();
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus")]
		public extern ESteamNetworkingAvailability GetRelayNetworkStatus(SteamRelayNetworkStatus_t* pDetails);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation")]
		public extern float GetLocalPingLocation(ref SteamNetworkPingLocation_t result);
		[LinkName("SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations")]
		public extern int32 EstimatePingTimeBetweenTwoLocations(in SteamNetworkPingLocation_t location1,in SteamNetworkPingLocation_t location2);
		[LinkName("SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost")]
		public extern int32 EstimatePingTimeFromLocalHost(in SteamNetworkPingLocation_t remoteLocation);
		[LinkName("SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString")]
		public extern void ConvertPingLocationToString(in SteamNetworkPingLocation_t location,char8* pszBuf,int32 cchBufSize);
		[LinkName("SteamAPI_ISteamNetworkingUtils_ParsePingLocationString")]
		public extern bool ParsePingLocationString(char8* pszString,ref SteamNetworkPingLocation_t result);
		[LinkName("SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate")]
		public extern bool CheckPingDataUpToDate(float flMaxAgeSeconds);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter")]
		public extern int32 GetPingToDataCenter(SteamNetworkingPOPID popID,SteamNetworkingPOPID* pViaRelayPoP);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP")]
		public extern int32 GetDirectPingToPOP(SteamNetworkingPOPID popID);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetPOPCount")]
		public extern int32 GetPOPCount();
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetPOPList")]
		public extern int32 GetPOPList(SteamNetworkingPOPID* list,int32 nListSz);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetLocalTimestamp")]
		public extern SteamNetworkingMicroseconds GetLocalTimestamp();
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction")]
		public extern void SetDebugOutputFunction(ESteamNetworkingSocketsDebugOutputType eDetailLevel,FSteamNetworkingSocketsDebugOutput pfnFunc);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32")]
		public extern bool SetGlobalConfigValueInt32(ESteamNetworkingConfigValue eValue,int32 val);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat")]
		public extern bool SetGlobalConfigValueFloat(ESteamNetworkingConfigValue eValue,float val);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString")]
		public extern bool SetGlobalConfigValueString(ESteamNetworkingConfigValue eValue,char8* val);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr")]
		public extern bool SetGlobalConfigValuePtr(ESteamNetworkingConfigValue eValue,void* val);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32")]
		public extern bool SetConnectionConfigValueInt32(HSteamNetConnection hConn,ESteamNetworkingConfigValue eValue,int32 val);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat")]
		public extern bool SetConnectionConfigValueFloat(HSteamNetConnection hConn,ESteamNetworkingConfigValue eValue,float val);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString")]
		public extern bool SetConnectionConfigValueString(HSteamNetConnection hConn,ESteamNetworkingConfigValue eValue,char8* val);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged")]
		public extern bool SetGlobalCallback_SteamNetConnectionStatusChanged(FnSteamNetConnectionStatusChanged fnCallback);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged")]
		public extern bool SetGlobalCallback_SteamNetAuthenticationStatusChanged(FnSteamNetAuthenticationStatusChanged fnCallback);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged")]
		public extern bool SetGlobalCallback_SteamRelayNetworkStatusChanged(FnSteamRelayNetworkStatusChanged fnCallback);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest")]
		public extern bool SetGlobalCallback_MessagesSessionRequest(FnSteamNetworkingMessagesSessionRequest fnCallback);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed")]
		public extern bool SetGlobalCallback_MessagesSessionFailed(FnSteamNetworkingMessagesSessionFailed fnCallback);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetConfigValue")]
		public extern bool SetConfigValue(ESteamNetworkingConfigValue eValue,ESteamNetworkingConfigScope eScopeType,int scopeObj,ESteamNetworkingConfigDataType eDataType,void* pArg);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct")]
		public extern bool SetConfigValueStruct(in SteamNetworkingConfigValue_t opt,ESteamNetworkingConfigScope eScopeType,int scopeObj);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetConfigValue")]
		public extern ESteamNetworkingGetConfigValueResult GetConfigValue(ESteamNetworkingConfigValue eValue,ESteamNetworkingConfigScope eScopeType,int scopeObj,ESteamNetworkingConfigDataType* pOutDataType,void* pResult,uint* cbResult);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo")]
		public extern bool GetConfigValueInfo(ESteamNetworkingConfigValue eValue,char8** pOutName,ESteamNetworkingConfigDataType* pOutDataType,ESteamNetworkingConfigScope* pOutScope,ESteamNetworkingConfigValue* pOutNextValue);
		[LinkName("SteamAPI_ISteamNetworkingUtils_GetFirstConfigValue")]
		public extern ESteamNetworkingConfigValue GetFirstConfigValue();
		[LinkName("SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString")]
		public extern void SteamNetworkingIPAddr_ToString(in SteamNetworkingIPAddr addr,char8* buf,uint32 cbBuf,bool bWithPort);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString")]
		public extern bool SteamNetworkingIPAddr_ParseString(SteamNetworkingIPAddr* pAddr,char8* pszStr);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString")]
		public extern void SteamNetworkingIdentity_ToString(in SteamNetworkingIdentity identity,char8* buf,uint32 cbBuf);
		[LinkName("SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString")]
		public extern bool SteamNetworkingIdentity_ParseString(SteamNetworkingIdentity* pIdentity,char8* pszStr);
	}
	public struct ISteamGameServer : uint
	{
		[LinkName("SteamAPI_ISteamGameServer_SetProduct")]
		public extern void SetProduct(char8* pszProduct);
		[LinkName("SteamAPI_ISteamGameServer_SetGameDescription")]
		public extern void SetGameDescription(char8* pszGameDescription);
		[LinkName("SteamAPI_ISteamGameServer_SetModDir")]
		public extern void SetModDir(char8* pszModDir);
		[LinkName("SteamAPI_ISteamGameServer_SetDedicatedServer")]
		public extern void SetDedicatedServer(bool bDedicated);
		[LinkName("SteamAPI_ISteamGameServer_LogOn")]
		public extern void LogOn(char8* pszToken);
		[LinkName("SteamAPI_ISteamGameServer_LogOnAnonymous")]
		public extern void LogOnAnonymous();
		[LinkName("SteamAPI_ISteamGameServer_LogOff")]
		public extern void LogOff();
		[LinkName("SteamAPI_ISteamGameServer_BLoggedOn")]
		public extern bool BLoggedOn();
		[LinkName("SteamAPI_ISteamGameServer_BSecure")]
		public extern bool BSecure();
		[LinkName("SteamAPI_ISteamGameServer_GetSteamID")]
		public extern CSteamID GetSteamID();
		[LinkName("SteamAPI_ISteamGameServer_WasRestartRequested")]
		public extern bool WasRestartRequested();
		[LinkName("SteamAPI_ISteamGameServer_SetMaxPlayerCount")]
		public extern void SetMaxPlayerCount(int32 cPlayersMax);
		[LinkName("SteamAPI_ISteamGameServer_SetBotPlayerCount")]
		public extern void SetBotPlayerCount(int32 cBotplayers);
		[LinkName("SteamAPI_ISteamGameServer_SetServerName")]
		public extern void SetServerName(char8* pszServerName);
		[LinkName("SteamAPI_ISteamGameServer_SetMapName")]
		public extern void SetMapName(char8* pszMapName);
		[LinkName("SteamAPI_ISteamGameServer_SetPasswordProtected")]
		public extern void SetPasswordProtected(bool bPasswordProtected);
		[LinkName("SteamAPI_ISteamGameServer_SetSpectatorPort")]
		public extern void SetSpectatorPort(uint16 unSpectatorPort);
		[LinkName("SteamAPI_ISteamGameServer_SetSpectatorServerName")]
		public extern void SetSpectatorServerName(char8* pszSpectatorServerName);
		[LinkName("SteamAPI_ISteamGameServer_ClearAllKeyValues")]
		public extern void ClearAllKeyValues();
		[LinkName("SteamAPI_ISteamGameServer_SetKeyValue")]
		public extern void SetKeyValue(char8* pKey,char8* pValue);
		[LinkName("SteamAPI_ISteamGameServer_SetGameTags")]
		public extern void SetGameTags(char8* pchGameTags);
		[LinkName("SteamAPI_ISteamGameServer_SetGameData")]
		public extern void SetGameData(char8* pchGameData);
		[LinkName("SteamAPI_ISteamGameServer_SetRegion")]
		public extern void SetRegion(char8* pszRegion);
		[LinkName("SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate")]
		public extern bool SendUserConnectAndAuthenticate(uint32 unIPClient,void* pvAuthBlob,uint32 cubAuthBlobSize,CSteamID* pSteamIDUser);
		[LinkName("SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection")]
		public extern CSteamID CreateUnauthenticatedUserConnection();
		[LinkName("SteamAPI_ISteamGameServer_SendUserDisconnect")]
		public extern void SendUserDisconnect(CSteamID steamIDUser);
		[LinkName("SteamAPI_ISteamGameServer_BUpdateUserData")]
		public extern bool BUpdateUserData(CSteamID steamIDUser,char8* pchPlayerName,uint32 uScore);
		[LinkName("SteamAPI_ISteamGameServer_GetAuthSessionTicket")]
		public extern HAuthTicket GetAuthSessionTicket(void* pTicket,int32 cbMaxTicket,uint32* pcbTicket);
		[LinkName("SteamAPI_ISteamGameServer_BeginAuthSession")]
		public extern EBeginAuthSessionResult BeginAuthSession(void* pAuthTicket,int32 cbAuthTicket,CSteamID steamID);
		[LinkName("SteamAPI_ISteamGameServer_EndAuthSession")]
		public extern void EndAuthSession(CSteamID steamID);
		[LinkName("SteamAPI_ISteamGameServer_CancelAuthTicket")]
		public extern void CancelAuthTicket(HAuthTicket hAuthTicket);
		[LinkName("SteamAPI_ISteamGameServer_UserHasLicenseForApp")]
		public extern EUserHasLicenseForAppResult UserHasLicenseForApp(CSteamID steamID,AppId_t appID);
		[LinkName("SteamAPI_ISteamGameServer_RequestUserGroupStatus")]
		public extern bool RequestUserGroupStatus(CSteamID steamIDUser,CSteamID steamIDGroup);
		[LinkName("SteamAPI_ISteamGameServer_GetGameplayStats")]
		public extern void GetGameplayStats();
		[LinkName("SteamAPI_ISteamGameServer_GetServerReputation")]
		public extern SteamAPICall_t GetServerReputation();
		[LinkName("SteamAPI_ISteamGameServer_GetPublicIP")]
		public extern SteamIPAddress_t GetPublicIP();
		[LinkName("SteamAPI_ISteamGameServer_HandleIncomingPacket")]
		public extern bool HandleIncomingPacket(void* pData,int32 cbData,uint32 srcIP,uint16 srcPort);
		[LinkName("SteamAPI_ISteamGameServer_GetNextOutgoingPacket")]
		public extern int32 GetNextOutgoingPacket(void* pOut,int32 cbMaxOut,uint32* pNetAdr,uint16* pPort);
		[LinkName("SteamAPI_ISteamGameServer_EnableHeartbeats")]
		public extern void EnableHeartbeats(bool bActive);
		[LinkName("SteamAPI_ISteamGameServer_SetHeartbeatInterval")]
		public extern void SetHeartbeatInterval(int32 iHeartbeatInterval);
		[LinkName("SteamAPI_ISteamGameServer_ForceHeartbeat")]
		public extern void ForceHeartbeat();
		[LinkName("SteamAPI_ISteamGameServer_AssociateWithClan")]
		public extern SteamAPICall_t AssociateWithClan(CSteamID steamIDClan);
		[LinkName("SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility")]
		public extern SteamAPICall_t ComputeNewPlayerCompatibility(CSteamID steamIDNewPlayer);
	}
	public struct ISteamGameServerStats : uint
	{
		[LinkName("SteamAPI_ISteamGameServerStats_RequestUserStats")]
		public extern SteamAPICall_t RequestUserStats(CSteamID steamIDUser);
		[LinkName("SteamAPI_ISteamGameServerStats_GetUserStatInt32")]
		public extern bool GetUserStat(CSteamID steamIDUser,char8* pchName,int32* pData);
		[LinkName("SteamAPI_ISteamGameServerStats_GetUserStatFloat")]
		public extern bool GetUserStat(CSteamID steamIDUser,char8* pchName,float* pData);
		[LinkName("SteamAPI_ISteamGameServerStats_GetUserAchievement")]
		public extern bool GetUserAchievement(CSteamID steamIDUser,char8* pchName,bool* pbAchieved);
		[LinkName("SteamAPI_ISteamGameServerStats_SetUserStatInt32")]
		public extern bool SetUserStat(CSteamID steamIDUser,char8* pchName,int32 nData);
		[LinkName("SteamAPI_ISteamGameServerStats_SetUserStatFloat")]
		public extern bool SetUserStat(CSteamID steamIDUser,char8* pchName,float fData);
		[LinkName("SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat")]
		public extern bool UpdateUserAvgRateStat(CSteamID steamIDUser,char8* pchName,float flCountThisSession,double dSessionLength);
		[LinkName("SteamAPI_ISteamGameServerStats_SetUserAchievement")]
		public extern bool SetUserAchievement(CSteamID steamIDUser,char8* pchName);
		[LinkName("SteamAPI_ISteamGameServerStats_ClearUserAchievement")]
		public extern bool ClearUserAchievement(CSteamID steamIDUser,char8* pchName);
		[LinkName("SteamAPI_ISteamGameServerStats_StoreUserStats")]
		public extern SteamAPICall_t StoreUserStats(CSteamID steamIDUser);
	}
	public static class Accessors
	{
		[LinkName("SteamAPI_SteamUser_v021")]
		public static extern ISteamUser SteamUser();
		[LinkName("SteamAPI_SteamFriends_v017")]
		public static extern ISteamFriends SteamFriends();
		[LinkName("SteamAPI_SteamUtils_v010")]
		public static extern ISteamUtils SteamUtils();
		[LinkName("SteamAPI_SteamGameServerUtils_v010")]
		public static extern ISteamUtils SteamGameServerUtils();
		[LinkName("SteamAPI_SteamMatchmaking_v009")]
		public static extern ISteamMatchmaking SteamMatchmaking();
		[LinkName("SteamAPI_SteamMatchmakingServers_v002")]
		public static extern ISteamMatchmakingServers SteamMatchmakingServers();
		[LinkName("SteamAPI_SteamGameSearch_v001")]
		public static extern ISteamGameSearch SteamGameSearch();
		[LinkName("SteamAPI_SteamParties_v002")]
		public static extern ISteamParties SteamParties();
		[LinkName("SteamAPI_SteamRemoteStorage_v014")]
		public static extern ISteamRemoteStorage SteamRemoteStorage();
		[LinkName("SteamAPI_SteamUserStats_v012")]
		public static extern ISteamUserStats SteamUserStats();
		[LinkName("SteamAPI_SteamApps_v008")]
		public static extern ISteamApps SteamApps();
		[LinkName("SteamAPI_SteamGameServerApps_v008")]
		public static extern ISteamApps SteamGameServerApps();
		[LinkName("SteamAPI_SteamNetworking_v006")]
		public static extern ISteamNetworking SteamNetworking();
		[LinkName("SteamAPI_SteamGameServerNetworking_v006")]
		public static extern ISteamNetworking SteamGameServerNetworking();
		[LinkName("SteamAPI_SteamScreenshots_v003")]
		public static extern ISteamScreenshots SteamScreenshots();
		[LinkName("SteamAPI_SteamMusic_v001")]
		public static extern ISteamMusic SteamMusic();
		[LinkName("SteamAPI_SteamMusicRemote_v001")]
		public static extern ISteamMusicRemote SteamMusicRemote();
		[LinkName("SteamAPI_SteamHTTP_v003")]
		public static extern ISteamHTTP SteamHTTP();
		[LinkName("SteamAPI_SteamGameServerHTTP_v003")]
		public static extern ISteamHTTP SteamGameServerHTTP();
		[LinkName("SteamAPI_SteamInput_v002")]
		public static extern ISteamInput SteamInput();
		[LinkName("SteamAPI_SteamController_v008")]
		public static extern ISteamController SteamController();
		[LinkName("SteamAPI_SteamUGC_v015")]
		public static extern ISteamUGC SteamUGC();
		[LinkName("SteamAPI_SteamGameServerUGC_v015")]
		public static extern ISteamUGC SteamGameServerUGC();
		[LinkName("SteamAPI_SteamAppList_v001")]
		public static extern ISteamAppList SteamAppList();
		[LinkName("SteamAPI_SteamHTMLSurface_v005")]
		public static extern ISteamHTMLSurface SteamHTMLSurface();
		[LinkName("SteamAPI_SteamInventory_v003")]
		public static extern ISteamInventory SteamInventory();
		[LinkName("SteamAPI_SteamGameServerInventory_v003")]
		public static extern ISteamInventory SteamGameServerInventory();
		[LinkName("SteamAPI_SteamVideo_v002")]
		public static extern ISteamVideo SteamVideo();
		[LinkName("SteamAPI_SteamParentalSettings_v001")]
		public static extern ISteamParentalSettings SteamParentalSettings();
		[LinkName("SteamAPI_SteamRemotePlay_v001")]
		public static extern ISteamRemotePlay SteamRemotePlay();
		[LinkName("SteamAPI_SteamNetworkingMessages_SteamAPI_v002")]
		public static extern ISteamNetworkingMessages SteamNetworkingMessages_SteamAPI();
		[LinkName("SteamAPI_SteamGameServerNetworkingMessages_SteamAPI_v002")]
		public static extern ISteamNetworkingMessages SteamGameServerNetworkingMessages_SteamAPI();
		[LinkName("SteamAPI_SteamNetworkingSockets_SteamAPI_v009")]
		public static extern ISteamNetworkingSockets SteamNetworkingSockets_SteamAPI();
		[LinkName("SteamAPI_SteamGameServerNetworkingSockets_SteamAPI_v009")]
		public static extern ISteamNetworkingSockets SteamGameServerNetworkingSockets_SteamAPI();
		[LinkName("SteamAPI_SteamNetworkingUtils_SteamAPI_v003")]
		public static extern ISteamNetworkingUtils SteamNetworkingUtils_SteamAPI();
		[LinkName("SteamAPI_SteamGameServer_v013")]
		public static extern ISteamGameServer SteamGameServer();
		[LinkName("SteamAPI_SteamGameServerStats_v001")]
		public static extern ISteamGameServerStats SteamGameServerStats();
	}

}