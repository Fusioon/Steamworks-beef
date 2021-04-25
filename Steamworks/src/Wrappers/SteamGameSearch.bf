using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamGameSearch
	{
		static ISteamGameSearch _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamGameSearch()) != 0;
		public static EGameSearchErrorCode_t AddGameSearchParams(StringView pchKeyToFind, StringView pchValuesToFind)
		{
			return _iface.AddGameSearchParams(TerminateString!(pchKeyToFind), TerminateString!(pchValuesToFind));
		}
		public static EGameSearchErrorCode_t SearchForGameWithLobby(CSteamID steamIDLobby, int32 nPlayerMin, int32 nPlayerMax)
		{
			return _iface.SearchForGameWithLobby(steamIDLobby, nPlayerMin, nPlayerMax);
		}
		public static EGameSearchErrorCode_t SearchForGameSolo(int32 nPlayerMin, int32 nPlayerMax)
		{
			return _iface.SearchForGameSolo(nPlayerMin, nPlayerMax);
		}
		public static EGameSearchErrorCode_t AcceptGame()
		{
			return _iface.AcceptGame();
		}
		public static EGameSearchErrorCode_t DeclineGame()
		{
			return _iface.DeclineGame();
		}
		public static EGameSearchErrorCode_t RetrieveConnectionDetails(CSteamID steamIDHost, char8* pchConnectionDetails, int32 cubConnectionDetails)
		{
			return _iface.RetrieveConnectionDetails(steamIDHost, pchConnectionDetails, cubConnectionDetails);
		}
		public static EGameSearchErrorCode_t EndGameSearch()
		{
			return _iface.EndGameSearch();
		}
		public static EGameSearchErrorCode_t SetGameHostParams(StringView pchKey, StringView pchValue)
		{
			return _iface.SetGameHostParams(TerminateString!(pchKey), TerminateString!(pchValue));
		}
		public static EGameSearchErrorCode_t SetConnectionDetails(StringView pchConnectionDetails, int32 cubConnectionDetails)
		{
			return _iface.SetConnectionDetails(TerminateString!(pchConnectionDetails), cubConnectionDetails);
		}
		public static EGameSearchErrorCode_t RequestPlayersForGame(int32 nPlayerMin, int32 nPlayerMax, int32 nMaxTeamSize)
		{
			return _iface.RequestPlayersForGame(nPlayerMin, nPlayerMax, nMaxTeamSize);
		}
		public static EGameSearchErrorCode_t HostConfirmGameStart(uint64 ullUniqueGameID)
		{
			return _iface.HostConfirmGameStart(ullUniqueGameID);
		}
		public static EGameSearchErrorCode_t CancelRequestPlayersForGame()
		{
			return _iface.CancelRequestPlayersForGame();
		}
		public static EGameSearchErrorCode_t SubmitPlayerResult(uint64 ullUniqueGameID, CSteamID steamIDPlayer, EPlayerResult_t EPlayerResult)
		{
			return _iface.SubmitPlayerResult(ullUniqueGameID, steamIDPlayer, EPlayerResult);
		}
		public static EGameSearchErrorCode_t EndGame(uint64 ullUniqueGameID)
		{
			return _iface.EndGame(ullUniqueGameID);
		}
	}
}