using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	public static class SteamFriends
	{
		const int MESSAGE_BUFFER_SIZE = 8192 + 1;

		static ISteamFriends _friends;
		static internal bool Init()
		{
			return (_friends = Accessors.SteamFriends()) != 0;
		}

		public static void ActivateGameOverlay(StringView dialog)
		{
			_friends.ActivateGameOverlay(TerminateString!(dialog));
		}

		public static void ActivateGameOverlayInviteDialog(CSteamID lobbyId)
		{
			_friends.ActivateGameOverlayInviteDialog(lobbyId);
		}

		public static void ActivateGameOverlayInviteDialogConnectString(StringView connectionString)
		{
			_friends.ActivateGameOverlayInviteDialogConnectString(TerminateString!(connectionString));
		}

		public static void ActivateGameOverlayRemotePlayTogetherInviteDialog(CSteamID lobbyId)
		{
			_friends.ActivateGameOverlayRemotePlayTogetherInviteDialog(lobbyId);
		}

		public static void ActivateGameOverlayToStore(AppId_t appId, EOverlayToStoreFlag flags)
		{
			_friends.ActivateGameOverlayToStore(appId, flags);
		}

		public static void ActivateGameOverlayToUser(StringView dialog, CSteamID steamId)
		{
			_friends.ActivateGameOverlayToUser(TerminateString!(dialog), steamId);
		}

		public static void ActivateGameOverlayToWebPage(StringView dialog, EActivateGameOverlayToWebPageMode mode)
		{
			_friends.ActivateGameOverlayToWebPage(TerminateString!(dialog), mode);
		}

		public static void ClearRichPresence()
		{
			_friends.ClearRichPresence();
		}

		public static bool CloseClanChatWindowInSteam(CSteamID clanChatId)
		{
			return _friends.CloseClanChatWindowInSteam(clanChatId);
		}

		[NoDiscard]
		public static SteamAPICall_t DownloadClanActivityCounts(Span<CSteamID> clans)
		{
			return _friends.DownloadClanActivityCounts(clans.Ptr, (.)clans.Length);
		}

		[NoDiscard]
		public static SteamAPICall_t EnumerateFollowingList(uint32 startIndex)
		{
			return _friends.EnumerateFollowingList(startIndex);
		}

		public static CSteamID GetChatMemberByIndex(CSteamID clanId, int32 user)
		{
			return _friends.GetChatMemberByIndex(clanId, user);
		}

		public static bool GetClanActivityCounts(CSteamID clanId, out int32 online, out int32 inGame, out int32 chatting)
		{
			online = inGame = chatting = ?;
			return _friends.GetClanActivityCounts(clanId, &online, &inGame, &chatting);
		}

		public static CSteamID GetClanByIndex(int32 clan)
		{
			return _friends.GetClanByIndex(clan);
		}

		public static int32 GetClanChatMemberCount(CSteamID clanId)
		{
			return _friends.GetClanChatMemberCount(clanId);
		}

		public static int32 GetClanChatMessage(CSteamID clanId, int32 message, String messageBuffer, out EChatEntryType type, out CSteamID chatter)
		{
			chatter = type = ?;
			char8[MESSAGE_BUFFER_SIZE] buffer = ?;
			let length = _friends.GetClanChatMessage(clanId, message, &buffer, buffer.Count, &type, &chatter);
			messageBuffer.Append(&buffer, length);
			return length;
		}

		public static int32 GetClanCount()
		{
			return _friends.GetClanCount();
		}

		public static StringView GetClanName(CSteamID clanId)
		{
			return StringView(_friends.GetClanName(clanId));
		}

		public static CSteamID GetClanCount(CSteamID clanId, int32 officer)
		{
			return _friends.GetClanOfficerByIndex(clanId, officer);
		}

		public static int32 GetClanOfficerCount(CSteamID clanId)
		{
			return _friends.GetClanOfficerCount(clanId);
		}

		public static CSteamID GetClanOwner(CSteamID clanId)
		{
			return _friends.GetClanOwner(clanId);
		}

		public static StringView GetClanTag(CSteamID clanId)
		{
			return StringView(_friends.GetClanTag(clanId));
		}

		public static CSteamID GetCoplayFriend(int32 coplayFriend)
		{
			return _friends.GetCoplayFriend(coplayFriend);
		}

		public static int32 GetCoplayFriendCount()
		{
			return _friends.GetCoplayFriendCount();
		}

		[NoDiscard]
		public static SteamAPICall_t GetFollowerCount(CSteamID steamId)
		{
			return _friends.GetFollowerCount(steamId);
		}

		public static CSteamID GetFriendByIndex(int32 friend, EFriendFlags flags)
		{
			return _friends.GetFriendByIndex(friend, (int32)flags);
		}

		public static AppId_t GetFriendCoplayGame(CSteamID steamId)
		{
			return _friends.GetFriendCoplayGame(steamId);
		}

		public static int32 GetFriendCoplayTime(CSteamID steamId)
		{
			return _friends.GetFriendCoplayTime(steamId);
		}

		public static int32 GetFriendCount(EFriendFlags flags)
		{
			return _friends.GetFriendCount((int32)flags);
		}

		public static int32 GetFriendCountFromSource(CSteamID sourceId)
		{
			return _friends.GetFriendCountFromSource(sourceId);
		}

		public static CSteamID GetFriendFromSourceByIndex(CSteamID sourceId, int32 friend)
		{
			return _friends.GetFriendFromSourceByIndex(sourceId, friend);
		}

		public static bool GetFriendGamePlayed(CSteamID friendId, out FriendGameInfo_t info)
		{
			info = ?;
			return _friends.GetFriendGamePlayed(friendId, &info);
		}

		public static int32 GetFriendMessage(CSteamID friendId, int32 messageId, String messageBuffer, out EChatEntryType type)
		{
			type = ?;
			char8[MESSAGE_BUFFER_SIZE] buffer = ?;
			let length = _friends.GetFriendMessage(friendId, messageId, &buffer, buffer.Count, &type);
			messageBuffer.Append(&buffer, length);
			return length;
		}

		public static StringView GetFriendPersonaName(CSteamID friendId)
		{
			return StringView(_friends.GetFriendPersonaName(friendId));
		}

		public static StringView GetFriendPersonaNameHistory(CSteamID friendId, int32 personaName)
		{
			return StringView(_friends.GetFriendPersonaNameHistory(friendId, personaName));
		}

		public static EPersonaState GetFriendPersonaState(CSteamID friendId)
		{
			return _friends.GetFriendPersonaState(friendId);
		}

		public static EFriendRelationship GetFriendRelationship(CSteamID friendId)
		{
			return _friends.GetFriendRelationship(friendId);
		}

		public static StringView GetFriendRichPresence(CSteamID friendId, StringView key)
		{
			return StringView(_friends.GetFriendRichPresence(friendId, TerminateString!(key)));
		}

		public static StringView GetFriendRichPresenceKeyByIndex(CSteamID friendId, int32 key)
		{
			return StringView(_friends.GetFriendRichPresenceKeyByIndex(friendId, key));
		}

		public static int32 GetFriendRichPresenceKeyCount(CSteamID friendId)
		{
			return _friends.GetFriendRichPresenceKeyCount(friendId);
		}

		public static int32 GetFriendsGroupCount()
		{
			return _friends.GetFriendsGroupCount();
		}

		public static FriendsGroupID_t GetFriendsGroupIDByIndex(int32 friendGroup)
		{
			return _friends.GetFriendsGroupIDByIndex(friendGroup);
		}

		public static int32 GetFriendsGroupMembersCount(FriendsGroupID_t friendGroup)
		{
			return _friends.GetFriendsGroupMembersCount(friendGroup);
		}

		public static void GetFriendsGroupMembersList(FriendsGroupID_t friendGroup, Span<CSteamID> members)
		{
			_friends.GetFriendsGroupMembersList(friendGroup, members.Ptr, (int32)members.Length);
		}

		public static StringView GetFriendsGroupName(FriendsGroupID_t friendGroup)
		{
			return StringView(_friends.GetFriendsGroupName(friendGroup));
		}

		public static int32 GetFriendSteamLevel(CSteamID friendId)
		{
			return _friends.GetFriendSteamLevel(friendId);
		}

		public static int32 GetLargeFriendAvatar(CSteamID friendId)
		{
			return _friends.GetLargeFriendAvatar(friendId);
		}

		public static int32 GetMediumFriendAvatar(CSteamID friendId)
		{
			return _friends.GetMediumFriendAvatar(friendId);
		}

		public static int32 GetNumChatsWithUnreadPriorityMessages()
		{
			return _friends.GetNumChatsWithUnreadPriorityMessages();
		}

		public static StringView GetPersonaName()
		{
			return StringView(_friends.GetPersonaName());
		}

		public static EPersonaState GetPersonaState()
		{
			return _friends.GetPersonaState();
		}

		public static StringView GetPlayerNickname(CSteamID playerId)
		{
			return StringView(_friends.GetPlayerNickname(playerId));
		}

		public static int32 GetSmallFriendAvatar(CSteamID friendId)
		{
			return _friends.GetSmallFriendAvatar(friendId);
		}

		public static EUserRestriction GetUserRestrictions()
		{
			return (EUserRestriction)_friends.GetUserRestrictions();
		}

		public static bool HasFriend(CSteamID friendId, EFriendFlags flags)
		{
			return _friends.HasFriend(friendId, (int32)flags);
		}

		public static bool InviteUserToGame(CSteamID friendId, StringView connectString)
		{
			return _friends.InviteUserToGame(friendId, TerminateString!(connectString));
		}

		public static bool IsClanChatAdmin(CSteamID clanId, CSteamID userId)
		{
			return _friends.IsClanChatAdmin(clanId, userId);
		}

		public static bool IsClanChatWindowOpenInSteam(CSteamID clanId)
		{
			return _friends.IsClanChatWindowOpenInSteam(clanId);
		}

		public static bool IsClanOfficialGameGroup(CSteamID clanId)
		{
			return _friends.IsClanOfficialGameGroup(clanId);
		}

		public static bool IsClanPublic(CSteamID clanId)
		{
			return _friends.IsClanPublic(clanId);
		}

		[NoDiscard]
		public static SteamAPICall_t IsFollowing(CSteamID clanId)
		{
			return _friends.IsFollowing(clanId);
		}

		public static bool IsUserInSource(CSteamID userId, CSteamID sourceId)
		{
			return _friends.IsUserInSource(userId, sourceId);
		}

		[NoDiscard]
		public static SteamAPICall_t JoinClanChatRoom(CSteamID clanId)
		{
			return _friends.JoinClanChatRoom(clanId);
		}

		public static bool LeaveClanChatRoom(CSteamID clanId)
		{
			return _friends.LeaveClanChatRoom(clanId);
		}

		public static bool OpenClanChatWindowInSteam(CSteamID clanId)
		{
			return _friends.OpenClanChatWindowInSteam(clanId);
		}

		public static bool RegisterProtocolInOverlayBrowser(StringView protocol)
		{
			return _friends.RegisterProtocolInOverlayBrowser(TerminateString!(protocol));
		}

		public static bool ReplyToFriendMessage(CSteamID friendId, StringView message)
		{
			return _friends.ReplyToFriendMessage(friendId, TerminateString!(message));
		}

		[NoDiscard]
		public static SteamAPICall_t RequestClanOfficerList(CSteamID clanId)
		{
			return _friends.RequestClanOfficerList(clanId);
		}

		public static void RequestFriendRichPresence(CSteamID friendId)
		{
			_friends.RequestFriendRichPresence(friendId);
		}

		public static bool RequestFriendRichPresence(CSteamID friendId, bool requireNameOnly)
		{
			return _friends.RequestUserInformation(friendId, requireNameOnly);
		}

		public static bool SendClanChatMessage(CSteamID clanId, StringView message)
		{
			return _friends.SendClanChatMessage(clanId, TerminateString!(message));
		}

		public static void SetInGameVoiceSpeaking(CSteamID userId, bool speaking)
		{
			_friends.SetInGameVoiceSpeaking(userId, speaking);
		}

		public static bool SetListenForFriendsMessages(bool interceptEnabled)
		{
			return _friends.SetListenForFriendsMessages(interceptEnabled);
		}

		[NoDiscard]
		public static SteamAPICall_t SetListenForFriendsMessages(StringView name)
		{
			return _friends.SetPersonaName(TerminateString!(name));
		}

		public static void SetPlayedWith(CSteamID playedWithId)
		{
			_friends.SetPlayedWith(playedWithId);
		}

		public static void SetPlayedWith(StringView key, StringView value)
		{
			_friends.SetRichPresence(TerminateString!(key), TerminateString!(value));
		}
	}
}
