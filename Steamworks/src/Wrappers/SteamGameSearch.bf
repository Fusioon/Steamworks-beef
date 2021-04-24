using System;
using Steamworks;

using internal Steam;

namespace Steam
{
	public static class SteamGameSearch
	{
		static ISteamGameSearch _gamesearch;
		static internal bool Init()
		{
			return (_gamesearch = Accessors.SteamGameSearch()) != 0;
		}

		public static EGameSearchErrorCode_t AddGameSearchParams(StringView pchKeyToFind, StringView pchValuesToFind)
		{
			return _gamesearch.AddGameSearchParams(TerminateString!(pchKeyToFind), TerminateString!(pchValuesToFind));
		}

		public static EGameSearchErrorCode_t SearchForGameWithLobby(CSteamID steamIDLobby,int32 nPlayerMin,int32 nPlayerMax)
		{
			return _gamesearch.SearchForGameWithLobby(steamIDLobby, nPlayerMin, nPlayerMax);
		}

		public static EGameSearchErrorCode_t SearchForGameSolo(int32 nPlayerMin,int32 nPlayerMax)
		{
			return _gamesearch.SearchForGameSolo(nPlayerMin, nPlayerMax);
		}

		public static EGameSearchErrorCode_t AcceptGame()
		{
			return _gamesearch.AcceptGame();
		}

		public static EGameSearchErrorCode_t DeclineGame()
		{
			return _gamesearch.DeclineGame();
		}

		public static EGameSearchErrorCode_t RetrieveConnectionDetails(CSteamID steamIDHost, Span<char8> pchConnectionDetails)
		{
			return _gamesearch.RetrieveConnectionDetails(steamIDHost, pchConnectionDetails.Ptr, (.)pchConnectionDetails.Length);
		}

		public static EGameSearchErrorCode_t EndGameSearch()
		{
			return _gamesearch.EndGameSearch();
		}

		public static EGameSearchErrorCode_t SetGameHostParams(StringView pchKey, StringView pchValue)
		{
			return _gamesearch.SetGameHostParams(TerminateString!(pchKey), TerminateString!(pchValue));
		}

		public static EGameSearchErrorCode_t SetConnectionDetails(StringView pchConnectionDetails, int32 cubConnectionDetails)
		{
			return _gamesearch.SetConnectionDetails(TerminateString!(pchConnectionDetails), cubConnectionDetails);
		}

		public static EGameSearchErrorCode_t RequestPlayersForGame(int32 nPlayerMin,int32 nPlayerMax,int32 nMaxTeamSize)
		{
			return _gamesearch.RequestPlayersForGame(nPlayerMin, nPlayerMax, nMaxTeamSize);
		}

		public static EGameSearchErrorCode_t HostConfirmGameStart(uint64 ullUniqueGameID)
		{
			return _gamesearch.HostConfirmGameStart(ullUniqueGameID);
		}

		public static EGameSearchErrorCode_t CancelRequestPlayersForGame()
		{
			return _gamesearch.CancelRequestPlayersForGame();
		}

		public static EGameSearchErrorCode_t SubmitPlayerResult(uint64 ullUniqueGameID,CSteamID steamIDPlayer,EPlayerResult_t EPlayerResult)
		{
			return _gamesearch.SubmitPlayerResult(ullUniqueGameID, steamIDPlayer, EPlayerResult);
		}

		public static EGameSearchErrorCode_t EndGame(uint64 ullUniqueGameID)
		{
			return _gamesearch.EndGame(ullUniqueGameID);
		}
	}
}
