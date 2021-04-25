using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamScreenshots
	{
		static ISteamScreenshots _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamScreenshots()) != 0;
		public static ScreenshotHandle WriteScreenshot(void* pubRGB, uint32 cubRGB, int32 nWidth, int32 nHeight)
		{
			return _iface.WriteScreenshot(pubRGB, cubRGB, nWidth, nHeight);
		}
		public static ScreenshotHandle AddScreenshotToLibrary(StringView pchFilename, StringView pchThumbnailFilename, int32 nWidth, int32 nHeight)
		{
			return _iface.AddScreenshotToLibrary(TerminateString!(pchFilename), TerminateString!(pchThumbnailFilename), nWidth, nHeight);
		}
		public static void TriggerScreenshot()
		{
			_iface.TriggerScreenshot();
		}
		public static void HookScreenshots(bool bHook)
		{
			_iface.HookScreenshots(bHook);
		}
		public static bool SetLocation(ScreenshotHandle hScreenshot, StringView pchLocation)
		{
			return _iface.SetLocation(hScreenshot, TerminateString!(pchLocation));
		}
		public static bool TagUser(ScreenshotHandle hScreenshot, CSteamID steamID)
		{
			return _iface.TagUser(hScreenshot, steamID);
		}
		public static bool TagPublishedFile(ScreenshotHandle hScreenshot, PublishedFileId_t unPublishedFileID)
		{
			return _iface.TagPublishedFile(hScreenshot, unPublishedFileID);
		}
		public static bool IsScreenshotsHooked()
		{
			return _iface.IsScreenshotsHooked();
		}
		public static ScreenshotHandle AddVRScreenshotToLibrary(EVRScreenshotType eType, StringView pchFilename, StringView pchVRFilename)
		{
			return _iface.AddVRScreenshotToLibrary(eType, TerminateString!(pchFilename), TerminateString!(pchVRFilename));
		}
	}
}