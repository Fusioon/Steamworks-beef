using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	public static class SteamMatchmaking
	{
		static ISteamMatchmaking _mm;
		internal static bool Init()
		{
			return (_mm = Accessors.SteamMatchmaking()) != 0;
		}

		public static int32 GetFavoriteGameCount()
		{
			return _mm.GetFavoriteGameCount();
		}

		public static bool GetFavoriteGame(int32 iGame, out AppId_t pnAppID, out uint32 pnIP, out uint16 pnConnPort, out uint16 pnQueryPort, out uint32 punFlags, out uint32 pRTime32LastPlayedOnServer)
		{
			pnAppID = pnIP = pnConnPort = pnQueryPort = punFlags = pRTime32LastPlayedOnServer = ?;
			return _mm.GetFavoriteGame(iGame, &pnAppID, &pnIP, &pnConnPort, &pnQueryPort, &punFlags, &pRTime32LastPlayedOnServer);
		}

		public static int32 AddFavoriteGame(AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, uint32 unFlags, uint32 rTime32LastPlayedOnServer)
		{
			return _mm.AddFavoriteGame(nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer);
		}

		public static bool RemoveFavoriteGame(AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, uint32 unFlags)
		{
			return _mm.RemoveFavoriteGame(nAppID, nIP, nConnPort, nQueryPort, unFlags);
		}

		[NoDiscard]
		public static SteamAPICall_t RequestLobbyList()
		{
			return _mm.RequestLobbyList();
		}

		public static void AddRequestLobbyListStringFilter(StringView pchKeyToMatch, StringView pchValueToMatch, ELobbyComparison eComparisonType)
		{
			_mm.AddRequestLobbyListStringFilter(TerminateString!(pchKeyToMatch), TerminateString!(pchValueToMatch), eComparisonType);
		}

		public static void AddRequestLobbyListNumericalFilter(StringView pchKeyToMatch, int32 nValueToMatch, ELobbyComparison eComparisonType)
		{
			_mm.AddRequestLobbyListNumericalFilter(TerminateString!(pchKeyToMatch), nValueToMatch, eComparisonType);
		}

		public static void AddRequestLobbyListNearValueFilter(StringView pchKeyToMatch, int32 nValueToBeCloseTo)
		{
			_mm.AddRequestLobbyListNearValueFilter(TerminateString!(pchKeyToMatch), nValueToBeCloseTo);
		}

		public static void AddRequestLobbyListFilterSlotsAvailable(int32 nSlotsAvailable)
		{
			_mm.AddRequestLobbyListFilterSlotsAvailable(nSlotsAvailable);
		}

		public static void AddRequestLobbyListDistanceFilter(ELobbyDistanceFilter eLobbyDistanceFilter)
		{
			_mm.AddRequestLobbyListDistanceFilter(eLobbyDistanceFilter);
		}

		public static void AddRequestLobbyListResultCountFilter(int32 cMaxResults)
		{
			_mm.AddRequestLobbyListResultCountFilter(cMaxResults);
		}

		public static void AddRequestLobbyListCompatibleMembersFilter(CSteamID steamIDLobby)
		{
			_mm.AddRequestLobbyListCompatibleMembersFilter(steamIDLobby);
		}

		public static CSteamID GetLobbyByIndex(int32 iLobby)
		{
			return _mm.GetLobbyByIndex(iLobby);
		}

		[NoDiscard]
		public static SteamAPICall_t CreateLobby(ELobbyType eLobbyType, int32 cMaxMembers)
		{
			return _mm.CreateLobby(eLobbyType, cMaxMembers);
		}

		[NoDiscard]
		public static SteamAPICall_t JoinLobby(CSteamID steamIDLobby)
		{
			return _mm.JoinLobby(steamIDLobby);
		}

		public static void LeaveLobby(CSteamID steamIDLobby)
		{
			_mm.LeaveLobby(steamIDLobby);
		}

		public static bool InviteUserToLobby(CSteamID steamIDLobby, CSteamID steamIDInvitee)
		{
			return _mm.InviteUserToLobby(steamIDLobby, steamIDInvitee);
		}

		public static int32 GetNumLobbyMembers(CSteamID steamIDLobby)
		{
			return _mm.GetNumLobbyMembers(steamIDLobby);
		}

		public static CSteamID GetLobbyMemberByIndex(CSteamID steamIDLobby, int32 iMember)
		{
			return _mm.GetLobbyMemberByIndex(steamIDLobby, iMember);
		}

		public static StringView GetLobbyData(CSteamID steamIDLobby, StringView pchKey)
		{
			return StringView(_mm.GetLobbyData(steamIDLobby, TerminateString!(pchKey)));
		}

		public static bool SetLobbyData(CSteamID steamIDLobby, StringView pchKey, StringView pchValue)
		{
			return _mm.SetLobbyData(steamIDLobby, TerminateString!(pchKey), TerminateString!(pchValue));
		}

		public static int32 GetLobbyDataCount(CSteamID steamIDLobby)
		{
			return _mm.GetLobbyDataCount(steamIDLobby);
		}

		public static bool GetLobbyDataByIndex(CSteamID steamIDLobby, int32 iLobbyData, String keyBuffer, String valueBuffer)
		{
			return _mm.GetLobbyDataByIndex(steamIDLobby, iLobbyData, keyBuffer.Ptr, (int32)keyBuffer.Length, valueBuffer.Ptr, (int32)valueBuffer.Length);
		}

		public static bool DeleteLobbyData(CSteamID steamIDLobby, StringView pchKey)
		{
			return _mm.DeleteLobbyData(steamIDLobby, TerminateString!(pchKey));
		}

		public static StringView GetLobbyMemberData(CSteamID steamIDLobby, CSteamID steamIDUser, StringView pchKey)
		{
			return StringView(_mm.GetLobbyMemberData(steamIDLobby, steamIDUser, TerminateString!(pchKey)));
		}

		public static void SetLobbyMemberData(CSteamID steamIDLobby, StringView pchKey, StringView pchValue)
		{
			_mm.SetLobbyMemberData(steamIDLobby, TerminateString!(pchKey), TerminateString!(pchValue));
		}

		public static bool SendLobbyChatMsg(CSteamID steamIDLobby, void* pvMsgBody, int32 cubMsgBody)
		{
			return _mm.SendLobbyChatMsg(steamIDLobby, pvMsgBody, cubMsgBody);
		}

		public static bool SendLobbyChatMsg<T>(CSteamID steamIDLobby, in T msgBody) where T : struct
		{
			return _mm.SendLobbyChatMsg(steamIDLobby, &msgBody, sizeof(T));
		}

		public static int32 GetLobbyChatEntry(CSteamID steamIDLobby, int32 iChatID, out CSteamID pSteamIDUser, void* pvData, int32 cubData, out EChatEntryType peChatEntryType)
		{
			pSteamIDUser = peChatEntryType = ?;
			return _mm.GetLobbyChatEntry(steamIDLobby, iChatID, &pSteamIDUser, pvData, cubData, &peChatEntryType);
		}

		public static int32 GetLobbyChatEntry<T>(CSteamID steamIDLobby, int32 iChatID, out CSteamID pSteamIDUser, out T body, out EChatEntryType peChatEntryType) where T : struct
		{
			pSteamIDUser = peChatEntryType = ?; body = ?;
			return _mm.GetLobbyChatEntry(steamIDLobby, iChatID, &pSteamIDUser, &body, sizeof(T), &peChatEntryType);
		}

		public static bool RequestLobbyData(CSteamID steamIDLobby)
		{
			return _mm.RequestLobbyData(steamIDLobby);
		}

		public static void SetLobbyGameServer(CSteamID steamIDLobby, uint32 unGameServerIP, uint16 unGameServerPort, CSteamID steamIDGameServer)
		{
			_mm.SetLobbyGameServer(steamIDLobby, unGameServerIP, unGameServerPort, steamIDGameServer);
		}

		public static bool GetLobbyGameServer(CSteamID steamIDLobby, out uint32 punGameServerIP, out uint16 punGameServerPort, out CSteamID psteamIDGameServer)
		{
			punGameServerIP = punGameServerPort = psteamIDGameServer = ?;
			return _mm.GetLobbyGameServer(steamIDLobby, &punGameServerIP, &punGameServerPort, &psteamIDGameServer);
		}

		public static bool SetLobbyMemberLimit(CSteamID steamIDLobby, int32 cMaxMembers)
		{
			return _mm.SetLobbyMemberLimit(steamIDLobby, cMaxMembers);
		}

		public static int32 GetLobbyMemberLimit(CSteamID steamIDLobby)
		{
			return _mm.GetLobbyMemberLimit(steamIDLobby);
		}

		public static bool SetLobbyType(CSteamID steamIDLobby, ELobbyType eLobbyType)
		{
			return _mm.SetLobbyType(steamIDLobby, eLobbyType);
		}

		public static bool SetLobbyJoinable(CSteamID steamIDLobby, bool bLobbyJoinable)
		{
			return _mm.SetLobbyJoinable(steamIDLobby, bLobbyJoinable);
		}

		public static CSteamID GetLobbyOwner(CSteamID steamIDLobby)
		{
			return _mm.GetLobbyOwner(steamIDLobby);
		}

		public static bool SetLobbyOwner(CSteamID steamIDLobby, CSteamID steamIDNewOwner)
		{
			return _mm.SetLobbyOwner(steamIDLobby, steamIDNewOwner);
		}

		public static bool SetLinkedLobby(CSteamID steamIDLobby, CSteamID steamIDLobbyDependent)
		{
			return _mm.SetLinkedLobby(steamIDLobby, steamIDLobbyDependent);
		}
	}
}
