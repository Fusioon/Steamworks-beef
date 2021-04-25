using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamRemoteStorage
	{
		static ISteamRemoteStorage _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamRemoteStorage()) != 0;
		public static bool FileWrite(StringView pchFile, void* pvData, int32 cubData)
		{
			return _iface.FileWrite(TerminateString!(pchFile), pvData, cubData);
		}
		public static int32 FileRead(StringView pchFile, void* pvData, int32 cubDataToRead)
		{
			return _iface.FileRead(TerminateString!(pchFile), pvData, cubDataToRead);
		}
		[NoDiscard]
		public static SteamAPICall_t FileWriteAsync(StringView pchFile, void* pvData, uint32 cubData)
		{
			return _iface.FileWriteAsync(TerminateString!(pchFile), pvData, cubData);
		}
		[NoDiscard]
		public static SteamAPICall_t FileReadAsync(StringView pchFile, uint32 nOffset, uint32 cubToRead)
		{
			return _iface.FileReadAsync(TerminateString!(pchFile), nOffset, cubToRead);
		}
		public static bool FileReadAsyncComplete(SteamAPICall_t hReadCall, void* pvBuffer, uint32 cubToRead)
		{
			return _iface.FileReadAsyncComplete(hReadCall, pvBuffer, cubToRead);
		}
		public static bool FileForget(StringView pchFile)
		{
			return _iface.FileForget(TerminateString!(pchFile));
		}
		public static bool FileDelete(StringView pchFile)
		{
			return _iface.FileDelete(TerminateString!(pchFile));
		}
		[NoDiscard]
		public static SteamAPICall_t FileShare(StringView pchFile)
		{
			return _iface.FileShare(TerminateString!(pchFile));
		}
		public static bool SetSyncPlatforms(StringView pchFile, ERemoteStoragePlatform eRemoteStoragePlatform)
		{
			return _iface.SetSyncPlatforms(TerminateString!(pchFile), eRemoteStoragePlatform);
		}
		public static UGCFileWriteStreamHandle_t FileWriteStreamOpen(StringView pchFile)
		{
			return _iface.FileWriteStreamOpen(TerminateString!(pchFile));
		}
		public static bool FileWriteStreamWriteChunk(UGCFileWriteStreamHandle_t writeHandle, void* pvData, int32 cubData)
		{
			return _iface.FileWriteStreamWriteChunk(writeHandle, pvData, cubData);
		}
		public static bool FileWriteStreamClose(UGCFileWriteStreamHandle_t writeHandle)
		{
			return _iface.FileWriteStreamClose(writeHandle);
		}
		public static bool FileWriteStreamCancel(UGCFileWriteStreamHandle_t writeHandle)
		{
			return _iface.FileWriteStreamCancel(writeHandle);
		}
		public static bool FileExists(StringView pchFile)
		{
			return _iface.FileExists(TerminateString!(pchFile));
		}
		public static bool FilePersisted(StringView pchFile)
		{
			return _iface.FilePersisted(TerminateString!(pchFile));
		}
		public static int32 GetFileSize(StringView pchFile)
		{
			return _iface.GetFileSize(TerminateString!(pchFile));
		}
		public static int64 GetFileTimestamp(StringView pchFile)
		{
			return _iface.GetFileTimestamp(TerminateString!(pchFile));
		}
		public static ERemoteStoragePlatform GetSyncPlatforms(StringView pchFile)
		{
			return _iface.GetSyncPlatforms(TerminateString!(pchFile));
		}
		public static int32 GetFileCount()
		{
			return _iface.GetFileCount();
		}
		public static StringView GetFileNameAndSize(int32 iFile, out int32 pnFileSizeInBytes)
		{
			pnFileSizeInBytes = ?;
			return StringView(_iface.GetFileNameAndSize(iFile, &pnFileSizeInBytes));
		}
		public static bool GetQuota(out uint64 pnTotalBytes, out uint64 puAvailableBytes)
		{
			pnTotalBytes = ?;
			puAvailableBytes = ?;
			return _iface.GetQuota(&pnTotalBytes, &puAvailableBytes);
		}
		public static bool IsCloudEnabledForAccount()
		{
			return _iface.IsCloudEnabledForAccount();
		}
		public static bool IsCloudEnabledForApp()
		{
			return _iface.IsCloudEnabledForApp();
		}
		public static void SetCloudEnabledForApp(bool bEnabled)
		{
			_iface.SetCloudEnabledForApp(bEnabled);
		}
		[NoDiscard]
		public static SteamAPICall_t UGCDownload(UGCHandle_t hContent, uint32 unPriority)
		{
			return _iface.UGCDownload(hContent, unPriority);
		}
		public static bool GetUGCDownloadProgress(UGCHandle_t hContent, out int32 pnBytesDownloaded, out int32 pnBytesExpected)
		{
			pnBytesDownloaded = ?;
			pnBytesExpected = ?;
			return _iface.GetUGCDownloadProgress(hContent, &pnBytesDownloaded, &pnBytesExpected);
		}
		public static bool GetUGCDetails(UGCHandle_t hContent, AppId_t* pnAppID, char8** ppchName, out int32 pnFileSizeInBytes, CSteamID* pSteamIDOwner)
		{
			pnFileSizeInBytes = ?;
			return _iface.GetUGCDetails(hContent, pnAppID, ppchName, &pnFileSizeInBytes, pSteamIDOwner);
		}
		public static int32 UGCRead(UGCHandle_t hContent, void* pvData, int32 cubDataToRead, uint32 cOffset, EUGCReadAction eAction)
		{
			return _iface.UGCRead(hContent, pvData, cubDataToRead, cOffset, eAction);
		}
		public static int32 GetCachedUGCCount()
		{
			return _iface.GetCachedUGCCount();
		}
		public static UGCHandle_t GetCachedUGCHandle(int32 iCachedContent)
		{
			return _iface.GetCachedUGCHandle(iCachedContent);
		}
		[NoDiscard]
		public static SteamAPICall_t PublishWorkshopFile(StringView pchFile, StringView pchPreviewFile, AppId_t nConsumerAppId, StringView pchTitle, StringView pchDescription, ERemoteStoragePublishedFileVisibility eVisibility, SteamParamStringArray_t* pTags, EWorkshopFileType eWorkshopFileType)
		{
			return _iface.PublishWorkshopFile(TerminateString!(pchFile), TerminateString!(pchPreviewFile), nConsumerAppId, TerminateString!(pchTitle), TerminateString!(pchDescription), eVisibility, pTags, eWorkshopFileType);
		}
		public static PublishedFileUpdateHandle_t CreatePublishedFileUpdateRequest(PublishedFileId_t unPublishedFileId)
		{
			return _iface.CreatePublishedFileUpdateRequest(unPublishedFileId);
		}
		public static bool UpdatePublishedFileFile(PublishedFileUpdateHandle_t updateHandle, StringView pchFile)
		{
			return _iface.UpdatePublishedFileFile(updateHandle, TerminateString!(pchFile));
		}
		public static bool UpdatePublishedFilePreviewFile(PublishedFileUpdateHandle_t updateHandle, StringView pchPreviewFile)
		{
			return _iface.UpdatePublishedFilePreviewFile(updateHandle, TerminateString!(pchPreviewFile));
		}
		public static bool UpdatePublishedFileTitle(PublishedFileUpdateHandle_t updateHandle, StringView pchTitle)
		{
			return _iface.UpdatePublishedFileTitle(updateHandle, TerminateString!(pchTitle));
		}
		public static bool UpdatePublishedFileDescription(PublishedFileUpdateHandle_t updateHandle, StringView pchDescription)
		{
			return _iface.UpdatePublishedFileDescription(updateHandle, TerminateString!(pchDescription));
		}
		public static bool UpdatePublishedFileVisibility(PublishedFileUpdateHandle_t updateHandle, ERemoteStoragePublishedFileVisibility eVisibility)
		{
			return _iface.UpdatePublishedFileVisibility(updateHandle, eVisibility);
		}
		public static bool UpdatePublishedFileTags(PublishedFileUpdateHandle_t updateHandle, SteamParamStringArray_t* pTags)
		{
			return _iface.UpdatePublishedFileTags(updateHandle, pTags);
		}
		[NoDiscard]
		public static SteamAPICall_t CommitPublishedFileUpdate(PublishedFileUpdateHandle_t updateHandle)
		{
			return _iface.CommitPublishedFileUpdate(updateHandle);
		}
		[NoDiscard]
		public static SteamAPICall_t GetPublishedFileDetails(PublishedFileId_t unPublishedFileId, uint32 unMaxSecondsOld)
		{
			return _iface.GetPublishedFileDetails(unPublishedFileId, unMaxSecondsOld);
		}
		[NoDiscard]
		public static SteamAPICall_t DeletePublishedFile(PublishedFileId_t unPublishedFileId)
		{
			return _iface.DeletePublishedFile(unPublishedFileId);
		}
		[NoDiscard]
		public static SteamAPICall_t EnumerateUserPublishedFiles(uint32 unStartIndex)
		{
			return _iface.EnumerateUserPublishedFiles(unStartIndex);
		}
		[NoDiscard]
		public static SteamAPICall_t SubscribePublishedFile(PublishedFileId_t unPublishedFileId)
		{
			return _iface.SubscribePublishedFile(unPublishedFileId);
		}
		[NoDiscard]
		public static SteamAPICall_t EnumerateUserSubscribedFiles(uint32 unStartIndex)
		{
			return _iface.EnumerateUserSubscribedFiles(unStartIndex);
		}
		[NoDiscard]
		public static SteamAPICall_t UnsubscribePublishedFile(PublishedFileId_t unPublishedFileId)
		{
			return _iface.UnsubscribePublishedFile(unPublishedFileId);
		}
		public static bool UpdatePublishedFileSetChangeDescription(PublishedFileUpdateHandle_t updateHandle, StringView pchChangeDescription)
		{
			return _iface.UpdatePublishedFileSetChangeDescription(updateHandle, TerminateString!(pchChangeDescription));
		}
		[NoDiscard]
		public static SteamAPICall_t GetPublishedItemVoteDetails(PublishedFileId_t unPublishedFileId)
		{
			return _iface.GetPublishedItemVoteDetails(unPublishedFileId);
		}
		[NoDiscard]
		public static SteamAPICall_t UpdateUserPublishedItemVote(PublishedFileId_t unPublishedFileId, bool bVoteUp)
		{
			return _iface.UpdateUserPublishedItemVote(unPublishedFileId, bVoteUp);
		}
		[NoDiscard]
		public static SteamAPICall_t GetUserPublishedItemVoteDetails(PublishedFileId_t unPublishedFileId)
		{
			return _iface.GetUserPublishedItemVoteDetails(unPublishedFileId);
		}
		[NoDiscard]
		public static SteamAPICall_t EnumerateUserSharedWorkshopFiles(CSteamID steamId, uint32 unStartIndex, SteamParamStringArray_t* pRequiredTags, SteamParamStringArray_t* pExcludedTags)
		{
			return _iface.EnumerateUserSharedWorkshopFiles(steamId, unStartIndex, pRequiredTags, pExcludedTags);
		}
		[NoDiscard]
		public static SteamAPICall_t PublishVideo(EWorkshopVideoProvider eVideoProvider, StringView pchVideoAccount, StringView pchVideoIdentifier, StringView pchPreviewFile, AppId_t nConsumerAppId, StringView pchTitle, StringView pchDescription, ERemoteStoragePublishedFileVisibility eVisibility, SteamParamStringArray_t* pTags)
		{
			return _iface.PublishVideo(eVideoProvider, TerminateString!(pchVideoAccount), TerminateString!(pchVideoIdentifier), TerminateString!(pchPreviewFile), nConsumerAppId, TerminateString!(pchTitle), TerminateString!(pchDescription), eVisibility, pTags);
		}
		[NoDiscard]
		public static SteamAPICall_t SetUserPublishedFileAction(PublishedFileId_t unPublishedFileId, EWorkshopFileAction eAction)
		{
			return _iface.SetUserPublishedFileAction(unPublishedFileId, eAction);
		}
		[NoDiscard]
		public static SteamAPICall_t EnumeratePublishedFilesByUserAction(EWorkshopFileAction eAction, uint32 unStartIndex)
		{
			return _iface.EnumeratePublishedFilesByUserAction(eAction, unStartIndex);
		}
		[NoDiscard]
		public static SteamAPICall_t EnumeratePublishedWorkshopFiles(EWorkshopEnumerationType eEnumerationType, uint32 unStartIndex, uint32 unCount, uint32 unDays, SteamParamStringArray_t* pTags, SteamParamStringArray_t* pUserTags)
		{
			return _iface.EnumeratePublishedWorkshopFiles(eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags);
		}
		[NoDiscard]
		public static SteamAPICall_t UGCDownloadToLocation(UGCHandle_t hContent, StringView pchLocation, uint32 unPriority)
		{
			return _iface.UGCDownloadToLocation(hContent, TerminateString!(pchLocation), unPriority);
		}
	}
}