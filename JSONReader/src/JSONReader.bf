using System;

using internal JSONReader;

namespace JSONReader
{
	class JSONParser
	{
		const char8 ARRAY_START = '[';
		const char8 ARRAY_END = ']';
		const char8 OBJECT_START = '{';
		const char8 OBJECT_END = '}';

		static void SkipWhitespace(String text, ref int i)
		{
			while (i < text.Length)
			{
				if (!text[i].IsWhiteSpace)
					break;

				i++;
			}
		}

		static public Result<JValue> Parse(String text)
		{
			int i = 0;
			SkipWhitespace(text, ref i);

			if (i >= text.Length)
			{
				return .Err;
			}
			switch (text[i])
			{
			case OBJECT_START:
				{
					i++;
					JObject obj = new .();
					switch (ParseObject(text, ref i, obj))
					{
					case .Ok: return .Ok(.OBJECT(obj));
					case .Err:  delete obj;
					}
				}
			case ARRAY_START:
				{
					i++;
					JArray arr = new .();
					switch (ParseArray(text, ref i, arr))
					{
					case .Ok: return .Ok(.ARRAY(arr));
					case .Err: delete arr;
					}
				}
			}

			return .Err;
		}

		static Result<void> ParseObject(String text, ref int i, JObject target)
		{
			SkipWhitespace(text, ref i);

			LOOP: while (i < text.Length)
			{
				if (ParsePair(text, ref i) case .Ok((let key, let val)))
				{
					target.AddValue(key, val);
				}
				else
					return .Err;

				SkipWhitespace(text, ref i);

				if(i >= text.Length)
					continue;

				switch (text[i])
				{
				case OBJECT_END: i++; return .Ok;
				case ',': i++;
				default: break LOOP;
				}

				SkipWhitespace(text, ref i);
			}

			return .Err;
		}

		static Result<(String key, JValue val)> ParsePair(String text, ref int i)
		{
			SkipWhitespace(text, ref i);
			String key = new .();

			ERROR_CLEANUP:do
			{
				if (ParseString(text, ref i, key) case .Err)
					break ERROR_CLEANUP;

				SkipWhitespace(text, ref i);
				if(i >= text.Length || text[i] != ':')
					break ERROR_CLEANUP;

				i++;

				SkipWhitespace(text, ref i);

				switch (ParseValue(text, ref i))
				{
				case .Ok(let val):
					return .Ok((key, val));

				case .Err:
					break;
				}

				break ERROR_CLEANUP;
			}

			delete key;
			return .Err;
		}

		static Result<void> ParseString(String text, ref int i, String buffer)
		{
			// @TODO - support escaped characters
			SkipWhitespace(text, ref i);
			if (i >= text.Length)
				return .Err;

			if (text[i] != '"')
				return .Err;

			i++;// Skip " char
			char8 lc = 0;
			let start = i;
			while (i < text.Length)
			{
				let c = text[i];

				if (c == '"' && lc != '\\')
					break;

				lc = c;
				i++;
			}

			if (i >= start)
			{
				buffer.Append(text, start, i - start);
				i++;// Skip " char
				return .Ok;
			}

			return .Err;
		}

		static Result<JValue> ParseValue(String text, ref int i)
		{
			SkipWhitespace(text, ref i);
			if (i >= text.Length)
				return .Err;

			let c = text[i];

			switch (c)
			{
			case OBJECT_START:
				{
					i++;
					JObject obj = new .();
					switch (ParseObject(text, ref i, obj))
					{
					case .Ok: return .Ok(.OBJECT(obj));
					case .Err:
						{
							delete obj;
							return .Err;
						}
					}
				}
			case ARRAY_START:
				{
					i++;
					JArray arr = new .();
					switch (ParseArray(text, ref i, arr))
					{
					case .Ok: return .Ok(.ARRAY(arr));
					case .Err:
						{
							delete arr;
							return .Err;
						}
					}
				}
			case '"':
				{
					String str = new .();
					switch (ParseString(text, ref i, str))
					{
					case .Ok: return .Ok(.STRING(str));
					case .Err:
						{
							delete str;
							return .Err;
						}
					}
				}
			}

			if (c.IsDigit || c == '+' || c == '-')
			{
				return ParseNumber(text, ref i);
			}

			let token = GetToken(text, ref i);

			switch (token)
			{
			case "true": return .Ok(.BOOL(true));
			case "false": return .Ok(.BOOL(false));
			case "null": return .Ok(.NULL);
			}

			return .Err;
		}

