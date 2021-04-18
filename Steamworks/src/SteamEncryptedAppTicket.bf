using System;

namespace Steamworks
{
	public static class SteamEncryptedAppTicket
	{
		public const int k_nSteamEncryptedAppTicketSymmetricKeyLen = 32;

		[LinkName("SteamEncryptedAppTicket_BDecryptTicket")]
		public static extern bool SteamEncryptedAppTicket_BDecryptTicket(uint8* rgubTicketEncrypted, uint32 cubTicketEncrypted, uint8* rgubTicketDecrypted,
			uint32* pcubTicketDecrypted, uint8[k_nSteamEncryptedAppTicketSymmetricKeyLen] rgubKey, int32 cubKey);
		[LinkName("SteamEncryptedAppTicket_BIsTicketForApp")]
		public static extern bool SteamEncryptedAppTicket_BIsTicketForApp(uint8* rgubTicketDecrypted, uint32 cubTicketDecrypted, AppId_t nAppID);

		[LinkName("SteamEncryptedAppTicket_BUserIsVacBanned")]
		public static extern bool SteamEncryptedAppTicket_BUserIsVacBanned(uint8* rgubTicketDecrypted, uint32 cubTicketDecrypted);

		[LinkName("SteamEncryptedAppTicket_BUserOwnsAppInTicket")]
		public static extern bool SteamEncryptedAppTicket_BUserOwnsAppInTicket(uint8* rgubTicketDecrypted, uint32 cubTicketDecrypted, AppId_t nAppID);

		[LinkName("SteamEncryptedAppTicket_GetTicketAppID")]
		public static extern AppId_t SteamEncryptedAppTicket_GetTicketAppID(uint8* rgubTicketDecrypted, uint32 cubTicketDecrypted);

		[LinkName("SteamEncryptedAppTicket_GetTicketIssueTime")]
		public static extern RTime32 SteamEncryptedAppTicket_GetTicketIssueTime(uint8* rgubTicketDecrypted, uint32 cubTicketDecrypted);

		[LinkName("SteamEncryptedAppTicket_GetTicketSteamID")]
		public static extern void SteamEncryptedAppTicket_GetTicketSteamID(uint8* rgubTicketDecrypted, uint32 cubTicketDecrypted, CSteamID* psteamID);

		[LinkName("SteamEncryptedAppTicket_GetUserVariableData")]
		public static extern uint8* SteamEncryptedAppTicket_GetUserVariableData(uint8* rgubTicketDecrypted, uint32 cubTicketDecrypted, uint32* pcubUserData);
	}
}
