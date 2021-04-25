using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamMusicRemote
	{
		static ISteamMusicRemote _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamMusicRemote()) != 0;
		public static bool RegisterSteamMusicRemote(StringView pchName)
		{
			return _iface.RegisterSteamMusicRemote(TerminateString!(pchName));
		}
		public static bool DeregisterSteamMusicRemote()
		{
			return _iface.DeregisterSteamMusicRemote();
		}
		public static bool BIsCurrentMusicRemote()
		{
			return _iface.BIsCurrentMusicRemote();
		}
		public static bool BActivationSuccess(bool bValue)
		{
			return _iface.BActivationSuccess(bValue);
		}
		public static bool SetDisplayName(StringView pchDisplayName)
		{
			return _iface.SetDisplayName(TerminateString!(pchDisplayName));
		}
		public static bool SetPNGIcon_64x64(void* pvBuffer, uint32 cbBufferLength)
		{
			return _iface.SetPNGIcon_64x64(pvBuffer, cbBufferLength);
		}
		public static bool EnablePlayPrevious(bool bValue)
		{
			return _iface.EnablePlayPrevious(bValue);
		}
		public static bool EnablePlayNext(bool bValue)
		{
			return _iface.EnablePlayNext(bValue);
		}
		public static bool EnableShuffled(bool bValue)
		{
			return _iface.EnableShuffled(bValue);
		}
		public static bool EnableLooped(bool bValue)
		{
			return _iface.EnableLooped(bValue);
		}
		public static bool EnableQueue(bool bValue)
		{
			return _iface.EnableQueue(bValue);
		}
		public static bool EnablePlaylists(bool bValue)
		{
			return _iface.EnablePlaylists(bValue);
		}
		public static bool UpdatePlaybackStatus(AudioPlayback_Status nStatus)
		{
			return _iface.UpdatePlaybackStatus(nStatus);
		}
		public static bool UpdateShuffled(bool bValue)
		{
			return _iface.UpdateShuffled(bValue);
		}
		public static bool UpdateLooped(bool bValue)
		{
			return _iface.UpdateLooped(bValue);
		}
		public static bool UpdateVolume(float flValue)
		{
			return _iface.UpdateVolume(flValue);
		}
		public static bool CurrentEntryWillChange()
		{
			return _iface.CurrentEntryWillChange();
		}
		public static bool CurrentEntryIsAvailable(bool bAvailable)
		{
			return _iface.CurrentEntryIsAvailable(bAvailable);
		}
		public static bool UpdateCurrentEntryText(StringView pchText)
		{
			return _iface.UpdateCurrentEntryText(TerminateString!(pchText));
		}
		public static bool UpdateCurrentEntryElapsedSeconds(int32 nValue)
		{
			return _iface.UpdateCurrentEntryElapsedSeconds(nValue);
		}
		public static bool UpdateCurrentEntryCoverArt(void* pvBuffer, uint32 cbBufferLength)
		{
			return _iface.UpdateCurrentEntryCoverArt(pvBuffer, cbBufferLength);
		}
		public static bool CurrentEntryDidChange()
		{
			return _iface.CurrentEntryDidChange();
		}
		public static bool QueueWillChange()
		{
			return _iface.QueueWillChange();
		}
		public static bool ResetQueueEntries()
		{
			return _iface.ResetQueueEntries();
		}
		public static bool SetQueueEntry(int32 nID, int32 nPosition, StringView pchEntryText)
		{
			return _iface.SetQueueEntry(nID, nPosition, TerminateString!(pchEntryText));
		}
		public static bool SetCurrentQueueEntry(int32 nID)
		{
			return _iface.SetCurrentQueueEntry(nID);
		}
		public static bool QueueDidChange()
		{
			return _iface.QueueDidChange();
		}
		public static bool PlaylistWillChange()
		{
			return _iface.PlaylistWillChange();
		}
		public static bool ResetPlaylistEntries()
		{
			return _iface.ResetPlaylistEntries();
		}
		public static bool SetPlaylistEntry(int32 nID, int32 nPosition, StringView pchEntryText)
		{
			return _iface.SetPlaylistEntry(nID, nPosition, TerminateString!(pchEntryText));
		}
		public static bool SetCurrentPlaylistEntry(int32 nID)
		{
			return _iface.SetCurrentPlaylistEntry(nID);
		}
		public static bool PlaylistDidChange()
		{
			return _iface.PlaylistDidChange();
		}
	}
}