using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamMusic
	{
		static ISteamMusic _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamMusic()) != 0;
		public static bool BIsEnabled()
		{
			return _iface.BIsEnabled();
		}
		public static bool BIsPlaying()
		{
			return _iface.BIsPlaying();
		}
		public static AudioPlayback_Status GetPlaybackStatus()
		{
			return _iface.GetPlaybackStatus();
		}
		public static void Play()
		{
			_iface.Play();
		}
		public static void Pause()
		{
			_iface.Pause();
		}
		public static void PlayPrevious()
		{
			_iface.PlayPrevious();
		}
		public static void PlayNext()
		{
			_iface.PlayNext();
		}
		public static void SetVolume(float flVolume)
		{
			_iface.SetVolume(flVolume);
		}
		public static float GetVolume()
		{
			return _iface.GetVolume();
		}
	}
}