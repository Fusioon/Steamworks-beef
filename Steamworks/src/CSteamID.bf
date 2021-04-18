using System;

namespace Steamworks
{
	struct CSteamID : uint64
	{
#if BF_LITTLE_ENDIAN
		const uint64 ID_MASK_64 = 0x00000000FFFFFFFF;
		const uint64 INSTANCE_MASK_64 = 0x000FFFFF00000000;
		const uint64 TYPE_MASK_64 = 0x00F0000000000000;
		const uint64 UNIVERSE_MASK_64 = 0xFF00000000000000;

		const uint32 ID_SHIFT = 0;
		const uint32 INSTANCE_SHIFT = 32;
		const uint32 TYPE_SHIFT = 52;
		const uint32 UNIVERSE_SHIFT = 56;
#else
		const uint64 ID_MASK_64 = 0xFFFFFFFF00000000;
		const uint64 INSTANCE_MASK_64 = 0x00000000000FFFFF;
		const uint64 TYPE_MASK_64 = 0x0000000000F00000;
		const uint64 UNIVERSE_MASK_64 = 0x00000000FF000000;

		const uint32 ID_SHIFT = 32;
		const uint32 INSTANCE_SHIFT = 24;
		const uint32 TYPE_SHIFT = 20;
		const uint32 UNIVERSE_SHIFT = 0;
#endif

		public uint32 AccountID
		{
			get => (uint32)(this & ID_MASK_64) >> ID_SHIFT;
			set mut
			{
				this = (this & ~(ID_MASK_64)) | (((uint64)value << ID_SHIFT) & ID_MASK_64);
			}
		}

		public uint32 AccountInstance
		{
			get => uint32((this & INSTANCE_MASK_64) >> INSTANCE_SHIFT);
			set mut
			{
				this = (this & ~(INSTANCE_MASK_64)) | (((uint64)value << INSTANCE_SHIFT) & INSTANCE_MASK_64);
			}
		}

		public EAccountType AccountType
		{
			get => (EAccountType)((this & TYPE_MASK_64) >> TYPE_SHIFT);
			set mut
			{
				this = (this & ~(TYPE_MASK_64)) | (((uint64)value << TYPE_SHIFT) & TYPE_MASK_64);
			}
		}

		public EUniverse Universe
		{
			get => (EUniverse)((this & UNIVERSE_MASK_64) >> UNIVERSE_SHIFT);
			set mut
			{
				this = (this & ~(UNIVERSE_MASK_64)) | (((uint64)value << UNIVERSE_SHIFT) & UNIVERSE_MASK_64);
			}
		}

		public this()
		{
			Compiler.Assert(sizeof(Self) == 8);
			this = 0;
		}

		public this(uint32 accountID, EUniverse universe, EAccountType accountType)
		{
			this = ((accountID << ID_SHIFT)& ID_MASK_64) |
				 (((uint64)universe << UNIVERSE_SHIFT) & UNIVERSE_MASK_64) |
				 (((uint64)accountType << TYPE_SHIFT) & TYPE_MASK_64);

			if(accountType == .Clan || accountType == .GameServer)
				AccountInstance = 0;
			else
				AccountInstance = k_unSteamUserDefaultInstance;
		}

		public this(uint32 accountID, uint32 instance, EUniverse universe, EAccountType accountType)
		{
			this = ((accountID << ID_SHIFT)& ID_MASK_64) |
				(((uint64)universe << UNIVERSE_SHIFT) & UNIVERSE_MASK_64) |
				(((uint64)accountType << TYPE_SHIFT) & TYPE_MASK_64) |
				(((uint64)instance << INSTANCE_SHIFT) & INSTANCE_MASK_64);
		}

		//-----------------------------------------------------------------------------
		// Purpose: Is this an anonymous game server login that will be filled in?
		//-----------------------------------------------------------------------------
		public bool BlankAnonAccount => AccountID == 0 && AnonAccount && AccountInstance == 0;

		//-----------------------------------------------------------------------------
		// Purpose: Is this a game server account id?  (Either persistent or anonymous)
		//-----------------------------------------------------------------------------
		public bool GameServerAccount => AccountType == .GameServer || AccountType == .AnonGameServer;

