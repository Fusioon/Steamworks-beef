using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamController
	{
		static ISteamController _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamController()) != 0;
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
		public static int32 GetConnectedControllers(ControllerHandle_t* handlesOut)
		{
			return _iface.GetConnectedControllers(handlesOut);
		}
		public static ControllerActionSetHandle_t GetActionSetHandle(StringView pszActionSetName)
		{
			return _iface.GetActionSetHandle(TerminateString!(pszActionSetName));
		}
		public static void ActivateActionSet(ControllerHandle_t controllerHandle, ControllerActionSetHandle_t actionSetHandle)
		{
			_iface.ActivateActionSet(controllerHandle, actionSetHandle);
		}
		public static ControllerActionSetHandle_t GetCurrentActionSet(ControllerHandle_t controllerHandle)
		{
			return _iface.GetCurrentActionSet(controllerHandle);
		}
		public static void ActivateActionSetLayer(ControllerHandle_t controllerHandle, ControllerActionSetHandle_t actionSetLayerHandle)
		{
			_iface.ActivateActionSetLayer(controllerHandle, actionSetLayerHandle);
		}
		public static void DeactivateActionSetLayer(ControllerHandle_t controllerHandle, ControllerActionSetHandle_t actionSetLayerHandle)
		{
			_iface.DeactivateActionSetLayer(controllerHandle, actionSetLayerHandle);
		}
		public static void DeactivateAllActionSetLayers(ControllerHandle_t controllerHandle)
		{
			_iface.DeactivateAllActionSetLayers(controllerHandle);
		}
		public static int32 GetActiveActionSetLayers(ControllerHandle_t controllerHandle, ControllerActionSetHandle_t* handlesOut)
		{
			return _iface.GetActiveActionSetLayers(controllerHandle, handlesOut);
		}
		public static ControllerDigitalActionHandle_t GetDigitalActionHandle(StringView pszActionName)
		{
			return _iface.GetDigitalActionHandle(TerminateString!(pszActionName));
		}
		public static InputDigitalActionData_t GetDigitalActionData(ControllerHandle_t controllerHandle, ControllerDigitalActionHandle_t digitalActionHandle)
		{
			return _iface.GetDigitalActionData(controllerHandle, digitalActionHandle);
		}
		public static int32 GetDigitalActionOrigins(ControllerHandle_t controllerHandle, ControllerActionSetHandle_t actionSetHandle, ControllerDigitalActionHandle_t digitalActionHandle, EControllerActionOrigin* originsOut)
		{
			return _iface.GetDigitalActionOrigins(controllerHandle, actionSetHandle, digitalActionHandle, originsOut);
		}
		public static ControllerAnalogActionHandle_t GetAnalogActionHandle(StringView pszActionName)
		{
			return _iface.GetAnalogActionHandle(TerminateString!(pszActionName));
		}
		public static InputAnalogActionData_t GetAnalogActionData(ControllerHandle_t controllerHandle, ControllerAnalogActionHandle_t analogActionHandle)
		{
			return _iface.GetAnalogActionData(controllerHandle, analogActionHandle);
		}
		public static int32 GetAnalogActionOrigins(ControllerHandle_t controllerHandle, ControllerActionSetHandle_t actionSetHandle, ControllerAnalogActionHandle_t analogActionHandle, EControllerActionOrigin* originsOut)
		{
			return _iface.GetAnalogActionOrigins(controllerHandle, actionSetHandle, analogActionHandle, originsOut);
		}
		public static StringView GetGlyphForActionOrigin(EControllerActionOrigin eOrigin)
		{
			return StringView(_iface.GetGlyphForActionOrigin(eOrigin));
		}
		public static StringView GetStringForActionOrigin(EControllerActionOrigin eOrigin)
		{
			return StringView(_iface.GetStringForActionOrigin(eOrigin));
		}
		public static void StopAnalogActionMomentum(ControllerHandle_t controllerHandle, ControllerAnalogActionHandle_t eAction)
		{
			_iface.StopAnalogActionMomentum(controllerHandle, eAction);
		}
		public static InputMotionData_t GetMotionData(ControllerHandle_t controllerHandle)
		{
			return _iface.GetMotionData(controllerHandle);
		}
		public static void TriggerHapticPulse(ControllerHandle_t controllerHandle, ESteamControllerPad eTargetPad, uint16 usDurationMicroSec)
		{
			_iface.TriggerHapticPulse(controllerHandle, eTargetPad, usDurationMicroSec);
		}
		public static void TriggerRepeatedHapticPulse(ControllerHandle_t controllerHandle, ESteamControllerPad eTargetPad, uint16 usDurationMicroSec, uint16 usOffMicroSec, uint16 unRepeat, uint32 nFlags)
		{
			_iface.TriggerRepeatedHapticPulse(controllerHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags);
		}
		public static void TriggerVibration(ControllerHandle_t controllerHandle, uint16 usLeftSpeed, uint16 usRightSpeed)
		{
			_iface.TriggerVibration(controllerHandle, usLeftSpeed, usRightSpeed);
		}
		public static void SetLEDColor(ControllerHandle_t controllerHandle, uint8 nColorR, uint8 nColorG, uint8 nColorB, uint32 nFlags)
		{
			_iface.SetLEDColor(controllerHandle, nColorR, nColorG, nColorB, nFlags);
		}
		public static bool ShowBindingPanel(ControllerHandle_t controllerHandle)
		{
			return _iface.ShowBindingPanel(controllerHandle);
		}
		public static ESteamInputType GetInputTypeForHandle(ControllerHandle_t controllerHandle)
		{
			return _iface.GetInputTypeForHandle(controllerHandle);
		}
		public static ControllerHandle_t GetControllerForGamepadIndex(int32 nIndex)
		{
			return _iface.GetControllerForGamepadIndex(nIndex);
		}
		public static int32 GetGamepadIndexForController(ControllerHandle_t ulControllerHandle)
		{
			return _iface.GetGamepadIndexForController(ulControllerHandle);
		}
		public static StringView GetStringForXboxOrigin(EXboxOrigin eOrigin)
		{
			return StringView(_iface.GetStringForXboxOrigin(eOrigin));
		}
		public static StringView GetGlyphForXboxOrigin(EXboxOrigin eOrigin)
		{
			return StringView(_iface.GetGlyphForXboxOrigin(eOrigin));
		}
		public static EControllerActionOrigin GetActionOriginFromXboxOrigin(ControllerHandle_t controllerHandle, EXboxOrigin eOrigin)
		{
			return _iface.GetActionOriginFromXboxOrigin(controllerHandle, eOrigin);
		}
		public static EControllerActionOrigin TranslateActionOrigin(ESteamInputType eDestinationInputType, EControllerActionOrigin eSourceOrigin)
		{
			return _iface.TranslateActionOrigin(eDestinationInputType, eSourceOrigin);
		}
		public static bool GetControllerBindingRevision(ControllerHandle_t controllerHandle, out int32 pMajor, out int32 pMinor)
		{
			pMajor = ?;
			pMinor = ?;
			return _iface.GetControllerBindingRevision(controllerHandle, &pMajor, &pMinor);
		}
	}
}