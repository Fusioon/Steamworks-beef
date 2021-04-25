using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamUGC
	{
		static ISteamUGC _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamUGC()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerUGC()) != 0;
		public static UGCQueryHandle_t CreateQueryUserUGCRequest(AccountID_t unAccountID, EUserUGCList eListType, EUGCMatchingUGCType eMatchingUGCType, EUserUGCListSortOrder eSortOrder, AppId_t nCreatorAppID, AppId_t nConsumerAppID, uint32 unPage)
		{
			return _iface.CreateQueryUserUGCRequest(unAccountID, eListType, eMatchingUGCType, eSortOrder, nCreatorAppID, nConsumerAppID, unPage);
		}
		public static UGCQueryHandle_t CreateQueryAllUGCRequest(EUGCQuery eQueryType, EUGCMatchingUGCType eMatchingeMatchingUGCTypeFileType, AppId_t nCreatorAppID, AppId_t nConsumerAppID, uint32 unPage)
		{
			return _iface.CreateQueryAllUGCRequest(eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, unPage);
		}
		public static UGCQueryHandle_t CreateQueryAllUGCRequest(EUGCQuery eQueryType, EUGCMatchingUGCType eMatchingeMatchingUGCTypeFileType, AppId_t nCreatorAppID, AppId_t nConsumerAppID, StringView pchCursor)
		{
			return _iface.CreateQueryAllUGCRequest(eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, TerminateString!(pchCursor));
		}
		public static UGCQueryHandle_t CreateQueryUGCDetailsRequest(PublishedFileId_t* pvecPublishedFileID, uint32 unNumPublishedFileIDs)
		{
			return _iface.CreateQueryUGCDetailsRequest(pvecPublishedFileID, unNumPublishedFileIDs);
		}
		[NoDiscard]
		public static SteamAPICall_t SendQueryUGCRequest(UGCQueryHandle_t handle)
		{
			return _iface.SendQueryUGCRequest(handle);
		}
		public static bool GetQueryUGCResult(UGCQueryHandle_t handle, uint32 index, SteamUGCDetails_t* pDetails)
		{
			return _iface.GetQueryUGCResult(handle, index, pDetails);
		}
		public static uint32 GetQueryUGCNumTags(UGCQueryHandle_t handle, uint32 index)
		{
			return _iface.GetQueryUGCNumTags(handle, index);
		}
		public static bool GetQueryUGCTag(UGCQueryHandle_t handle, uint32 index, uint32 indexTag, char8* pchValue, uint32 cchValueSize)
		{
			return _iface.GetQueryUGCTag(handle, index, indexTag, pchValue, cchValueSize);
		}
		public static bool GetQueryUGCTagDisplayName(UGCQueryHandle_t handle, uint32 index, uint32 indexTag, char8* pchValue, uint32 cchValueSize)
		{
			return _iface.GetQueryUGCTagDisplayName(handle, index, indexTag, pchValue, cchValueSize);
		}
		public static bool GetQueryUGCPreviewURL(UGCQueryHandle_t handle, uint32 index, char8* pchURL, uint32 cchURLSize)
		{
			return _iface.GetQueryUGCPreviewURL(handle, index, pchURL, cchURLSize);
		}
		public static bool GetQueryUGCMetadata(UGCQueryHandle_t handle, uint32 index, char8* pchMetadata, uint32 cchMetadatasize)
		{
			return _iface.GetQueryUGCMetadata(handle, index, pchMetadata, cchMetadatasize);
		}
		public static bool GetQueryUGCChildren(UGCQueryHandle_t handle, uint32 index, PublishedFileId_t* pvecPublishedFileID, uint32 cMaxEntries)
		{
			return _iface.GetQueryUGCChildren(handle, index, pvecPublishedFileID, cMaxEntries);
		}
		public static bool GetQueryUGCStatistic(UGCQueryHandle_t handle, uint32 index, EItemStatistic eStatType, out uint64 pStatValue)
		{
			pStatValue = ?;
			return _iface.GetQueryUGCStatistic(handle, index, eStatType, &pStatValue);
		}
		public static uint32 GetQueryUGCNumAdditionalPreviews(UGCQueryHandle_t handle, uint32 index)
		{
			return _iface.GetQueryUGCNumAdditionalPreviews(handle, index);
		}
		public static bool GetQueryUGCAdditionalPreview(UGCQueryHandle_t handle, uint32 index, uint32 previewIndex, char8* pchURLOrVideoID, uint32 cchURLSize, char8* pchOriginalFileName, uint32 cchOriginalFileNameSize, EItemPreviewType* pPreviewType)
		{
			return _iface.GetQueryUGCAdditionalPreview(handle, index, previewIndex, pchURLOrVideoID, cchURLSize, pchOriginalFileName, cchOriginalFileNameSize, pPreviewType);
		}
		public static uint32 GetQueryUGCNumKeyValueTags(UGCQueryHandle_t handle, uint32 index)
		{
			return _iface.GetQueryUGCNumKeyValueTags(handle, index);
		}
		public static bool GetQueryUGCKeyValueTag(UGCQueryHandle_t handle, uint32 index, uint32 keyValueTagIndex, char8* pchKey, uint32 cchKeySize, char8* pchValue, uint32 cchValueSize)
		{
			return _iface.GetQueryUGCKeyValueTag(handle, index, keyValueTagIndex, pchKey, cchKeySize, pchValue, cchValueSize);
		}
		public static bool GetQueryUGCKeyValueTag(UGCQueryHandle_t handle, uint32 index, StringView pchKey, char8* pchValue, uint32 cchValueSize)
		{
			return _iface.GetQueryUGCKeyValueTag(handle, index, TerminateString!(pchKey), pchValue, cchValueSize);
		}
		public static bool ReleaseQueryUGCRequest(UGCQueryHandle_t handle)
		{
			return _iface.ReleaseQueryUGCRequest(handle);
		}
		public static bool AddRequiredTag(UGCQueryHandle_t handle, StringView pTagName)
		{
			return _iface.AddRequiredTag(handle, TerminateString!(pTagName));
		}
		public static bool AddRequiredTagGroup(UGCQueryHandle_t handle, SteamParamStringArray_t* pTagGroups)
		{
			return _iface.AddRequiredTagGroup(handle, pTagGroups);
		}
		public static bool AddExcludedTag(UGCQueryHandle_t handle, StringView pTagName)
		{
			return _iface.AddExcludedTag(handle, TerminateString!(pTagName));
		}
		public static bool SetReturnOnlyIDs(UGCQueryHandle_t handle, bool bReturnOnlyIDs)
		{
			return _iface.SetReturnOnlyIDs(handle, bReturnOnlyIDs);
		}
		public static bool SetReturnKeyValueTags(UGCQueryHandle_t handle, bool bReturnKeyValueTags)
		{
			return _iface.SetReturnKeyValueTags(handle, bReturnKeyValueTags);
		}
		public static bool SetReturnLongDescription(UGCQueryHandle_t handle, bool bReturnLongDescription)
		{
			return _iface.SetReturnLongDescription(handle, bReturnLongDescription);
		}
		public static bool SetReturnMetadata(UGCQueryHandle_t handle, bool bReturnMetadata)
		{
			return _iface.SetReturnMetadata(handle, bReturnMetadata);
		}
		public static bool SetReturnChildren(UGCQueryHandle_t handle, bool bReturnChildren)
		{
			return _iface.SetReturnChildren(handle, bReturnChildren);
		}
		public static bool SetReturnAdditionalPreviews(UGCQueryHandle_t handle, bool bReturnAdditionalPreviews)
		{
			return _iface.SetReturnAdditionalPreviews(handle, bReturnAdditionalPreviews);
		}
		public static bool SetReturnTotalOnly(UGCQueryHandle_t handle, bool bReturnTotalOnly)
		{
			return _iface.SetReturnTotalOnly(handle, bReturnTotalOnly);
		}
		public static bool SetReturnPlaytimeStats(UGCQueryHandle_t handle, uint32 unDays)
		{
			return _iface.SetReturnPlaytimeStats(handle, unDays);
		}
		public static bool SetLanguage(UGCQueryHandle_t handle, StringView pchLanguage)
		{
			return _iface.SetLanguage(handle, TerminateString!(pchLanguage));
		}
		public static bool SetAllowCachedResponse(UGCQueryHandle_t handle, uint32 unMaxAgeSeconds)
		{
			return _iface.SetAllowCachedResponse(handle, unMaxAgeSeconds);
		}
		public static bool SetCloudFileNameFilter(UGCQueryHandle_t handle, StringView pMatchCloudFileName)
		{
			return _iface.SetCloudFileNameFilter(handle, TerminateString!(pMatchCloudFileName));
		}
		public static bool SetMatchAnyTag(UGCQueryHandle_t handle, bool bMatchAnyTag)
		{
			return _iface.SetMatchAnyTag(handle, bMatchAnyTag);
		}
		public static bool SetSearchText(UGCQueryHandle_t handle, StringView pSearchText)
		{
			return _iface.SetSearchText(handle, TerminateString!(pSearchText));
		}
		public static bool SetRankedByTrendDays(UGCQueryHandle_t handle, uint32 unDays)
		{
			return _iface.SetRankedByTrendDays(handle, unDays);
		}
		public static bool AddRequiredKeyValueTag(UGCQueryHandle_t handle, StringView pKey, StringView pValue)
		{
			return _iface.AddRequiredKeyValueTag(handle, TerminateString!(pKey), TerminateString!(pValue));
		}
		[NoDiscard]
		public static SteamAPICall_t RequestUGCDetails(PublishedFileId_t nPublishedFileID, uint32 unMaxAgeSeconds)
		{
			return _iface.RequestUGCDetails(nPublishedFileID, unMaxAgeSeconds);
		}
		[NoDiscard]
		public static SteamAPICall_t CreateItem(AppId_t nConsumerAppId, EWorkshopFileType eFileType)
		{
			return _iface.CreateItem(nConsumerAppId, eFileType);
		}
		public static UGCUpdateHandle_t StartItemUpdate(AppId_t nConsumerAppId, PublishedFileId_t nPublishedFileID)
		{
			return _iface.StartItemUpdate(nConsumerAppId, nPublishedFileID);
		}
		public static bool SetItemTitle(UGCUpdateHandle_t handle, StringView pchTitle)
		{
			return _iface.SetItemTitle(handle, TerminateString!(pchTitle));
		}
		public static bool SetItemDescription(UGCUpdateHandle_t handle, StringView pchDescription)
		{
			return _iface.SetItemDescription(handle, TerminateString!(pchDescription));
		}
		public static bool SetItemUpdateLanguage(UGCUpdateHandle_t handle, StringView pchLanguage)
		{
			return _iface.SetItemUpdateLanguage(handle, TerminateString!(pchLanguage));
		}
		public static bool SetItemMetadata(UGCUpdateHandle_t handle, StringView pchMetaData)
		{
			return _iface.SetItemMetadata(handle, TerminateString!(pchMetaData));
		}
		public static bool SetItemVisibility(UGCUpdateHandle_t handle, ERemoteStoragePublishedFileVisibility eVisibility)
		{
			return _iface.SetItemVisibility(handle, eVisibility);
		}
		public static bool SetItemTags(UGCUpdateHandle_t updateHandle, SteamParamStringArray_t* pTags)
		{
			return _iface.SetItemTags(updateHandle, pTags);
		}
		public static bool SetItemContent(UGCUpdateHandle_t handle, StringView pszContentFolder)
		{
			return _iface.SetItemContent(handle, TerminateString!(pszContentFolder));
		}
		public static bool SetItemPreview(UGCUpdateHandle_t handle, StringView pszPreviewFile)
		{
			return _iface.SetItemPreview(handle, TerminateString!(pszPreviewFile));
		}
		public static bool SetAllowLegacyUpload(UGCUpdateHandle_t handle, bool bAllowLegacyUpload)
		{
			return _iface.SetAllowLegacyUpload(handle, bAllowLegacyUpload);
		}
		public static bool RemoveAllItemKeyValueTags(UGCUpdateHandle_t handle)
		{
			return _iface.RemoveAllItemKeyValueTags(handle);
		}
		public static bool RemoveItemKeyValueTags(UGCUpdateHandle_t handle, StringView pchKey)
		{
			return _iface.RemoveItemKeyValueTags(handle, TerminateString!(pchKey));
		}
		public static bool AddItemKeyValueTag(UGCUpdateHandle_t handle, StringView pchKey, StringView pchValue)
		{
			return _iface.AddItemKeyValueTag(handle, TerminateString!(pchKey), TerminateString!(pchValue));
		}
		public static bool AddItemPreviewFile(UGCUpdateHandle_t handle, StringView pszPreviewFile, EItemPreviewType type)
		{
			return _iface.AddItemPreviewFile(handle, TerminateString!(pszPreviewFile), type);
		}
		public static bool AddItemPreviewVideo(UGCUpdateHandle_t handle, StringView pszVideoID)
		{
			return _iface.AddItemPreviewVideo(handle, TerminateString!(pszVideoID));
		}
		public static bool UpdateItemPreviewFile(UGCUpdateHandle_t handle, uint32 index, StringView pszPreviewFile)
		{
			return _iface.UpdateItemPreviewFile(handle, index, TerminateString!(pszPreviewFile));
		}
		public static bool UpdateItemPreviewVideo(UGCUpdateHandle_t handle, uint32 index, StringView pszVideoID)
		{
			return _iface.UpdateItemPreviewVideo(handle, index, TerminateString!(pszVideoID));
		}
		public static bool RemoveItemPreview(UGCUpdateHandle_t handle, uint32 index)
		{
			return _iface.RemoveItemPreview(handle, index);
		}
		[NoDiscard]
		public static SteamAPICall_t SubmitItemUpdate(UGCUpdateHandle_t handle, StringView pchChangeNote)
		{
			return _iface.SubmitItemUpdate(handle, TerminateString!(pchChangeNote));
		}
		public static EItemUpdateStatus GetItemUpdateProgress(UGCUpdateHandle_t handle, out uint64 punBytesProcessed, out uint64 punBytesTotal)
		{
			punBytesProcessed = ?;
			punBytesTotal = ?;
			return _iface.GetItemUpdateProgress(handle, &punBytesProcessed, &punBytesTotal);
		}
		[NoDiscard]
		public static SteamAPICall_t SetUserItemVote(PublishedFileId_t nPublishedFileID, bool bVoteUp)
		{
			return _iface.SetUserItemVote(nPublishedFileID, bVoteUp);
		}
		[NoDiscard]
		public static SteamAPICall_t GetUserItemVote(PublishedFileId_t nPublishedFileID)
		{
			return _iface.GetUserItemVote(nPublishedFileID);
		}
		[NoDiscard]
		public static SteamAPICall_t AddItemToFavorites(AppId_t nAppId, PublishedFileId_t nPublishedFileID)
		{
			return _iface.AddItemToFavorites(nAppId, nPublishedFileID);
		}
		[NoDiscard]
		public static SteamAPICall_t RemoveItemFromFavorites(AppId_t nAppId, PublishedFileId_t nPublishedFileID)
		{
			return _iface.RemoveItemFromFavorites(nAppId, nPublishedFileID);
		}
		[NoDiscard]
		public static SteamAPICall_t SubscribeItem(PublishedFileId_t nPublishedFileID)
		{
			return _iface.SubscribeItem(nPublishedFileID);
		}
		[NoDiscard]
		public static SteamAPICall_t UnsubscribeItem(PublishedFileId_t nPublishedFileID)
		{
			return _iface.UnsubscribeItem(nPublishedFileID);
		}
		public static uint32 GetNumSubscribedItems()
		{
			return _iface.GetNumSubscribedItems();
		}
		public static uint32 GetSubscribedItems(PublishedFileId_t* pvecPublishedFileID, uint32 cMaxEntries)
		{
			return _iface.GetSubscribedItems(pvecPublishedFileID, cMaxEntries);
		}
		public static uint32 GetItemState(PublishedFileId_t nPublishedFileID)
		{
			return _iface.GetItemState(nPublishedFileID);
		}
		public static bool GetItemInstallInfo(PublishedFileId_t nPublishedFileID, out uint64 punSizeOnDisk, char8* pchFolder, uint32 cchFolderSize, out uint32 punTimeStamp)
		{
			punSizeOnDisk = ?;
			punTimeStamp = ?;
			return _iface.GetItemInstallInfo(nPublishedFileID, &punSizeOnDisk, pchFolder, cchFolderSize, &punTimeStamp);
		}
		public static bool GetItemDownloadInfo(PublishedFileId_t nPublishedFileID, out uint64 punBytesDownloaded, out uint64 punBytesTotal)
		{
			punBytesDownloaded = ?;
			punBytesTotal = ?;
			return _iface.GetItemDownloadInfo(nPublishedFileID, &punBytesDownloaded, &punBytesTotal);
		}
		public static bool DownloadItem(PublishedFileId_t nPublishedFileID, bool bHighPriority)
		{
			return _iface.DownloadItem(nPublishedFileID, bHighPriority);
		}
		public static bool BInitWorkshopForGameServer(DepotId_t unWorkshopDepotID, StringView pszFolder)
		{
			return _iface.BInitWorkshopForGameServer(unWorkshopDepotID, TerminateString!(pszFolder));
		}
		public static void SuspendDownloads(bool bSuspend)
		{
			_iface.SuspendDownloads(bSuspend);
		}
		[NoDiscard]
		public static SteamAPICall_t StartPlaytimeTracking(PublishedFileId_t* pvecPublishedFileID, uint32 unNumPublishedFileIDs)
		{
			return _iface.StartPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs);
		}
		[NoDiscard]
		public static SteamAPICall_t StopPlaytimeTracking(PublishedFileId_t* pvecPublishedFileID, uint32 unNumPublishedFileIDs)
		{
			return _iface.StopPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs);
		}
		[NoDiscard]
		public static SteamAPICall_t StopPlaytimeTrackingForAllItems()
		{
			return _iface.StopPlaytimeTrackingForAllItems();
		}
		[NoDiscard]
		public static SteamAPICall_t AddDependency(PublishedFileId_t nParentPublishedFileID, PublishedFileId_t nChildPublishedFileID)
		{
			return _iface.AddDependency(nParentPublishedFileID, nChildPublishedFileID);
		}
		[NoDiscard]
		public static SteamAPICall_t RemoveDependency(PublishedFileId_t nParentPublishedFileID, PublishedFileId_t nChildPublishedFileID)
		{
			return _iface.RemoveDependency(nParentPublishedFileID, nChildPublishedFileID);
		}
		[NoDiscard]
		public static SteamAPICall_t AddAppDependency(PublishedFileId_t nPublishedFileID, AppId_t nAppID)
		{
			return _iface.AddAppDependency(nPublishedFileID, nAppID);
		}
		[NoDiscard]
		public static SteamAPICall_t RemoveAppDependency(PublishedFileId_t nPublishedFileID, AppId_t nAppID)
		{
			return _iface.RemoveAppDependency(nPublishedFileID, nAppID);
		}
		[NoDiscard]
		public static SteamAPICall_t GetAppDependencies(PublishedFileId_t nPublishedFileID)
		{
			return _iface.GetAppDependencies(nPublishedFileID);
		}
		[NoDiscard]
		public static SteamAPICall_t DeleteItem(PublishedFileId_t nPublishedFileID)
		{
			return _iface.DeleteItem(nPublishedFileID);
		}
	}
}