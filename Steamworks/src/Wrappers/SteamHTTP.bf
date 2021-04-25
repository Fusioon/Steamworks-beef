using System;
using Steamworks;
using Steamworks.Interfaces;
using internal Steamworks;
namespace Steamworks
{
	public static class SteamHTTP
	{
		static ISteamHTTP _iface;
		internal static bool APIInit_User() => (_iface = Accessors.SteamHTTP()) != 0;
		internal static bool APIInit_Server() => (_iface = Accessors.SteamGameServerHTTP()) != 0;
		public static HTTPRequestHandle CreateHTTPRequest(EHTTPMethod eHTTPRequestMethod, StringView pchAbsoluteURL)
		{
			return _iface.CreateHTTPRequest(eHTTPRequestMethod, TerminateString!(pchAbsoluteURL));
		}
		public static bool SetHTTPRequestContextValue(HTTPRequestHandle hRequest, uint64 ulContextValue)
		{
			return _iface.SetHTTPRequestContextValue(hRequest, ulContextValue);
		}
		public static bool SetHTTPRequestNetworkActivityTimeout(HTTPRequestHandle hRequest, uint32 unTimeoutSeconds)
		{
			return _iface.SetHTTPRequestNetworkActivityTimeout(hRequest, unTimeoutSeconds);
		}
		public static bool SetHTTPRequestHeaderValue(HTTPRequestHandle hRequest, StringView pchHeaderName, StringView pchHeaderValue)
		{
			return _iface.SetHTTPRequestHeaderValue(hRequest, TerminateString!(pchHeaderName), TerminateString!(pchHeaderValue));
		}
		public static bool SetHTTPRequestGetOrPostParameter(HTTPRequestHandle hRequest, StringView pchParamName, StringView pchParamValue)
		{
			return _iface.SetHTTPRequestGetOrPostParameter(hRequest, TerminateString!(pchParamName), TerminateString!(pchParamValue));
		}
		public static bool SendHTTPRequest(HTTPRequestHandle hRequest, SteamAPICall_t* pCallHandle)
		{
			return _iface.SendHTTPRequest(hRequest, pCallHandle);
		}
		public static bool SendHTTPRequestAndStreamResponse(HTTPRequestHandle hRequest, SteamAPICall_t* pCallHandle)
		{
			return _iface.SendHTTPRequestAndStreamResponse(hRequest, pCallHandle);
		}
		public static bool DeferHTTPRequest(HTTPRequestHandle hRequest)
		{
			return _iface.DeferHTTPRequest(hRequest);
		}
		public static bool PrioritizeHTTPRequest(HTTPRequestHandle hRequest)
		{
			return _iface.PrioritizeHTTPRequest(hRequest);
		}
		public static bool GetHTTPResponseHeaderSize(HTTPRequestHandle hRequest, StringView pchHeaderName, out uint32 unResponseHeaderSize)
		{
			unResponseHeaderSize = ?;
			return _iface.GetHTTPResponseHeaderSize(hRequest, TerminateString!(pchHeaderName), &unResponseHeaderSize);
		}
		public static bool GetHTTPResponseHeaderValue(HTTPRequestHandle hRequest, StringView pchHeaderName, uint8* pHeaderValueBuffer, uint32 unBufferSize)
		{
			return _iface.GetHTTPResponseHeaderValue(hRequest, TerminateString!(pchHeaderName), pHeaderValueBuffer, unBufferSize);
		}
		public static bool GetHTTPResponseBodySize(HTTPRequestHandle hRequest, out uint32 unBodySize)
		{
			unBodySize = ?;
			return _iface.GetHTTPResponseBodySize(hRequest, &unBodySize);
		}
		public static bool GetHTTPResponseBodyData(HTTPRequestHandle hRequest, uint8* pBodyDataBuffer, uint32 unBufferSize)
		{
			return _iface.GetHTTPResponseBodyData(hRequest, pBodyDataBuffer, unBufferSize);
		}
		public static bool GetHTTPStreamingResponseBodyData(HTTPRequestHandle hRequest, uint32 cOffset, uint8* pBodyDataBuffer, uint32 unBufferSize)
		{
			return _iface.GetHTTPStreamingResponseBodyData(hRequest, cOffset, pBodyDataBuffer, unBufferSize);
		}
		public static bool ReleaseHTTPRequest(HTTPRequestHandle hRequest)
		{
			return _iface.ReleaseHTTPRequest(hRequest);
		}
		public static bool GetHTTPDownloadProgressPct(HTTPRequestHandle hRequest, out float pflPercentOut)
		{
			pflPercentOut = ?;
			return _iface.GetHTTPDownloadProgressPct(hRequest, &pflPercentOut);
		}
		public static bool SetHTTPRequestRawPostBody(HTTPRequestHandle hRequest, StringView pchContentType, out uint8 pubBody, uint32 unBodyLen)
		{
			pubBody = ?;
			return _iface.SetHTTPRequestRawPostBody(hRequest, TerminateString!(pchContentType), &pubBody, unBodyLen);
		}
		public static HTTPCookieContainerHandle CreateCookieContainer(bool bAllowResponsesToModify)
		{
			return _iface.CreateCookieContainer(bAllowResponsesToModify);
		}
		public static bool ReleaseCookieContainer(HTTPCookieContainerHandle hCookieContainer)
		{
			return _iface.ReleaseCookieContainer(hCookieContainer);
		}
		public static bool SetCookie(HTTPCookieContainerHandle hCookieContainer, StringView pchHost, StringView pchUrl, StringView pchCookie)
		{
			return _iface.SetCookie(hCookieContainer, TerminateString!(pchHost), TerminateString!(pchUrl), TerminateString!(pchCookie));
		}
		public static bool SetHTTPRequestCookieContainer(HTTPRequestHandle hRequest, HTTPCookieContainerHandle hCookieContainer)
		{
			return _iface.SetHTTPRequestCookieContainer(hRequest, hCookieContainer);
		}
		public static bool SetHTTPRequestUserAgentInfo(HTTPRequestHandle hRequest, StringView pchUserAgentInfo)
		{
			return _iface.SetHTTPRequestUserAgentInfo(hRequest, TerminateString!(pchUserAgentInfo));
		}
		public static bool SetHTTPRequestRequiresVerifiedCertificate(HTTPRequestHandle hRequest, bool bRequireVerifiedCertificate)
		{
			return _iface.SetHTTPRequestRequiresVerifiedCertificate(hRequest, bRequireVerifiedCertificate);
		}
		public static bool SetHTTPRequestAbsoluteTimeoutMS(HTTPRequestHandle hRequest, uint32 unMilliseconds)
		{
			return _iface.SetHTTPRequestAbsoluteTimeoutMS(hRequest, unMilliseconds);
		}
		public static bool GetHTTPRequestWasTimedOut(HTTPRequestHandle hRequest, out bool pbWasTimedOut)
		{
			pbWasTimedOut = ?;
			return _iface.GetHTTPRequestWasTimedOut(hRequest, &pbWasTimedOut);
		}
	}
}