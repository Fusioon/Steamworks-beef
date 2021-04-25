using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamHTMLSurface
	{
		static ISteamHTMLSurface _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamHTMLSurface()) != 0;
		public static bool Init()
		{
			return _iface.Init();
		}
		public static bool Shutdown()
		{
			return _iface.Shutdown();
		}
		[NoDiscard]
		public static SteamAPICall_t CreateBrowser(StringView pchUserAgent, StringView pchUserCSS)
		{
			return _iface.CreateBrowser(TerminateString!(pchUserAgent), TerminateString!(pchUserCSS));
		}
		public static void RemoveBrowser(HHTMLBrowser unBrowserHandle)
		{
			_iface.RemoveBrowser(unBrowserHandle);
		}
		public static void LoadURL(HHTMLBrowser unBrowserHandle, StringView pchURL, StringView pchPostData)
		{
			_iface.LoadURL(unBrowserHandle, TerminateString!(pchURL), TerminateString!(pchPostData));
		}
		public static void SetSize(HHTMLBrowser unBrowserHandle, uint32 unWidth, uint32 unHeight)
		{
			_iface.SetSize(unBrowserHandle, unWidth, unHeight);
		}
		public static void StopLoad(HHTMLBrowser unBrowserHandle)
		{
			_iface.StopLoad(unBrowserHandle);
		}
		public static void Reload(HHTMLBrowser unBrowserHandle)
		{
			_iface.Reload(unBrowserHandle);
		}
		public static void GoBack(HHTMLBrowser unBrowserHandle)
		{
			_iface.GoBack(unBrowserHandle);
		}
		public static void GoForward(HHTMLBrowser unBrowserHandle)
		{
			_iface.GoForward(unBrowserHandle);
		}
		public static void AddHeader(HHTMLBrowser unBrowserHandle, StringView pchKey, StringView pchValue)
		{
			_iface.AddHeader(unBrowserHandle, TerminateString!(pchKey), TerminateString!(pchValue));
		}
		public static void ExecuteJavascript(HHTMLBrowser unBrowserHandle, StringView pchScript)
		{
			_iface.ExecuteJavascript(unBrowserHandle, TerminateString!(pchScript));
		}
		public static void MouseUp(HHTMLBrowser unBrowserHandle, ISteamHTMLSurface.EHTMLMouseButton eMouseButton)
		{
			_iface.MouseUp(unBrowserHandle, eMouseButton);
		}
		public static void MouseDown(HHTMLBrowser unBrowserHandle, ISteamHTMLSurface.EHTMLMouseButton eMouseButton)
		{
			_iface.MouseDown(unBrowserHandle, eMouseButton);
		}
		public static void MouseDoubleClick(HHTMLBrowser unBrowserHandle, ISteamHTMLSurface.EHTMLMouseButton eMouseButton)
		{
			_iface.MouseDoubleClick(unBrowserHandle, eMouseButton);
		}
		public static void MouseMove(HHTMLBrowser unBrowserHandle, int32 x, int32 y)
		{
			_iface.MouseMove(unBrowserHandle, x, y);
		}
		public static void MouseWheel(HHTMLBrowser unBrowserHandle, int32 nDelta)
		{
			_iface.MouseWheel(unBrowserHandle, nDelta);
		}
		public static void KeyDown(HHTMLBrowser unBrowserHandle, uint32 nNativeKeyCode, ISteamHTMLSurface.EHTMLKeyModifiers eHTMLKeyModifiers, bool bIsSystemKey)
		{
			_iface.KeyDown(unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers, bIsSystemKey);
		}
		public static void KeyUp(HHTMLBrowser unBrowserHandle, uint32 nNativeKeyCode, ISteamHTMLSurface.EHTMLKeyModifiers eHTMLKeyModifiers)
		{
			_iface.KeyUp(unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers);
		}
		public static void KeyChar(HHTMLBrowser unBrowserHandle, uint32 cUnicodeChar, ISteamHTMLSurface.EHTMLKeyModifiers eHTMLKeyModifiers)
		{
			_iface.KeyChar(unBrowserHandle, cUnicodeChar, eHTMLKeyModifiers);
		}
		public static void SetHorizontalScroll(HHTMLBrowser unBrowserHandle, uint32 nAbsolutePixelScroll)
		{
			_iface.SetHorizontalScroll(unBrowserHandle, nAbsolutePixelScroll);
		}
		public static void SetVerticalScroll(HHTMLBrowser unBrowserHandle, uint32 nAbsolutePixelScroll)
		{
			_iface.SetVerticalScroll(unBrowserHandle, nAbsolutePixelScroll);
		}
		public static void SetKeyFocus(HHTMLBrowser unBrowserHandle, bool bHasKeyFocus)
		{
			_iface.SetKeyFocus(unBrowserHandle, bHasKeyFocus);
		}
		public static void ViewSource(HHTMLBrowser unBrowserHandle)
		{
			_iface.ViewSource(unBrowserHandle);
		}
		public static void CopyToClipboard(HHTMLBrowser unBrowserHandle)
		{
			_iface.CopyToClipboard(unBrowserHandle);
		}
		public static void PasteFromClipboard(HHTMLBrowser unBrowserHandle)
		{
			_iface.PasteFromClipboard(unBrowserHandle);
		}
		public static void Find(HHTMLBrowser unBrowserHandle, StringView pchSearchStr, bool bCurrentlyInFind, bool bReverse)
		{
			_iface.Find(unBrowserHandle, TerminateString!(pchSearchStr), bCurrentlyInFind, bReverse);
		}
		public static void StopFind(HHTMLBrowser unBrowserHandle)
		{
			_iface.StopFind(unBrowserHandle);
		}
		public static void GetLinkAtPosition(HHTMLBrowser unBrowserHandle, int32 x, int32 y)
		{
			_iface.GetLinkAtPosition(unBrowserHandle, x, y);
		}
		public static void SetCookie(StringView pchHostname, StringView pchKey, StringView pchValue, StringView pchPath, RTime32 nExpires, bool bSecure, bool bHTTPOnly)
		{
			_iface.SetCookie(TerminateString!(pchHostname), TerminateString!(pchKey), TerminateString!(pchValue), TerminateString!(pchPath), nExpires, bSecure, bHTTPOnly);
		}
		public static void SetPageScaleFactor(HHTMLBrowser unBrowserHandle, float flZoom, int32 nPointX, int32 nPointY)
		{
			_iface.SetPageScaleFactor(unBrowserHandle, flZoom, nPointX, nPointY);
		}
		public static void SetBackgroundMode(HHTMLBrowser unBrowserHandle, bool bBackgroundMode)
		{
			_iface.SetBackgroundMode(unBrowserHandle, bBackgroundMode);
		}
		public static void SetDPIScalingFactor(HHTMLBrowser unBrowserHandle, float flDPIScaling)
		{
			_iface.SetDPIScalingFactor(unBrowserHandle, flDPIScaling);
		}
		public static void OpenDeveloperTools(HHTMLBrowser unBrowserHandle)
		{
			_iface.OpenDeveloperTools(unBrowserHandle);
		}
		public static void AllowStartRequest(HHTMLBrowser unBrowserHandle, bool bAllowed)
		{
			_iface.AllowStartRequest(unBrowserHandle, bAllowed);
		}
		public static void JSDialogResponse(HHTMLBrowser unBrowserHandle, bool bResult)
		{
			_iface.JSDialogResponse(unBrowserHandle, bResult);
		}
		public static void FileLoadDialogResponse(HHTMLBrowser unBrowserHandle, char8** pchSelectedFiles)
		{
			_iface.FileLoadDialogResponse(unBrowserHandle, pchSelectedFiles);
		}
	}
}