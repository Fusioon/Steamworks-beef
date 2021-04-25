using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamFriends
	{
		static ISteamFriends _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamFriends()) != 0;
		public static StringView GetPersonaName()
		{
			return StringView(_iface.GetPersonaName());
		}
		[NoDiscard]
		public static SteamAPICall_t SetPersonaName(StringView pchPersonaName)
		{
			return _iface.SetPersonaName(TerminateString!(pchPersonaName));
		}
		public static EPersonaState GetPersonaState()
		{
			return _iface.GetPersonaState();
		}
		public static int32 GetFriendCount(int32 iFriendFlags)
		{
			return _iface.GetFriendCount(iFriendFlags);
		}
		public static CSteamID GetFriendByIndex(int32 iFriend, int32 iFriendFlags)
		{
			return _iface.GetFriendByIndex(iFriend, iFriendFlags);
		}
		public static EFriendRelationship GetFriendRelationship(CSteamID steamIDFriend)
		{
			return _iface.GetFriendRelationship(steamIDFriend);
		}
		public static EPersonaState GetFriendPersonaState(CSteamID steamIDFriend)
		{
			return _iface.GetFriendPersonaState(steamIDFriend);
		}
		public static StringView GetFriendPersonaName(CSteamID steamIDFriend)
		{
			return StringView(_iface.GetFriendPersonaName(steamIDFriend));
		}
		public static bool GetFriendGamePlayed(CSteamID steamIDFriend, FriendGameInfo_t* pFriendGameInfo)
		{
			return _iface.GetFriendGamePlayed(steamIDFriend, pFriendGameInfo);
		}
		public static StringView GetFriendPersonaNameHistory(CSteamID steamIDFriend, int32 iPersonaName)
		{
			return StringView(_iface.GetFriendPersonaNameHistory(steamIDFriend, iPersonaName));
		}
		public static int32 GetFriendSteamLevel(CSteamID steamIDFriend)
		{
			return _iface.GetFriendSteamLevel(steamIDFriend);
		}
		public static StringView GetPlayerNickname(CSteamID steamIDPlayer)
		{
			return StringView(_iface.GetPlayerNickname(steamIDPlayer));
		}
		public static int32 GetFriendsGroupCount()
		{
			return _iface.GetFriendsGroupCount();
		}
		public static FriendsGroupID_t GetFriendsGroupIDByIndex(int32 iFG)
		{
			return _iface.GetFriendsGroupIDByIndex(iFG);
		}
		public static StringView GetFriendsGroupName(FriendsGroupID_t friendsGroupID)
		{
			return StringView(_iface.GetFriendsGroupName(friendsGroupID));
		}
		public static int32 GetFriendsGroupMembersCount(FriendsGroupID_t friendsGroupID)
		{
			return _iface.GetFriendsGroupMembersCount(friendsGroupID);
		}
		public static void GetFriendsGroupMembersList(FriendsGroupID_t friendsGroupID, CSteamID* pOutSteamIDMembers, int32 nMembersCount)
		{
			_iface.GetFriendsGroupMembersList(friendsGroupID, pOutSteamIDMembers, nMembersCount);
		}
		public static bool HasFriend(CSteamID steamIDFriend, int32 iFriendFlags)
		{
			return _iface.HasFriend(steamIDFriend, iFriendFlags);
		}
		public static int32 GetClanCount()
		{
			return _iface.GetClanCount();
		}
		public static CSteamID GetClanByIndex(int32 iClan)
		{
			return _iface.GetClanByIndex(iClan);
		}
		public static StringView GetClanName(CSteamID steamIDClan)
		{
			return StringView(_iface.GetClanName(steamIDClan));
		}
		public static StringView GetClanTag(CSteamID steamIDClan)
		{
			return StringView(_iface.GetClanTag(steamIDClan));
		}
		public static bool GetClanActivityCounts(CSteamID steamIDClan, out int32 pnOnline, out int32 pnInGame, out int32 pnChatting)
		{
			pnOnline = ?;
			pnInGame = ?;
			pnChatting = ?;
			return _iface.GetClanActivityCounts(steamIDClan, &pnOnline, &pnInGame, &pnChatting);
		}
		[NoDiscard]
		public static SteamAPICall_t DownloadClanActivityCounts(CSteamID* psteamIDClans, int32 cClansToRequest)
		{
			return _iface.DownloadClanActivityCounts(psteamIDClans, cClansToRequest);
		}
		public static int32 GetFriendCountFromSource(CSteamID steamIDSource)
		{
			return _iface.GetFriendCountFromSource(steamIDSource);
		}
		public static CSteamID GetFriendFromSourceByIndex(CSteamID steamIDSource, int32 iFriend)
		{
			return _iface.GetFriendFromSourceByIndex(steamIDSource, iFriend);
		}
		public static bool IsUserInSource(CSteamID steamIDUser, CSteamID steamIDSource)
		{
			return _iface.IsUserInSource(steamIDUser, steamIDSource);
		}
		public static void SetInGameVoiceSpeaking(CSteamID steamIDUser, bool bSpeaking)
		{
			_iface.SetInGameVoiceSpeaking(steamIDUser, bSpeaking);
		}
		public static void ActivateGameOverlay(StringView pchDialog)
		{
			_iface.ActivateGameOverlay(TerminateString!(pchDialog));
		}
		public static void ActivateGameOverlayToUser(StringView pchDialog, CSteamID steamID)
		{
			_iface.ActivateGameOverlayToUser(TerminateString!(pchDialog), steamID);
		}
		public static void ActivateGameOverlayToWebPage(StringView pchURL, EActivateGameOverlayToWebPageMode eMode)
		{
			_iface.ActivateGameOverlayToWebPage(TerminateString!(pchURL), eMode);
		}
		public static void ActivateGameOverlayToStore(AppId_t nAppID, EOverlayToStoreFlag eFlag)
		{
			_iface.ActivateGameOverlayToStore(nAppID, eFlag);
		}
		public static void SetPlayedWith(CSteamID steamIDUserPlayedWith)
		{
			_iface.SetPlayedWith(steamIDUserPlayedWith);
		}
		public static void ActivateGameOverlayInviteDialog(CSteamID steamIDLobby)
		{
			_iface.ActivateGameOverlayInviteDialog(steamIDLobby);
		}
		public static int32 GetSmallFriendAvatar(CSteamID steamIDFriend)
		{
			return _iface.GetSmallFriendAvatar(steamIDFriend);
		}
		public static int32 GetMediumFriendAvatar(CSteamID steamIDFriend)
		{
			return _iface.GetMediumFriendAvatar(steamIDFriend);
		}
		public static int32 GetLargeFriendAvatar(CSteamID steamIDFriend)
		{
			return _iface.GetLargeFriendAvatar(steamIDFriend);
		}
		public static bool RequestUserInformation(CSteamID steamIDUser, bool bRequireNameOnly)
		{
			return _iface.RequestUserInformation(steamIDUser, bRequireNameOnly);
		}
		[NoDiscard]
		public static SteamAPICall_t RequestClanOfficerList(CSteamID steamIDClan)
		{
			return _iface.RequestClanOfficerList(steamIDClan);
		}
		public static CSteamID GetClanOwner(CSteamID steamIDClan)
		{
			return _iface.GetClanOwner(steamIDClan);
		}
		public static int32 GetClanOfficerCount(CSteamID steamIDClan)
		{
			return _iface.GetClanOfficerCount(steamIDClan);
		}
		public static CSteamID GetClanOfficerByIndex(CSteamID steamIDClan, int32 iOfficer)
		{
			return _iface.GetClanOfficerByIndex(steamIDClan, iOfficer);
		}
		public static uint32 GetUserRestrictions()
		{
			return _iface.GetUserRestrictions();
		}
		public static bool SetRichPresence(StringView pchKey, StringView pchValue)
		{
			return _iface.SetRichPresence(TerminateString!(pchKey), TerminateString!(pchValue));
		}
		public static void ClearRichPresence()
		{
			_iface.ClearRichPresence();
		}
		public static StringView GetFriendRichPresence(CSteamID steamIDFriend, StringView pchKey)
		{
			return StringView(_iface.GetFriendRichPresence(steamIDFriend, TerminateString!(pchKey)));
		}
		public static int32 GetFriendRichPresenceKeyCount(CSteamID steamIDFriend)
		{
			return _iface.GetFriendRichPresenceKeyCount(steamIDFriend);
		}
		public static StringView GetFriendRichPresenceKeyByIndex(CSteamID steamIDFriend, int32 iKey)
		{
			return StringView(_iface.GetFriendRichPresenceKeyByIndex(steamIDFriend, iKey));
		}
		public static void RequestFriendRichPresence(CSteamID steamIDFriend)
		{
			_iface.RequestFriendRichPresence(steamIDFriend);
		}
		public static bool InviteUserToGame(CSteamID steamIDFriend, StringView pchConnectString)
		{
			return _iface.InviteUserToGame(steamIDFriend, TerminateString!(pchConnectString));
		}
		public static int32 GetCoplayFriendCount()
		{
			return _iface.GetCoplayFriendCount();
		}
		public static CSteamID GetCoplayFriend(int32 iCoplayFriend)
		{
			return _iface.GetCoplayFriend(iCoplayFriend);
		}
		public static int32 GetFriendCoplayTime(CSteamID steamIDFriend)
		{
			return _iface.GetFriendCoplayTime(steamIDFriend);
		}
		public static AppId_t GetFriendCoplayGame(CSteamID steamIDFriend)
		{
			return _iface.GetFriendCoplayGame(steamIDFriend);
		}
		[NoDiscard]
		public static SteamAPICall_t JoinClanChatRoom(CSteamID steamIDClan)
		{
			return _iface.JoinClanChatRoom(steamIDClan);
		}
		public static bool LeaveClanChatRoom(CSteamID steamIDClan)
		{
			return _iface.LeaveClanChatRoom(steamIDClan);
		}
		public static int32 GetClanChatMemberCount(CSteamID steamIDClan)
		{
			return _iface.GetClanChatMemberCount(steamIDClan);
		}
		public static CSteamID GetChatMemberByIndex(CSteamID steamIDClan, int32 iUser)
		{
			return _iface.GetChatMemberByIndex(steamIDClan, iUser);
		}
		public static bool SendClanChatMessage(CSteamID steamIDClanChat, StringView pchText)
		{
			return _iface.SendClanChatMessage(steamIDClanChat, TerminateString!(pchText));
		}
		public static int32 GetClanChatMessage(CSteamID steamIDClanChat, int32 iMessage, void* prgchText, int32 cchTextMax, EChatEntryType* peChatEntryType, CSteamID* psteamidChatter)
		{
			return _iface.GetClanChatMessage(steamIDClanChat, iMessage, prgchText, cchTextMax, peChatEntryType, psteamidChatter);
		}
		public static bool IsClanChatAdmin(CSteamID steamIDClanChat, CSteamID steamIDUser)
		{
			return _iface.IsClanChatAdmin(steamIDClanChat, steamIDUser);
		}
		public static bool IsClanChatWindowOpenInSteam(CSteamID steamIDClanChat)
		{
			return _iface.IsClanChatWindowOpenInSteam(steamIDClanChat);
		}
		public static bool OpenClanChatWindowInSteam(CSteamID steamIDClanChat)
		{
			return _iface.OpenClanChatWindowInSteam(steamIDClanChat);
		}
		public static bool CloseClanChatWindowInSteam(CSteamID steamIDClanChat)
		{
			return _iface.CloseClanChatWindowInSteam(steamIDClanChat);
		}
		public static bool SetListenForFriendsMessages(bool bInterceptEnabled)
		{
			return _iface.SetListenForFriendsMessages(bInterceptEnabled);
		}
		public static bool ReplyToFriendMessage(CSteamID steamIDFriend, StringView pchMsgToSend)
		{
			return _iface.ReplyToFriendMessage(steamIDFriend, TerminateString!(pchMsgToSend));
		}
		public static int32 GetFriendMessage(CSteamID steamIDFriend, int32 iMessageID, void* pvData, int32 cubData, EChatEntryType* peChatEntryType)
		{
			return _iface.GetFriendMessage(steamIDFriend, iMessageID, pvData, cubData, peChatEntryType);
		}
		[NoDiscard]
		public static SteamAPICall_t GetFollowerCount(CSteamID steamID)
		{
			return _iface.GetFollowerCount(steamID);
		}
		[NoDiscard]
		public static SteamAPICall_t IsFollowing(CSteamID steamID)
		{
			return _iface.IsFollowing(steamID);
		}
		[NoDiscard]
		public static SteamAPICall_t EnumerateFollowingList(uint32 unStartIndex)
		{
			return _iface.EnumerateFollowingList(unStartIndex);
		}
		public static bool IsClanPublic(CSteamID steamIDClan)
		{
			return _iface.IsClanPublic(steamIDClan);
		}
		public static bool IsClanOfficialGameGroup(CSteamID steamIDClan)
		{
			return _iface.IsClanOfficialGameGroup(steamIDClan);
		}
		public static int32 GetNumChatsWithUnreadPriorityMessages()
		{
			return _iface.GetNumChatsWithUnreadPriorityMessages();
		}
		public static void ActivateGameOverlayRemotePlayTogetherInviteDialog(CSteamID steamIDLobby)
		{
			_iface.ActivateGameOverlayRemotePlayTogetherInviteDialog(steamIDLobby);
		}
		public static bool RegisterProtocolInOverlayBrowser(StringView pchProtocol)
		{
			return _iface.RegisterProtocolInOverlayBrowser(TerminateString!(pchProtocol));
		}
		public static void ActivateGameOverlayInviteDialogConnectString(StringView pchConnectString)
		{
			_iface.ActivateGameOverlayInviteDialogConnectString(TerminateString!(pchConnectString));
		}
	}
}