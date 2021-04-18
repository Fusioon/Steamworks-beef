using System;

namespace Steamworks
{
	[CRepr]
	public struct SteamIPAddress_t
	{
		public uint8[16] rgubIPv6;
		public ESteamIPType eType;
		[LinkName("SteamAPI_SteamIPAddress_t_IsSet")] 
		public extern bool IsSet();
	}
	[CRepr]
	public struct FriendGameInfo_t
	{
		public CGameID gameID;
		public uint32 unGameIP;
		public uint16 usGamePort;
		public uint16 usQueryPort;
		public CSteamID steamIDLobby;
	}
	[CRepr]
	public struct MatchMakingKeyValuePair_t
	{
		public char8[256] szKey;
		public char8[256] szValue;
		[LinkName("SteamAPI_MatchMakingKeyValuePair_t_Construct")] 
		public extern void Construct();
	}
	[CRepr]
	public struct servernetadr_t
	{
		private uint16 m_usConnectionPort;
		private uint16 m_usQueryPort;
		private uint32 m_unIP;
		[LinkName("SteamAPI_servernetadr_t_Construct")] 
		public extern void Construct();
		[LinkName("SteamAPI_servernetadr_t_Init")] 
		public extern void Init(uint32 ip,uint16 usQueryPort,uint16 usConnectionPort);
		[LinkName("SteamAPI_servernetadr_t_GetQueryPort")] 
		public extern uint16 GetQueryPort();
		[LinkName("SteamAPI_servernetadr_t_SetQueryPort")] 
		public extern void SetQueryPort(uint16 usPort);
		[LinkName("SteamAPI_servernetadr_t_GetConnectionPort")] 
		public extern uint16 GetConnectionPort();
		[LinkName("SteamAPI_servernetadr_t_SetConnectionPort")] 
		public extern void SetConnectionPort(uint16 usPort);
		[LinkName("SteamAPI_servernetadr_t_GetIP")] 
		public extern uint32 GetIP();
		[LinkName("SteamAPI_servernetadr_t_SetIP")] 
		public extern void SetIP(uint32 unIP);
		[LinkName("SteamAPI_servernetadr_t_GetConnectionAddressString")] 
		public extern char8* GetConnectionAddressString();
		[LinkName("SteamAPI_servernetadr_t_GetQueryAddressString")] 
		public extern char8* GetQueryAddressString();
	}
	[CRepr]
	public struct gameserveritem_t
	{
		public servernetadr_t NetAdr;
		public int32 nPing;
		public bool bHadSuccessfulResponse;
		public bool bDoNotRefresh;
		public char8[32] szGameDir;
		public char8[32] szMap;
		public char8[64] szGameDescription;
		public uint32 nAppID;
		public int32 nPlayers;
		public int32 nMaxPlayers;
		public int32 nBotPlayers;
		public bool bPassword;
		public bool bSecure;
		public uint32 ulTimeLastPlayed;
		public int32 nServerVersion;
		private char8[64] m_szServerName;
		public char8[128] szGameTags;
		public CSteamID steamID;
		[LinkName("SteamAPI_gameserveritem_t_Construct")] 
		public extern void Construct();
		[LinkName("SteamAPI_gameserveritem_t_GetName")] 
		public extern char8* GetName();
		[LinkName("SteamAPI_gameserveritem_t_SetName")] 
		public extern void SetName(char8* pName);
	}
	[CRepr]
	public struct SteamPartyBeaconLocation_t
	{
		public ESteamPartyBeaconLocationType eType;
		public uint64 ulLocationID;
	}
	[CRepr]
	public struct SteamParamStringArray_t
	{
		public char8** ppStrings;
		public int32 nNumStrings;
	}
	[CRepr]
	public struct LeaderboardEntry_t
	{
		public CSteamID steamIDUser;
		public int32 nGlobalRank;
		public int32 nScore;
		public int32 cDetails;
		public UGCHandle_t hUGC;
	}
	[CRepr]
	public struct P2PSessionState_t
	{
		public uint8 bConnectionActive;
		public uint8 bConnecting;
		public uint8 eP2PSessionError;
		public uint8 bUsingRelay;
		public int32 nBytesQueuedForSend;
		public int32 nPacketsQueuedForSend;
		public uint32 nRemoteIP;
		public uint16 nRemotePort;
	}
	[CRepr]
	public struct InputAnalogActionData_t
	{
		public EInputSourceMode eMode;
		public float x;
		public float y;
		public bool bActive;
	}
	[CRepr]
	public struct InputDigitalActionData_t
	{
		public bool bState;
		public bool bActive;
	}
	[CRepr]
	public struct InputMotionData_t
	{
		public float rotQuatX;
		public float rotQuatY;
		public float rotQuatZ;
		public float rotQuatW;
		public float posAccelX;
		public float posAccelY;
		public float posAccelZ;
		public float rotVelX;
		public float rotVelY;
		public float rotVelZ;
	}
	[CRepr]
	public struct SteamUGCDetails_t
	{
		public PublishedFileId_t nPublishedFileId;
		public EResult eResult;
		public EWorkshopFileType eFileType;
		public AppId_t nCreatorAppID;
		public AppId_t nConsumerAppID;
		public char8[129] rgchTitle;
		public char8[8000] rgchDescription;
		public uint64 ulSteamIDOwner;
		public uint32 rtimeCreated;
		public uint32 rtimeUpdated;
		public uint32 rtimeAddedToUserList;
		public ERemoteStoragePublishedFileVisibility eVisibility;
		public bool bBanned;
		public bool bAcceptedForUse;
		public bool bTagsTruncated;
		public char8[1025] rgchTags;
		public UGCHandle_t hFile;
		public UGCHandle_t hPreviewFile;
		public char8[260] pchFileName;
		public int32 nFileSize;
		public int32 nPreviewFileSize;
		public char8[256] rgchURL;
		public uint32 unVotesUp;
		public uint32 unVotesDown;
		public float flScore;
		public uint32 unNumChildren;
	}
	[CRepr]
	public struct SteamItemDetails_t
	{
		public SteamItemInstanceID_t itemId;
		public SteamItemDef_t iDefinition;
		public uint16 unQuantity;
		public uint16 unFlags;
	}
	[CRepr]
	public struct SteamNetworkingIPAddr
	{
		public uint8[16] ipv6;
		public uint16 port;
		[LinkName("SteamAPI_SteamNetworkingIPAddr_Clear")] 
		public extern void Clear();
		[LinkName("SteamAPI_SteamNetworkingIPAddr_IsIPv6AllZeros")] 
		public extern bool IsIPv6AllZeros();
		[LinkName("SteamAPI_SteamNetworkingIPAddr_SetIPv6")] 
		public extern void SetIPv6(uint8* ipv6,uint16 nPort);
		[LinkName("SteamAPI_SteamNetworkingIPAddr_SetIPv4")] 
		public extern void SetIPv4(uint32 nIP,uint16 nPort);
		[LinkName("SteamAPI_SteamNetworkingIPAddr_IsIPv4")] 
		public extern bool IsIPv4();
		[LinkName("SteamAPI_SteamNetworkingIPAddr_GetIPv4")] 
		public extern uint32 GetIPv4();
		[LinkName("SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost")] 
		public extern void SetIPv6LocalHost(uint16 nPort);
		[LinkName("SteamAPI_SteamNetworkingIPAddr_IsLocalHost")] 
		public extern bool IsLocalHost();
		[LinkName("SteamAPI_SteamNetworkingIPAddr_ToString")] 
		public extern void ToString(char8* buf,uint32 cbBuf,bool bWithPort);
		[LinkName("SteamAPI_SteamNetworkingIPAddr_ParseString")] 
		public extern bool ParseString(char8* pszStr);
	}
	[CRepr]
	public struct SteamNetworkingIdentity
	{
		public ESteamNetworkingIdentityType eType;
		public int32 cbSize;
		public char8[128] szUnknownRawString;
		[LinkName("SteamAPI_SteamNetworkingIdentity_Clear")] 
		public extern void Clear();
		[LinkName("SteamAPI_SteamNetworkingIdentity_IsInvalid")] 
		public extern bool IsInvalid();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetSteamID")] 
		public extern void SetSteamID(CSteamID steamID);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetSteamID")] 
		public extern CSteamID GetSteamID();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetSteamID64")] 
		public extern void SetSteamID64(uint64 steamID);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetSteamID64")] 
		public extern uint64 GetSteamID64();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetXboxPairwiseID")] 
		public extern bool SetXboxPairwiseID(char8* pszString);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID")] 
		public extern char8* GetXboxPairwiseID();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetPSNID")] 
		public extern void SetPSNID(uint64 id);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetPSNID")] 
		public extern uint64 GetPSNID();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetStadiaID")] 
		public extern void SetStadiaID(uint64 id);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetStadiaID")] 
		public extern uint64 GetStadiaID();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetIPAddr")] 
		public extern void SetIPAddr(in SteamNetworkingIPAddr addr);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetIPAddr")] 
		public extern SteamNetworkingIPAddr* GetIPAddr();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetLocalHost")] 
		public extern void SetLocalHost();
		[LinkName("SteamAPI_SteamNetworkingIdentity_IsLocalHost")] 
		public extern bool IsLocalHost();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetGenericString")] 
		public extern bool SetGenericString(char8* pszString);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetGenericString")] 
		public extern char8* GetGenericString();
		[LinkName("SteamAPI_SteamNetworkingIdentity_SetGenericBytes")] 
		public extern bool SetGenericBytes(void* data,uint32 cbLen);
		[LinkName("SteamAPI_SteamNetworkingIdentity_GetGenericBytes")] 
		public extern uint8* GetGenericBytes(ref int32 cbLen);
		[LinkName("SteamAPI_SteamNetworkingIdentity_ToString")] 
		public extern void ToString(char8* buf,uint32 cbBuf);
		[LinkName("SteamAPI_SteamNetworkingIdentity_ParseString")] 
		public extern bool ParseString(char8* pszStr);
	}
	[CRepr]
	public struct SteamNetConnectionInfo_t
	{
		public SteamNetworkingIdentity identityRemote;
		public int64 nUserData;
		public HSteamListenSocket hListenSocket;
		public SteamNetworkingIPAddr addrRemote;
		public uint16 _pad1;
		public SteamNetworkingPOPID idPOPRemote;
		public SteamNetworkingPOPID idPOPRelay;
		public ESteamNetworkingConnectionState eState;
		public int32 eEndReason;
		public char8[128] szEndDebug;
		public char8[128] szConnectionDescription;
		public ESteamNetTransportKind eTransportKind;
		public uint32[63] reserved;
	}
	[CRepr]
	public struct SteamNetworkingQuickConnectionStatus
	{
		public ESteamNetworkingConnectionState eState;
		public int32 nPing;
		public float flConnectionQualityLocal;
		public float flConnectionQualityRemote;
		public float flOutPacketsPerSec;
		public float flOutBytesPerSec;
		public float flInPacketsPerSec;
		public float flInBytesPerSec;
		public int32 nSendRateBytesPerSecond;
		public int32 cbPendingUnreliable;
		public int32 cbPendingReliable;
		public int32 cbSentUnackedReliable;
		public SteamNetworkingMicroseconds usecQueueTime;
		public uint32[16] reserved;
	}
	[CRepr]
	public struct SteamNetworkingMessage_t
	{
		public void* pData;
		public int32 cbSize;
		public HSteamNetConnection conn;
		public SteamNetworkingIdentity identityPeer;
		public int64 nConnUserData;
		public SteamNetworkingMicroseconds usecTimeReceived;
		public int64 nMessageNumber;
		public function void (SteamNetworkingMessage_t* arg1) m_pfnFreeData;
		public function void (SteamNetworkingMessage_t* arg1) m_pfnRelease;
		public int32 nChannel;
		public int32 nFlags;
		public int64 nUserData;
		[LinkName("SteamAPI_SteamNetworkingMessage_t_Release")] 
		public extern void Release();
	}
	[CRepr]
	public struct SteamNetworkPingLocation_t
	{
		public uint8[512] data;
	}
	[CRepr]
	public struct SteamNetworkingConfigValue_t
	{
		public ESteamNetworkingConfigValue eValue;
		public ESteamNetworkingConfigDataType eDataType;
		public int64 int64;
		[LinkName("SteamAPI_SteamNetworkingConfigValue_t_SetInt32")] 
		public extern void SetInt32(ESteamNetworkingConfigValue eVal,int32 data);
		[LinkName("SteamAPI_SteamNetworkingConfigValue_t_SetInt64")] 
		public extern void SetInt64(ESteamNetworkingConfigValue eVal,int64 data);
		[LinkName("SteamAPI_SteamNetworkingConfigValue_t_SetFloat")] 
		public extern void SetFloat(ESteamNetworkingConfigValue eVal,float data);
		[LinkName("SteamAPI_SteamNetworkingConfigValue_t_SetPtr")] 
		public extern void SetPtr(ESteamNetworkingConfigValue eVal,void* data);
		[LinkName("SteamAPI_SteamNetworkingConfigValue_t_SetString")] 
		public extern void SetString(ESteamNetworkingConfigValue eVal,char8* data);
	}
	[CRepr]
	public struct SteamNetworkingPOPIDRender
	{
		private char8[8] buf;
		[LinkName("SteamAPI_SteamNetworkingPOPIDRender_c_str")] 
		public extern char8* c_str();
	}
	[CRepr]
	public struct SteamNetworkingIdentityRender
	{
		private char8[128] buf;
		[LinkName("SteamAPI_SteamNetworkingIdentityRender_c_str")] 
		public extern char8* c_str();
	}
	[CRepr]
	public struct SteamNetworkingIPAddrRender
	{
		private char8[48] buf;
		[LinkName("SteamAPI_SteamNetworkingIPAddrRender_c_str")] 
		public extern char8* c_str();
	}
	[CRepr]
	public struct SteamDatagramHostedAddress
	{
		public int32 cbSize;
		public char8[128] data;
		[LinkName("SteamAPI_SteamDatagramHostedAddress_Clear")] 
		public extern void Clear();
		[LinkName("SteamAPI_SteamDatagramHostedAddress_GetPopID")] 
		public extern SteamNetworkingPOPID GetPopID();
		[LinkName("SteamAPI_SteamDatagramHostedAddress_SetDevAddress")] 
		public extern void SetDevAddress(uint32 nIP,uint16 nPort,SteamNetworkingPOPID popid);
	}
	[CRepr]
	public struct SteamDatagramGameCoordinatorServerLogin
	{
		public SteamNetworkingIdentity identity;
		public SteamDatagramHostedAddress routing;
		public AppId_t nAppID;
		public RTime32 rtime;
		public int32 cbAppData;
		public char8[2048] appData;
	}

}