		static StringView GetToken(String text, ref int i)
		{
			let start = i;
			while (i < text.Length)
			{
				let c = text[i];
				if (!c.IsLetter)
					break;

				i++;
			}

			if (i > start)
				return .(text, start, i - start);

			return StringView();
		}

		static Result<JValue> ParseNumber(String text, ref int i)
		{
			int8 sign = 1;

			switch(text[i])
			{
			case '-': sign = -1; fallthrough;
			case '+': i++;
			default: break;
			}

			var start = i;

			uint64 value = 0;
			bool floating = false;
			VALUE_LOOP: while(i < text.Length)
			{
				let c = text[i];
				if(c.IsDigit)
				{
					value *= 10;
					value += (.)(c - '0');
				}
				else if(c == '.')
				{
					floating = true;
					i++;
					break VALUE_LOOP;
				}
				else
					break VALUE_LOOP;

				i++;
			}

			if(start == i)
				return .Err;

			if(!floating)
				return .Ok(.INT64(sign * (int64)value));

			uint64 decimal = 0;
			bool hasExponent = false;
			start = i;
			DECIMAL_LOOP: while(i < text.Length)
			{
				let c = text[i];
				if(c.IsDigit)
				{
					decimal *= 10;
					decimal += (.)(c - '0');
				}
				else if(c == 'e' || c == 'E')
				{
					hasExponent = true;
					i++;
					break DECIMAL_LOOP;
				}
				else
					break DECIMAL_LOOP;

				i++;
			}

			if(start == i)
				return .Err;

			double doubleVal = decimal;
			while(doubleVal >= 1)
				doubleVal /= 10;

			doubleVal += value;

			if(!hasExponent)
				return .Ok(.DOUBLE(sign + doubleVal));

			bool exponentNegative = false;
			switch(text[i])
			{
			case '-': exponentNegative = true; fallthrough;
			case '+': i++;
			default: break;
			}

			start = i;

			uint64 exponent = 0;

			EXPONENT_LOOP: while(i < text.Length)
			{
				let c = text[i];
				if(c.IsDigit)
				{
					exponent *= 10;
					exponent += (.)(c - '0');
				}
				else
					break EXPONENT_LOOP;

				i++;
			}

			if(start == i)
				return .Err;

			uint64 exponentMult = 1;
			while(--exponent >= 0)
			{
				exponentMult *= 10;
			}	

			if(exponentNegative)
				doubleVal /= exponentMult;
			else
				doubleVal *= exponentMult;

			return .Ok(.DOUBLE(sign * doubleVal));
		}

		static Result<void> ParseArray(String text, ref int i, JArray target)
		{
			SkipWhitespace(text, ref i);

			if(i < text.Length && text[i] == ARRAY_END)
			{
				i++;
				return .Ok;
			}

			LOOP: while(i < text.Length)
			{
				switch(ParseValue(text, ref i))
				{
				case .Ok(let val): target.AddValue(val);
				case .Err:
				}

				SkipWhitespace(text, ref i);

				if(i >= text.Length)
					continue;

				switch(text[i])
				{
				case ARRAY_END: i++; return .Ok;
				case ',': i++;
				default: break LOOP;
				}

				SkipWhitespace(text, ref i);

			}

			return .Err;
		}
	}
}
