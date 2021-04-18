using System;
using System.Collections;
namespace Generator
{
	public struct TypeInfo
	{
		public enum ESigned
		{
			Undefined,
			Signed,
			Unsigned
		}

		public enum ETypeCode
		{
			Unknown,
			Void,
			Boolean,
			Character,
			Integer,
			Floating,
			Custom
		}

		public ESigned signed;
		public bool isConst;
		public int8 pointerDepth;
		public bool isReference;
		public int32 arraySize;
		public ETypeCode typeCode;
		public StringView resolvedTypeName;
	}

	public struct FunctionInfo : IDisposable
	{
		public TypeInfo returnType;
		public String name;
		public List<TypeInfo> args;

		public void Dispose()
		{
			delete name;
			delete args;
		}
	}

	class TypeParser
	{
		enum Token
		{
			case Unknown(char8);
			case Pointer;
			case Reference;
			case Const;
			case Unsigned;
			case Signed;

			case Char;
			case Short;
			case Int;
			case Long;
			case Float;
			case Double;

			case Identifier(StringView kw);
			case ArrayStart;
			case ArrayEnd;
			case Integer(int val);

			case LeftParen;
			case RightParen;
			case Comma;
			case ScopeResolution;
		}

		/// Returns true if it reaches end of the text
		static bool SkipWhitespace(String text, ref int i)
		{
			while (i < text.Length)
			{
				if (!text[i].IsWhiteSpace)
					return false;

				i++;
			}
			return true;
		}

		static StringView ParseIdentifier(String text, ref int i)
		{
			let start = i;
			while (i < text.Length)
			{
				let c = text[i];
				if (!(c.IsLetterOrDigit || c == '_'))
					break;

				i++;
			}
			if (i == start)
				return .();

			return .(text, start, i - start);
		}

		static Token ParseInteger(String text, ref int i)
		{
			int value = 0;

			while (i < text.Length)
			{
				let c = text[i];
				if (!c.IsDigit)
					break;

				value *= 10;
				value += c - '0';

				i++;
			}

			return .Integer(value);
		}

		static Token GetToken(String text, ref int i)
		{
			let c = text[i];
			switch (c)
			{
			case '*': i++; return .Pointer;
			case '[': i++; return .ArrayStart;
			case ']': i++; return .ArrayEnd;
			case '(': i++; return .LeftParen;
			case ')': i++; return .RightParen;
			case ',': i++; return .Comma;
			case '&': i++; return .Reference;
			case ':':
				{
					if(i+1 < text.Length && text[i+1] == ':')
					{
						i += 2;
						return .ScopeResolution;
					}
				}
			}

			if (c.IsDigit)
			{
				return ParseInteger(text, ref i);
			}

			if (!(c.IsLetter || c == '_'))
			{
				return .Unknown;
			}

			let kw = ParseIdentifier(text, ref i);
			if (kw.IsEmpty)
				return .Unknown;

			switch (kw)
			{
			case "unsigned": return .Unsigned;
			case "signed": return .Signed;
			case "const": return .Const;
			case "char": return .Char;
			case "short": return .Short;
			case "int": return .Int;
			case "long": return .Long;
			case "float": return .Float;
			case "double": return .Double;
			}

			return .Identifier(kw);
		}

		public enum ParseTypeResult
		{
			Error,
			Success_Type,
			Success_Function
		}


		static Dictionary<String, String> replaceTypes = new .()
			{
				("int8_t", "int8"),
				("uint8_t", "uint8"),
				("int16_t", "int16"),
				("uint16_t", "uint16"),
				("int32_t", "int32"),
				("uint32_t", "uint32"),
				("int64_t", "int64"),
				("uint64_t", "uint64"),

				("lint64", "int64"),
				("ulint64", "uint64"),
				("intp", "int64"),
				("uintp", "uint64"),

				("intptr_t", "int"),
				("uintptr_t", "uint"),
				("size_t", "uint"),

			} ~ delete _;


