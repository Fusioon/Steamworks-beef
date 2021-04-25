using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamInput
	{
		static ISteamInput _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamInput()) != 0;
		public static bool Init()
		{
			return _iface.Init();
		}
		public static bool Shutdown()
		{
			return _iface.Shutdown();
		}
		public static void RunFrame()
		{
			_iface.RunFrame();
		}
		public static int32 GetConnectedControllers(InputHandle_t handlesOut)
		{
			return _iface.GetConnectedControllers(handlesOut);
		}
		public static InputActionSetHandle_t GetActionSetHandle(StringView pszActionSetName)
		{
			return _iface.GetActionSetHandle(TerminateString!(pszActionSetName));
		}
		public static void ActivateActionSet(InputHandle_t inputHandle, InputActionSetHandle_t actionSetHandle)
		{
			_iface.ActivateActionSet(inputHandle, actionSetHandle);
		}
		public static InputActionSetHandle_t GetCurrentActionSet(InputHandle_t inputHandle)
		{
			return _iface.GetCurrentActionSet(inputHandle);
		}
		public static void ActivateActionSetLayer(InputHandle_t inputHandle, InputActionSetHandle_t actionSetLayerHandle)
		{
			_iface.ActivateActionSetLayer(inputHandle, actionSetLayerHandle);
		}
		public static void DeactivateActionSetLayer(InputHandle_t inputHandle, InputActionSetHandle_t actionSetLayerHandle)
		{
			_iface.DeactivateActionSetLayer(inputHandle, actionSetLayerHandle);
		}
		public static void DeactivateAllActionSetLayers(InputHandle_t inputHandle)
		{
			_iface.DeactivateAllActionSetLayers(inputHandle);
		}
		public static int32 GetActiveActionSetLayers(InputHandle_t inputHandle, InputActionSetHandle_t handlesOut)
		{
			return _iface.GetActiveActionSetLayers(inputHandle, handlesOut);
		}
		public static InputDigitalActionHandle_t GetDigitalActionHandle(StringView pszActionName)
		{
			return _iface.GetDigitalActionHandle(TerminateString!(pszActionName));
		}
		public static InputDigitalActionData_t GetDigitalActionData(InputHandle_t inputHandle, InputDigitalActionHandle_t digitalActionHandle)
		{
			return _iface.GetDigitalActionData(inputHandle, digitalActionHandle);
		}
		public static int32 GetDigitalActionOrigins(InputHandle_t inputHandle, InputActionSetHandle_t actionSetHandle, InputDigitalActionHandle_t digitalActionHandle, EInputActionOrigin* originsOut)
		{
			return _iface.GetDigitalActionOrigins(inputHandle, actionSetHandle, digitalActionHandle, originsOut);
		}
		public static InputAnalogActionHandle_t GetAnalogActionHandle(StringView pszActionName)
		{
			return _iface.GetAnalogActionHandle(TerminateString!(pszActionName));
		}
		public static InputAnalogActionData_t GetAnalogActionData(InputHandle_t inputHandle, InputAnalogActionHandle_t analogActionHandle)
		{
			return _iface.GetAnalogActionData(inputHandle, analogActionHandle);
		}
		public static int32 GetAnalogActionOrigins(InputHandle_t inputHandle, InputActionSetHandle_t actionSetHandle, InputAnalogActionHandle_t analogActionHandle, EInputActionOrigin* originsOut)
		{
			return _iface.GetAnalogActionOrigins(inputHandle, actionSetHandle, analogActionHandle, originsOut);
		}
		public static StringView GetGlyphForActionOrigin(EInputActionOrigin eOrigin)
		{
			return StringView(_iface.GetGlyphForActionOrigin(eOrigin));
		}
		public static StringView GetStringForActionOrigin(EInputActionOrigin eOrigin)
		{
			return StringView(_iface.GetStringForActionOrigin(eOrigin));
		}
		public static void StopAnalogActionMomentum(InputHandle_t inputHandle, InputAnalogActionHandle_t eAction)
		{
			_iface.StopAnalogActionMomentum(inputHandle, eAction);
		}
		public static InputMotionData_t GetMotionData(InputHandle_t inputHandle)
		{
			return _iface.GetMotionData(inputHandle);
		}
		public static void TriggerVibration(InputHandle_t inputHandle, uint16 usLeftSpeed, uint16 usRightSpeed)
		{
			_iface.TriggerVibration(inputHandle, usLeftSpeed, usRightSpeed);
		}
		public static void SetLEDColor(InputHandle_t inputHandle, uint8 nColorR, uint8 nColorG, uint8 nColorB, uint32 nFlags)
		{
			_iface.SetLEDColor(inputHandle, nColorR, nColorG, nColorB, nFlags);
		}
		public static void TriggerHapticPulse(InputHandle_t inputHandle, ESteamControllerPad eTargetPad, uint16 usDurationMicroSec)
		{
			_iface.TriggerHapticPulse(inputHandle, eTargetPad, usDurationMicroSec);
		}
		public static void TriggerRepeatedHapticPulse(InputHandle_t inputHandle, ESteamControllerPad eTargetPad, uint16 usDurationMicroSec, uint16 usOffMicroSec, uint16 unRepeat, uint32 nFlags)
		{
			_iface.TriggerRepeatedHapticPulse(inputHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags);
		}
		public static bool ShowBindingPanel(InputHandle_t inputHandle)
		{
			return _iface.ShowBindingPanel(inputHandle);
		}
		public static ESteamInputType GetInputTypeForHandle(InputHandle_t inputHandle)
		{
			return _iface.GetInputTypeForHandle(inputHandle);
		}
		public static InputHandle_t GetControllerForGamepadIndex(int32 nIndex)
		{
			return _iface.GetControllerForGamepadIndex(nIndex);
		}
		public static int32 GetGamepadIndexForController(InputHandle_t ulinputHandle)
		{
			return _iface.GetGamepadIndexForController(ulinputHandle);
		}
		public static StringView GetStringForXboxOrigin(EXboxOrigin eOrigin)
		{
			return StringView(_iface.GetStringForXboxOrigin(eOrigin));
		}
		public static StringView GetGlyphForXboxOrigin(EXboxOrigin eOrigin)
		{
			return StringView(_iface.GetGlyphForXboxOrigin(eOrigin));
		}
		public static EInputActionOrigin GetActionOriginFromXboxOrigin(InputHandle_t inputHandle, EXboxOrigin eOrigin)
		{
			return _iface.GetActionOriginFromXboxOrigin(inputHandle, eOrigin);
		}
		public static EInputActionOrigin TranslateActionOrigin(ESteamInputType eDestinationInputType, EInputActionOrigin eSourceOrigin)
		{
			return _iface.TranslateActionOrigin(eDestinationInputType, eSourceOrigin);
		}
		public static bool GetDeviceBindingRevision(InputHandle_t inputHandle, out int32 pMajor, out int32 pMinor)
		{
			pMajor = ?;
			pMinor = ?;
			return _iface.GetDeviceBindingRevision(inputHandle, &pMajor, &pMinor);
		}
		public static uint32 GetRemotePlaySessionID(InputHandle_t inputHandle)
		{
			return _iface.GetRemotePlaySessionID(inputHandle);
		}
	}
}