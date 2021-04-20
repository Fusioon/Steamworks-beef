using System;

namespace Steam
{
	static
	{
		static internal mixin TerminateString(StringView str)
		{
#if STEAM_AUTO_TERMINATE_STRINGS
			var str;
			if(*(str.Ptr + str.Length) != '\0')
			{
				String tmp = scope:mixin .(str, .NullTerminate);
				str = tmp;
			}
			str.Ptr
#else
			str.Ptr
#endif
		}
	}
}