		//-----------------------------------------------------------------------------
		// Purpose: Is this a persistent (not anonymous) game server account id?
		//-----------------------------------------------------------------------------
		public bool PersistentGameServerAccount => AccountType == .GameServer;

		//-----------------------------------------------------------------------------
		// Purpose: Is this an anonymous game server account id?
		//-----------------------------------------------------------------------------
		public bool AnonGameServerAccount => AccountType == .AnonGameServer;

		//-----------------------------------------------------------------------------
		// Purpose: Is this a content server account id?
		//-----------------------------------------------------------------------------
		public bool ContentServerAccount => AccountType == .ContentServer;

		//-----------------------------------------------------------------------------
		// Purpose: Is this a clan account id?
		//-----------------------------------------------------------------------------
		public bool ClanAccount =>  AccountType == .Clan;

		//-----------------------------------------------------------------------------
		// Purpose: Is this a chat account id?
		//-----------------------------------------------------------------------------
		public bool ChatAccount =>AccountType == .Chat;

		//-----------------------------------------------------------------------------
		// Purpose: Is this a chat account id?
		//-----------------------------------------------------------------------------
		public bool IsLobby => ( AccountType == .Chat ) && ( AccountInstance & (.)EChatSteamIDInstanceFlags.InstanceFlagLobby !=  0);

		//-----------------------------------------------------------------------------
		// Purpose: Is this an individual user account id?
		//-----------------------------------------------------------------------------
		public bool IndividualAccount => AccountType == .Individual || AccountType == .ConsoleUser;

		//-----------------------------------------------------------------------------
		// Purpose: Is this an anonymous account?
		//-----------------------------------------------------------------------------
		public bool AnonAccount => AccountType == .AnonUser || AccountType == .AnonGameServer;

		//-----------------------------------------------------------------------------
		// Purpose: Is this an anonymous user account? ( used to create an account or reset a password )
		//-----------------------------------------------------------------------------
		public bool AnonUserAccount => AccountType == .AnonUser;

		//-----------------------------------------------------------------------------
		// Purpose: Is this a faked up Steam ID for a PSN friend account?
		//-----------------------------------------------------------------------------
		public bool ConsoleUserAccount => AccountType == .ConsoleUser;

		public bool IsValid
		{
			get
			{
				if ( AccountType <= .Invalid || AccountType >= .Max )
					return false;

				if ( Universe <= .Invalid || Universe >= .Max )
					return false;

				if ( AccountType == .Individual )
				{
					if ( AccountID == 0 || AccountInstance != k_unSteamUserDefaultInstance )
						return false;
				}

				if ( AccountType == .Clan )
				{
					if ( AccountID == 0 || AccountInstance != 0 )
						return false;
				}

				if ( AccountType == .GameServer )
				{
					if ( AccountID == 0 )
						return false;
				}
				return true;
			}
		}

		//-----------------------------------------------------------------------------
		// Purpose: Converts the static parts of a steam ID to a 64-bit representation.
		//			For multiseat accounts, all instances of that account will have the
		//			same static account key, so they can be grouped together by the static
		//			account key.
		// Output : 64-bit static account key
		//-----------------------------------------------------------------------------
		public uint64 StaticAccountKey => (uint64) ( ( ( (uint64) Universe ) << 56 ) + ((uint64) AccountType << 52 ) + AccountID );

		//-----------------------------------------------------------------------------
		// Purpose: create an anonymous game server login to be filled in by the AM
		//-----------------------------------------------------------------------------
		public static Self CreateBlankAnonLogon(EUniverse universe)
		{
			return Self(0, universe, .AnonGameServer);
		}

		//-----------------------------------------------------------------------------
		// Purpose: create an anonymous game server login to be filled in by the AM
		//-----------------------------------------------------------------------------
		public static Self CreateBlankAnonUserLogon(EUniverse universe)
		{
			return Self(0, universe, .AnonUser);
		}
		
		public const Self Nil = 0;
		// Using const instead of static readonly makes compiler crash :(
		public static readonly Self OutOfDateGS = Self(0, 0, .Invalid, .Invalid);
		public static readonly Self LanModeGS = Self(0, 0, .Public, .Invalid);
		public static readonly Self NotInitYetGS = Self(1, 0, .Invalid, .Invalid);
		public static readonly Self NonSteamGS = Self(2, 0, .Invalid, .Invalid);
	}
}
