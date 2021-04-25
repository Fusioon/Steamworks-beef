using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamMatchmaking
	{
		static ISteamMatchmaking _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamMatchmaking()) != 0;
		public static int32 GetFavoriteGameCount()
		{
			return _iface.GetFavoriteGameCount();
		}
		public static bool GetFavoriteGame(int32 iGame, AppId_t* pnAppID, out uint32 pnIP, out uint16 pnConnPort, out uint16 pnQueryPort, out uint32 punFlags, out uint32 pRTime32LastPlayedOnServer)
		{
			pnIP = ?;
			pnConnPort = ?;
			pnQueryPort = ?;
			punFlags = ?;
			pRTime32LastPlayedOnServer = ?;
			return _iface.GetFavoriteGame(iGame, pnAppID, &pnIP, &pnConnPort, &pnQueryPort, &punFlags, &pRTime32LastPlayedOnServer);
		}
		public static int32 AddFavoriteGame(AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, uint32 unFlags, uint32 rTime32LastPlayedOnServer)
		{
			return _iface.AddFavoriteGame(nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer);
		}
		public static bool RemoveFavoriteGame(AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, uint32 unFlags)
		{
			return _iface.RemoveFavoriteGame(nAppID, nIP, nConnPort, nQueryPort, unFlags);
		}
		[NoDiscard]
		public static SteamAPICall_t RequestLobbyList()
		{
			return _iface.RequestLobbyList();
		}
		public static void AddRequestLobbyListStringFilter(StringView pchKeyToMatch, StringView pchValueToMatch, ELobbyComparison eComparisonType)
		{
			_iface.AddRequestLobbyListStringFilter(TerminateString!(pchKeyToMatch), TerminateString!(pchValueToMatch), eComparisonType);
		}
		public static void AddRequestLobbyListNumericalFilter(StringView pchKeyToMatch, int32 nValueToMatch, ELobbyComparison eComparisonType)
		{
			_iface.AddRequestLobbyListNumericalFilter(TerminateString!(pchKeyToMatch), nValueToMatch, eComparisonType);
		}
		public static void AddRequestLobbyListNearValueFilter(StringView pchKeyToMatch, int32 nValueToBeCloseTo)
		{
			_iface.AddRequestLobbyListNearValueFilter(TerminateString!(pchKeyToMatch), nValueToBeCloseTo);
		}
		public static void AddRequestLobbyListFilterSlotsAvailable(int32 nSlotsAvailable)
		{
			_iface.AddRequestLobbyListFilterSlotsAvailable(nSlotsAvailable);
		}
		public static void AddRequestLobbyListDistanceFilter(ELobbyDistanceFilter eLobbyDistanceFilter)
		{
			_iface.AddRequestLobbyListDistanceFilter(eLobbyDistanceFilter);
		}
		public static void AddRequestLobbyListResultCountFilter(int32 cMaxResults)
		{
			_iface.AddRequestLobbyListResultCountFilter(cMaxResults);
		}
		public static void AddRequestLobbyListCompatibleMembersFilter(CSteamID steamIDLobby)
		{
			_iface.AddRequestLobbyListCompatibleMembersFilter(steamIDLobby);
		}
		public static CSteamID GetLobbyByIndex(int32 iLobby)
		{
			return _iface.GetLobbyByIndex(iLobby);
		}
		[NoDiscard]
		public static SteamAPICall_t CreateLobby(ELobbyType eLobbyType, int32 cMaxMembers)
		{
			return _iface.CreateLobby(eLobbyType, cMaxMembers);
		}
		[NoDiscard]
		public static SteamAPICall_t JoinLobby(CSteamID steamIDLobby)
		{
			return _iface.JoinLobby(steamIDLobby);
		}
		public static void LeaveLobby(CSteamID steamIDLobby)
		{
			_iface.LeaveLobby(steamIDLobby);
		}
		public static bool InviteUserToLobby(CSteamID steamIDLobby, CSteamID steamIDInvitee)
		{
			return _iface.InviteUserToLobby(steamIDLobby, steamIDInvitee);
		}
		public static int32 GetNumLobbyMembers(CSteamID steamIDLobby)
		{
			return _iface.GetNumLobbyMembers(steamIDLobby);
		}
		public static CSteamID GetLobbyMemberByIndex(CSteamID steamIDLobby, int32 iMember)
		{
			return _iface.GetLobbyMemberByIndex(steamIDLobby, iMember);
		}
		public static StringView GetLobbyData(CSteamID steamIDLobby, StringView pchKey)
		{
			return StringView(_iface.GetLobbyData(steamIDLobby, TerminateString!(pchKey)));
		}
		public static bool SetLobbyData(CSteamID steamIDLobby, StringView pchKey, StringView pchValue)
		{
			return _iface.SetLobbyData(steamIDLobby, TerminateString!(pchKey), TerminateString!(pchValue));
		}
		public static int32 GetLobbyDataCount(CSteamID steamIDLobby)
		{
			return _iface.GetLobbyDataCount(steamIDLobby);
		}
		public static bool GetLobbyDataByIndex(CSteamID steamIDLobby, int32 iLobbyData, char8* pchKey, int32 cchKeyBufferSize, char8* pchValue, int32 cchValueBufferSize)
		{
			return _iface.GetLobbyDataByIndex(steamIDLobby, iLobbyData, pchKey, cchKeyBufferSize, pchValue, cchValueBufferSize);
		}
		public static bool DeleteLobbyData(CSteamID steamIDLobby, StringView pchKey)
		{
			return _iface.DeleteLobbyData(steamIDLobby, TerminateString!(pchKey));
		}
		public static StringView GetLobbyMemberData(CSteamID steamIDLobby, CSteamID steamIDUser, StringView pchKey)
		{
			return StringView(_iface.GetLobbyMemberData(steamIDLobby, steamIDUser, TerminateString!(pchKey)));
		}
		public static void SetLobbyMemberData(CSteamID steamIDLobby, StringView pchKey, StringView pchValue)
		{
			_iface.SetLobbyMemberData(steamIDLobby, TerminateString!(pchKey), TerminateString!(pchValue));
		}
		public static bool SendLobbyChatMsg(CSteamID steamIDLobby, void* pvMsgBody, int32 cubMsgBody)
		{
			return _iface.SendLobbyChatMsg(steamIDLobby, pvMsgBody, cubMsgBody);
		}
		public static int32 GetLobbyChatEntry(CSteamID steamIDLobby, int32 iChatID, CSteamID* pSteamIDUser, void* pvData, int32 cubData, EChatEntryType* peChatEntryType)
		{
			return _iface.GetLobbyChatEntry(steamIDLobby, iChatID, pSteamIDUser, pvData, cubData, peChatEntryType);
		}
		public static bool RequestLobbyData(CSteamID steamIDLobby)
		{
			return _iface.RequestLobbyData(steamIDLobby);
		}
		public static void SetLobbyGameServer(CSteamID steamIDLobby, uint32 unGameServerIP, uint16 unGameServerPort, CSteamID steamIDGameServer)
		{
			_iface.SetLobbyGameServer(steamIDLobby, unGameServerIP, unGameServerPort, steamIDGameServer);
		}
		public static bool GetLobbyGameServer(CSteamID steamIDLobby, out uint32 punGameServerIP, out uint16 punGameServerPort, CSteamID* psteamIDGameServer)
		{
			punGameServerIP = ?;
			punGameServerPort = ?;
			return _iface.GetLobbyGameServer(steamIDLobby, &punGameServerIP, &punGameServerPort, psteamIDGameServer);
		}
		public static bool SetLobbyMemberLimit(CSteamID steamIDLobby, int32 cMaxMembers)
		{
			return _iface.SetLobbyMemberLimit(steamIDLobby, cMaxMembers);
		}
		public static int32 GetLobbyMemberLimit(CSteamID steamIDLobby)
		{
			return _iface.GetLobbyMemberLimit(steamIDLobby);
		}
		public static bool SetLobbyType(CSteamID steamIDLobby, ELobbyType eLobbyType)
		{
			return _iface.SetLobbyType(steamIDLobby, eLobbyType);
		}
		public static bool SetLobbyJoinable(CSteamID steamIDLobby, bool bLobbyJoinable)
		{
			return _iface.SetLobbyJoinable(steamIDLobby, bLobbyJoinable);
		}
		public static CSteamID GetLobbyOwner(CSteamID steamIDLobby)
		{
			return _iface.GetLobbyOwner(steamIDLobby);
		}
		public static bool SetLobbyOwner(CSteamID steamIDLobby, CSteamID steamIDNewOwner)
		{
			return _iface.SetLobbyOwner(steamIDLobby, steamIDNewOwner);
		}
		public static bool SetLinkedLobby(CSteamID steamIDLobby, CSteamID steamIDLobbyDependent)
		{
			return _iface.SetLinkedLobby(steamIDLobby, steamIDLobbyDependent);
		}
	}
}