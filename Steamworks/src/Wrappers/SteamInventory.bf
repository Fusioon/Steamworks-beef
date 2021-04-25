using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamInventory
	{
		static ISteamInventory _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamInventory()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerInventory()) != 0;
		public static EResult GetResultStatus(SteamInventoryResult_t resultHandle)
		{
			return _iface.GetResultStatus(resultHandle);
		}
		public static bool GetResultItems(SteamInventoryResult_t resultHandle, SteamItemDetails_t* pOutItemsArray, out uint32 punOutItemsArraySize)
		{
			punOutItemsArraySize = ?;
			return _iface.GetResultItems(resultHandle, pOutItemsArray, &punOutItemsArraySize);
		}
		public static bool GetResultItemProperty(SteamInventoryResult_t resultHandle, uint32 unItemIndex, StringView pchPropertyName, char8* pchValueBuffer, uint32* punValueBufferSizeOut)
		{
			return _iface.GetResultItemProperty(resultHandle, unItemIndex, TerminateString!(pchPropertyName), pchValueBuffer, punValueBufferSizeOut);
		}
		public static uint32 GetResultTimestamp(SteamInventoryResult_t resultHandle)
		{
			return _iface.GetResultTimestamp(resultHandle);
		}
		public static bool CheckResultSteamID(SteamInventoryResult_t resultHandle, CSteamID steamIDExpected)
		{
			return _iface.CheckResultSteamID(resultHandle, steamIDExpected);
		}
		public static void DestroyResult(SteamInventoryResult_t resultHandle)
		{
			_iface.DestroyResult(resultHandle);
		}
		public static bool GetAllItems(SteamInventoryResult_t* pResultHandle)
		{
			return _iface.GetAllItems(pResultHandle);
		}
		public static bool GetItemsByID(SteamInventoryResult_t* pResultHandle, SteamItemInstanceID_t* pInstanceIDs, uint32 unCountInstanceIDs)
		{
			return _iface.GetItemsByID(pResultHandle, pInstanceIDs, unCountInstanceIDs);
		}
		public static bool SerializeResult(SteamInventoryResult_t resultHandle, void* pOutBuffer, out uint32 punOutBufferSize)
		{
			punOutBufferSize = ?;
			return _iface.SerializeResult(resultHandle, pOutBuffer, &punOutBufferSize);
		}
		public static bool DeserializeResult(SteamInventoryResult_t* pOutResultHandle, void* pBuffer, uint32 unBufferSize, bool bRESERVED_MUST_BE_FALSE)
		{
			return _iface.DeserializeResult(pOutResultHandle, pBuffer, unBufferSize, bRESERVED_MUST_BE_FALSE);
		}
		public static bool GenerateItems(SteamInventoryResult_t* pResultHandle, SteamItemDef_t* pArrayItemDefs, uint32* punArrayQuantity, uint32 unArrayLength)
		{
			return _iface.GenerateItems(pResultHandle, pArrayItemDefs, punArrayQuantity, unArrayLength);
		}
		public static bool GrantPromoItems(SteamInventoryResult_t* pResultHandle)
		{
			return _iface.GrantPromoItems(pResultHandle);
		}
		public static bool AddPromoItem(SteamInventoryResult_t* pResultHandle, SteamItemDef_t itemDef)
		{
			return _iface.AddPromoItem(pResultHandle, itemDef);
		}
		public static bool AddPromoItems(SteamInventoryResult_t* pResultHandle, SteamItemDef_t* pArrayItemDefs, uint32 unArrayLength)
		{
			return _iface.AddPromoItems(pResultHandle, pArrayItemDefs, unArrayLength);
		}
		public static bool ConsumeItem(SteamInventoryResult_t* pResultHandle, SteamItemInstanceID_t itemConsume, uint32 unQuantity)
		{
			return _iface.ConsumeItem(pResultHandle, itemConsume, unQuantity);
		}
		public static bool ExchangeItems(SteamInventoryResult_t* pResultHandle, SteamItemDef_t* pArrayGenerate, uint32* punArrayGenerateQuantity, uint32 unArrayGenerateLength, SteamItemInstanceID_t* pArrayDestroy, uint32* punArrayDestroyQuantity, uint32 unArrayDestroyLength)
		{
			return _iface.ExchangeItems(pResultHandle, pArrayGenerate, punArrayGenerateQuantity, unArrayGenerateLength, pArrayDestroy, punArrayDestroyQuantity, unArrayDestroyLength);
		}
		public static bool TransferItemQuantity(SteamInventoryResult_t* pResultHandle, SteamItemInstanceID_t itemIdSource, uint32 unQuantity, SteamItemInstanceID_t itemIdDest)
		{
			return _iface.TransferItemQuantity(pResultHandle, itemIdSource, unQuantity, itemIdDest);
		}
		public static void SendItemDropHeartbeat()
		{
			_iface.SendItemDropHeartbeat();
		}
		public static bool TriggerItemDrop(SteamInventoryResult_t* pResultHandle, SteamItemDef_t dropListDefinition)
		{
			return _iface.TriggerItemDrop(pResultHandle, dropListDefinition);
		}
		public static bool TradeItems(SteamInventoryResult_t* pResultHandle, CSteamID steamIDTradePartner, SteamItemInstanceID_t* pArrayGive, uint32* pArrayGiveQuantity, uint32 nArrayGiveLength, SteamItemInstanceID_t* pArrayGet, uint32* pArrayGetQuantity, uint32 nArrayGetLength)
		{
			return _iface.TradeItems(pResultHandle, steamIDTradePartner, pArrayGive, pArrayGiveQuantity, nArrayGiveLength, pArrayGet, pArrayGetQuantity, nArrayGetLength);
		}
		public static bool LoadItemDefinitions()
		{
			return _iface.LoadItemDefinitions();
		}
		public static bool GetItemDefinitionIDs(SteamItemDef_t* pItemDefIDs, out uint32 punItemDefIDsArraySize)
		{
			punItemDefIDsArraySize = ?;
			return _iface.GetItemDefinitionIDs(pItemDefIDs, &punItemDefIDsArraySize);
		}
		public static bool GetItemDefinitionProperty(SteamItemDef_t iDefinition, StringView pchPropertyName, char8* pchValueBuffer, uint32* punValueBufferSizeOut)
		{
			return _iface.GetItemDefinitionProperty(iDefinition, TerminateString!(pchPropertyName), pchValueBuffer, punValueBufferSizeOut);
		}
		[NoDiscard]
		public static SteamAPICall_t RequestEligiblePromoItemDefinitionsIDs(CSteamID steamID)
		{
			return _iface.RequestEligiblePromoItemDefinitionsIDs(steamID);
		}
		public static bool GetEligiblePromoItemDefinitionIDs(CSteamID steamID, SteamItemDef_t* pItemDefIDs, out uint32 punItemDefIDsArraySize)
		{
			punItemDefIDsArraySize = ?;
			return _iface.GetEligiblePromoItemDefinitionIDs(steamID, pItemDefIDs, &punItemDefIDsArraySize);
		}
		[NoDiscard]
		public static SteamAPICall_t StartPurchase(SteamItemDef_t* pArrayItemDefs, uint32* punArrayQuantity, uint32 unArrayLength)
		{
			return _iface.StartPurchase(pArrayItemDefs, punArrayQuantity, unArrayLength);
		}
		[NoDiscard]
		public static SteamAPICall_t RequestPrices()
		{
			return _iface.RequestPrices();
		}
		public static uint32 GetNumItemsWithPrices()
		{
			return _iface.GetNumItemsWithPrices();
		}
		public static bool GetItemsWithPrices(SteamItemDef_t* pArrayItemDefs, out uint64 pCurrentPrices, out uint64 pBasePrices, uint32 unArrayLength)
		{
			pCurrentPrices = ?;
			pBasePrices = ?;
			return _iface.GetItemsWithPrices(pArrayItemDefs, &pCurrentPrices, &pBasePrices, unArrayLength);
		}
		public static bool GetItemPrice(SteamItemDef_t iDefinition, out uint64 pCurrentPrice, out uint64 pBasePrice)
		{
			pCurrentPrice = ?;
			pBasePrice = ?;
			return _iface.GetItemPrice(iDefinition, &pCurrentPrice, &pBasePrice);
		}
		public static SteamInventoryUpdateHandle_t StartUpdateProperties()
		{
			return _iface.StartUpdateProperties();
		}
		public static bool RemoveProperty(SteamInventoryUpdateHandle_t handle, SteamItemInstanceID_t nItemID, StringView pchPropertyName)
		{
			return _iface.RemoveProperty(handle, nItemID, TerminateString!(pchPropertyName));
		}
		public static bool SetProperty(SteamInventoryUpdateHandle_t handle, SteamItemInstanceID_t nItemID, StringView pchPropertyName, StringView pchPropertyValue)
		{
			return _iface.SetProperty(handle, nItemID, TerminateString!(pchPropertyName), TerminateString!(pchPropertyValue));
		}
		public static bool SetProperty(SteamInventoryUpdateHandle_t handle, SteamItemInstanceID_t nItemID, StringView pchPropertyName, bool bValue)
		{
			return _iface.SetProperty(handle, nItemID, TerminateString!(pchPropertyName), bValue);
		}
		public static bool SetProperty(SteamInventoryUpdateHandle_t handle, SteamItemInstanceID_t nItemID, StringView pchPropertyName, int64 nValue)
		{
			return _iface.SetProperty(handle, nItemID, TerminateString!(pchPropertyName), nValue);
		}
		public static bool SetProperty(SteamInventoryUpdateHandle_t handle, SteamItemInstanceID_t nItemID, StringView pchPropertyName, float flValue)
		{
			return _iface.SetProperty(handle, nItemID, TerminateString!(pchPropertyName), flValue);
		}
		public static bool SubmitUpdateProperties(SteamInventoryUpdateHandle_t handle, SteamInventoryResult_t* pResultHandle)
		{
			return _iface.SubmitUpdateProperties(handle, pResultHandle);
		}
		public static bool InspectItem(SteamInventoryResult_t* pResultHandle, StringView pchItemToken)
		{
			return _iface.InspectItem(pResultHandle, TerminateString!(pchItemToken));
		}
	}
}