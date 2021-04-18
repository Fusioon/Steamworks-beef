using System;

namespace Steamworks
{
	struct CGameID : uint64
	{
		public enum EGameIDType : uint8
		{
			App			= 0,
			GameMod		= 1,
			Shortcut	= 2,
			P2P			= 3,
		};

#if BF_LITTLE_ENDIAN
		const uint64 APPID_MASK_64 = 0x00FFFFFF00000000;
		const uint64 TYPE_MASK_64 =  0xFF00000000000000;
		const uint64 MODID_MASK_64 = 0x00000000FFFFFFFF;

		const uint32 APPID_SHIFT = 32;
		const uint32 TYPE_SHIFT = 56;
		const uint32 MODID_SHIFT = 0;
#else
		#error "CGameID for big endian is not implemented"
#endif
		

		public AppId_t AppID
		{
			get => (AppId_t)((this & APPID_MASK_64) >> APPID_SHIFT);
			private set mut
			{
				this = (this & ~APPID_MASK_64) | (((uint64)value << APPID_SHIFT) & APPID_MASK_64);
			}
		}
		public EGameIDType Type
		{
			get => (EGameIDType)((this & TYPE_MASK_64) >> TYPE_SHIFT);
			private set mut
			{
				this = (this & ~TYPE_MASK_64) | (((uint64)value << TYPE_SHIFT) & TYPE_MASK_64);
			}
		}

		public uint32 ModID
		{
			get => (uint32)((this & MODID_MASK_64) >> MODID_SHIFT);
			private set mut
			{
				this = (this & ~MODID_MASK_64) | (((uint64)value << MODID_SHIFT) & MODID_MASK_64);
			}
		}


		public this()
		{
			Compiler.Assert(sizeof(Self) == 8);
			this = 0;
		}

		public this( uint64 ulGameID )
		{
			this = ulGameID;
		}

		public this( int32 nAppID )
		{
			this = 0;
			AppID = (.)nAppID;
		}

		public this( uint32 nAppID )
		{
			this = 0;
			AppID = (.)nAppID;
		}

		public this( uint32 nAppID, uint32 nModID )
		{
			this = ((((uint64)EGameIDType.GameMod << TYPE_SHIFT) | ((uint64)nAppID << APPID_SHIFT) & APPID_MASK_64)) | (nModID << MODID_SHIFT);
		}

		public void Reset() mut
		{
			this = 0;
		}
		public void Set( uint64 ulGameID ) mut
		{
			this = ulGameID;
		}

		public bool IsMod => ( Type == .GameMod );

		public bool IsShortcut => ( Type == .Shortcut );

		public bool IsP2PFile => ( Type == .P2P );

		public bool IsSteamApp => ( Type == .App );

		public bool IsValid
		{
			get
			{
				switch(Type)
				{
				case .App:
					return AppID != k_uAppIdInvalid;
				case .GameMod:
					return AppID != k_uAppIdInvalid && ModID & 0x80000000 != 0;
				case .Shortcut:
					return (ModID & 0x80000000) != 0;
				case .P2P:
					return AppID != k_uAppIdInvalid && ModID & 0x80000000 != 0;
				}	
			}
		}
	}
}