		static ParseTypeResult ParseType(String text, ref int i, String typeBuffer, String argNameBuffer, String argsBuffer, bool inFunctionType, out bool shouldContinue, out TypeInfo typeInfo)
		{
			typeInfo = ?;

			TypeInfo info;
			info.isConst = false;
			info.signed = .Undefined;
			info.pointerDepth = 0;
			info.resolvedTypeName = .();
			info.arraySize = 0;
			info.typeCode = .Unknown;
			info.isReference = false;

			String tmp = scope .(64);

			bool isFunction = false;
			shouldContinue = false;

			LOOP:while (!SkipWhitespace(text, ref i))
			{
				let token = GetToken(text, ref i);
				switch (token)
				{
				case .LeftParen:
					{
						if (inFunctionType)
							return .Error;

						isFunction = true;
						break LOOP;
					}

				case .ArrayStart:
					{
						let size = GetToken(text, ref i);
						if (size case .Integer(let val))
							info.arraySize = (int32)val;
						else
							Console.WriteLine($"Unexpected token {size}! Expected integer literal.");

						let t = GetToken(text, ref i);
						if (t != .ArrayEnd)
							Console.WriteLine($"Unexpected token {t}! Expected ']'");
					}
				case .Const:
					{
						if (!tmp.IsEmpty && false)
							Console.WriteLine("Const after identifier!");

						info.isConst = true;
					}
				case .Pointer:
					{
						if (tmp.IsEmpty)
							Console.WriteLine("Pointer before identifier!");
						info.pointerDepth++;
					}

				case .Reference:
					{
						if (tmp.IsEmpty)
							Console.WriteLine("Reference before identifier!");
						if (info.isReference)
							Console.WriteLine("Reference after reference");

						info.isReference = true;
					}

				case .Signed:
					{
						if (!tmp.IsEmpty)
							Console.WriteLine("Signed after identifier!");

						if (info.signed != .Undefined)
							Console.WriteLine("Signed after signed|unsigned !");

						info.signed = .Signed;
					}
				case .Unsigned:
					{
						if (!tmp.IsEmpty)
							Console.WriteLine("Unsigned after identifier!");

						if (info.signed != .Undefined)
							Console.WriteLine("Unsigned after signed|unsigned !");

						info.signed = .Unsigned;
					}
				case .Identifier(let kw):
					{
						if (!tmp.IsEmpty && !inFunctionType)
							Console.WriteLine("Identifier after identifier!");

						if (tmp.IsEmpty)
						{
							tmp.Set(kw);
						}
						else if (inFunctionType)
						{
							argNameBuffer.Set(kw);
							break LOOP;
						}
					}

				case .Char: tmp.Set("char");
				case .Short: tmp.Set("short");
				case .Int: tmp.Set("int");
				case .Long:
					{
						if (tmp.IsEmpty)
							tmp.Set("long");
						else
							tmp.Append(" long");
					}
				case .Float: tmp.Set("float");
				case .Double: tmp.Set("double");


				case .RightParen,.Comma:
					{
						if (inFunctionType)
						{
							if (_ == .Comma)
								shouldContinue = true;

							break LOOP;
						}

						fallthrough;
					}

				case .ScopeResolution:
					{
						// @TODO
						tmp.Clear();
					}

				case .Unknown:
				{
					i++;
					fallthrough;
				}
				case .ArrayEnd, .Integer: Console.WriteLine($"Unexpected token {_}! Expeceted (const, signed, unsigned, char, short, int, long, float, double, '[', '*').");
				}
			}

			if (tmp.IsEmpty)
				return .Error;

			if (replaceTypes.TryGetValue(tmp, let v))
			{
				typeBuffer.Set(v);
			}
			else
			{
				switch (tmp)
				{
				case "void":
					{
						info.typeCode = .Void;
						typeBuffer.Set("void");
					}

				case "bool":
					{
						info.typeCode = .Boolean;
						typeBuffer.Set("bool");
					}

				case "char":
					{
						info.typeCode = .Character;
						switch (info.signed)
						{
						case .Undefined: typeBuffer.Set("char8");
						case .Signed: typeBuffer.Set("int8");
						case .Unsigned: typeBuffer.Set("uint8");
						}
					}
				case "short":
					{
						info.typeCode = .Integer;
						switch (info.signed)
						{
						case .Undefined,.Signed: typeBuffer.Set("int16");
						case .Unsigned: typeBuffer.Set("uint16");
						}
					}
				case "int":
					{
						info.typeCode = .Integer;
						switch (info.signed)
						{
						case .Undefined,.Signed: typeBuffer.Set("int32");
						case .Unsigned: typeBuffer.Set("uint32");
						}
					}
				case "long":
					{
						info.typeCode = .Integer;
						switch (info.signed)
						{
						case .Undefined,.Signed: typeBuffer.Set("int32");
						case .Unsigned: typeBuffer.Set("uint32");
						}
					}
				case "long long":
					{
						info.typeCode = .Integer;
						switch (info.signed)
						{
						case .Undefined,.Signed: typeBuffer.Set("int64");
						case .Unsigned: typeBuffer.Set("uint64");
						}
					}
				case "float":
					{
						info.typeCode = .Floating;
						typeBuffer.Set("float");
					}
				case "double":
					{
						info.typeCode = .Floating;
						typeBuffer.Set("double");
					}
				}
			}
			

			if (typeBuffer.IsEmpty)
			{
				typeBuffer.Set(tmp);
			}

			if (info.isReference)
			{
				if (info.isConst)
					typeBuffer.Insert(0, "in ");
				else
					typeBuffer.Insert(0, "ref ");
			}

			if (info.arraySize > 0)
				typeBuffer.AppendF($"[{info.arraySize}]");
			else
			{
				for (int j = info.pointerDepth; j > 0; j--)
				{
					typeBuffer.Append('*');
				}
			}


			if (isFunction)
			{
				if (!ParseFunctionType(text, ref i, typeBuffer, argsBuffer))
					return .Error;

				return .Success_Function;
			}

			typeInfo = info;
			return .Success_Type;
		}


		public static ParseTypeResult ParseType(String text, String typeBuffer, String argsBuffer, out TypeInfo parsedTypeInfo)
		{
			int i = 0;
			return ParseType(text, ref i, typeBuffer, null, argsBuffer, false, ?, out parsedTypeInfo);
		}

		static bool ParseFunctionType(String text, ref int i, String resultTypeBuffer, String argsBuffer)
		{
			if (GetToken(text, ref i) != .Pointer)
			{
				Console.WriteLine("Expected '*'");
				return false;
			}
			if (GetToken(text, ref i) != .RightParen)
			{
				Console.WriteLine("Expected ')'");
				return false;
			}

			if (GetToken(text, ref i) != .LeftParen)
			{
				Console.WriteLine("Expected '('");
				return false;
			}


			bool cont;
			int argcount = 1;
			repeat
			{
				String argType = scope .(64);
				String argName = scope .(64);
				let result = ParseType(text, ref i, argType, argName, null, true, out cont, ?);
				if (result == .Success_Type)
				{
					if (argName.IsEmpty)
					{
						argName.Set("arg");
						argcount.ToString(argName);
					}

					argsBuffer.AppendF($"{argType} {argName},");

					argcount++;
				}
				else if (cont)
				{
					Console.WriteLine($"Unexpected result from ParseType! {result}");
				}
			}
			while (cont);

			if (argcount != 1)
				argsBuffer.RemoveFromEnd(1);

			return true;
		}
	}
}
