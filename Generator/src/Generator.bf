using System;
using System.IO;

using JSONReader;
using System.Collections;
namespace Generator
{
	class InterfaceInfo
	{
		public enum EIntefaceType
		{
			Unknown = 0x00,
			User = 0x01,
			Server = 0x02
		}

		public class MethodInfo
		{
			public StringView name;
			public (String name, TypeInfo info) result;
			public List<(StringView name, String type, TypeInfo info)> args =  new .() ~ delete _;

			public ~this()
			{
				delete result.name;

				for(let a in args)
					delete a.type;
			}
		}

		public StringView name;
		public StringView[2] accessors;
		public EIntefaceType type;
		public List<MethodInfo> methods = new .() ~ delete _;
		public Dictionary<String, String> generatedEnums ~ delete _;
		public ~this()
		{
			for(let m in methods)
				delete m;
		}
	}

	class Generator
	{
		const bool TRANSFORM_ENUM_VALUE_NAMES = true;
		const String DEFAULT_NAMESPACE = "Steamworks";

		static HashSet<String> builtinTypes = new .()
		{
			"int8",
			"uint8",
			"int16",
			"uint16",
			"int32",
			"uint32",
			"int64",
			"uint64",

			// These types are not built-in but are handled by TypeParser

			"lint64",
			"ulint64",
			"intp",
			"uintp",

			"intptr_t",
			"uintptr_t",
			"size_t",
		} ~ delete _;

		static void AppendHeader(String buffer, StringView usings = default, StringView _namespace = default)
		{
			buffer.AppendF
				($"""
using System;
{usings}
namespace {(_namespace.IsEmpty ? DEFAULT_NAMESPACE : _namespace)}
{{

""");
		}

		static void AppendFooter(String buffer)
		{
			buffer.Append("\n}");
		}

		static String GenerateConstants(JArray constants, HashSet<String> generatedTypedefs)
		{
			String buf = new .();
			AppendHeader(buf);

			buf.Append("\tpublic static\n");
			buf.Append("\t{\n");

			for (let c in constants)
			{
				JObject obj = c.AsObject;
				String name = obj["constname"].Value.AsString;
				String type = obj["consttype"].Value.AsString;
				String value = obj["constval"].Value.AsString;

				String bfType = scope .(32);
				switch (TypeParser.ParseType(type, bfType, null, ?))
				{
				case .Success_Type: break;
				case .Error, .Success_Function:
					Console.WriteLine($"GenerateConstants - unexpected result while parsing constant type ({_}). Skipping: '{name}'");
					continue;
				}

				bool needsCast = generatedTypedefs?.Contains(bfType) ?? false;

				StringView v = value;
				if(v.EndsWith("ull", .OrdinalIgnoreCase))
					v.RemoveFromEnd(3);
				if(v.EndsWith("ll", .OrdinalIgnoreCase))
					v.RemoveFromEnd(2);
				if(v.EndsWith("ul", .OrdinalIgnoreCase))
					v.RemoveFromEnd(2);

				if(bfType == "int32" && value.CompareTo("0xFFFFFFFF", true) == 0)
				{
					v = "(int32)0xFFFFFFFF";
				}

				StringView cast = (needsCast ? "(.)" : "");

				buf.AppendF($"\t\tpublic const {bfType} {name} = {cast}{v};\n");
				if(needsCast  && name.EndsWith("Invalid", .OrdinalIgnoreCase))
				{
					buf.AppendF($"\t\textension {bfType} {{ public const Self Invalid = {cast}{v}; }}\n");
				}
			}

			buf.Append("\t}\n");

			AppendFooter(buf);
			return buf;
		}

		static int CreateEnumNameTransforms(String enumName, List<String> output)
		{
			int count = 0;
			int uppercaseStart = -1;

			void Add(StringView name)
			{
				if (count < output.Count)
					output[count].Set(name);
				else
					output.Add(new .(name));

				count++;
				uppercaseStart = -1;
			}

			int lastPos = 0;


			List<String> tmp = scope .();
			void AddTmp(StringView name)
			{
				if(lastPos != 0)
					tmp.Add(new .(name));
			}	

			char8 lc = 0;
			int i;
			for (i = 0; i < enumName.Length;)
			{
				let c = enumName[i];

				if(c == '_')
				{
					AddTmp(StringView(enumName, 0, i));
					Add(StringView(enumName, lastPos, i - lastPos));

					lastPos = i +1;
				}

				if(c.IsUpper)
				{
					if(lc.IsLower)
					{
						AddTmp(StringView(enumName, 0, i));
						Add(StringView(enumName, lastPos, i - lastPos));
						lastPos = i;
					}

					if(uppercaseStart == -1)
						uppercaseStart = i;
				}

				if(c.IsLower)
				{
					if(uppercaseStart != -1  && i - uppercaseStart >= 2)
					{
						AddTmp(StringView(enumName, 0, i - 1));
						Add(StringView(enumName, uppercaseStart, i - uppercaseStart - 1));
						lastPos = i-1;
					}
					if(uppercaseStart != i)
						uppercaseStart = -1;
				}

				lc = c;
				i++;
			}

			if(lastPos != 0 && lastPos < i)
			{
				Add(StringView(enumName, lastPos, i - lastPos));
			}

			let maxcount = count;

			for(i = 0; i < maxcount; i++)
			{
				for(int j = 0; j < maxcount; j++)
				{
					if( i == j )
						continue;

					Add(scope $"{output[i]}{output[j]}");
				}
				
			}

			for(let n in tmp)
			{
				Add(n);
				delete n;
			}

			if(enumName.EndsWith("Flags"))
			{
				Add("Flag");
				let withoutFlags = Add( .. enumName.Substring(0, enumName.Length - "Flags".Length));
				Add(scope $"{withoutFlags}Flag");
			}	

			if(enumName.EndsWith("Kind"))
				Add(enumName.Substring(0, enumName.Length - "Kind".Length));

			if(enumName.EndsWith("Modifiers", .OrdinalIgnoreCase))
				Add(enumName.Substring(0, enumName.Length - 1));

			let sorter = Sorter<String, void>(output.Ptr, null, count, scope (l, r) => l.Length <=> r.Length);
			sorter.[Friend]Sort(0, count);

			return count;
		}

		static void GetEnumValueName(StringView enumName, StringView valueName, Span<String> transforms, String buffer)
		{
			StringView name = valueName;

			bool isk_n = false;
			bool removedE = false;

			if(name.StartsWith("k_"))
			{
				if(name[2] == 'n')
				{
					name = name.Substring(3);
					isk_n = true;
				}
				else if(name[2] == 'e')
				{
					name = name.Substring(3);
					removedE = true;
				}
				else
				{
					name = name.Substring(2);
				}
			}

			if(isk_n && name.StartsWith(enumName.Substring(1), .OrdinalIgnoreCase))
			{
				name = name.Substring(enumName.Length - 1);
			}
			else if (name.StartsWith(enumName, .OrdinalIgnoreCase))
			{
				name = name.Substring(enumName.Length);
			}
			else
			{
				bool startsWithE = name.StartsWith('E');
				int32 itCount = 2;
				MAIN_LOOP: while(itCount > 0)
				{
					for (int i = transforms.Length - 1; i >= 1; i--)
					{
						StringView newName;
						FOUND_MATCH: do
						{
							if (name.StartsWith(transforms[i], .OrdinalIgnoreCase))
							{
								newName = name.Substring(transforms[i].Length);

								break FOUND_MATCH;
							}
							else if (removedE)
							{
								if(name.StartsWith(transforms[i].Substring(1), .OrdinalIgnoreCase))
								{
									newName = name.Substring(transforms[i].Length - 1);
									break FOUND_MATCH;
								}
								
							}
							else if (startsWithE)
							{
								if(name.Substring(1).StartsWith(transforms[i], .OrdinalIgnoreCase))
								{
									newName = name.Substring(transforms[i].Length + 1);
									break FOUND_MATCH;
								}
							}
							continue;
						}

						if(newName.Length <= 2)
							break MAIN_LOOP;

						name = newName;

						if(i >= (int)(transforms.Length / 1.25f))
							break MAIN_LOOP;

						itCount--;
						continue MAIN_LOOP;
					}
					break MAIN_LOOP;
				}
				
			}

			while (name.StartsWith('_'))
			{
				name = name.Substring(1);
			}

			if(name[0] == 'e')
				name = name.Substring(1);

			buffer.Clear();
			if (name[0].IsDigit)
			{
				buffer.Append("_");
			}
			buffer.Append(name);
		}

		static String GenerateEnums(JArray enums)
		{
			String buf = new .();
			AppendHeader(buf);
			StructGenerateEnums(enums, buf, null, 1);
			AppendFooter(buf);
			return buf;

			/*String valueNameBuffer = scope .(96);
			List<String> enumValueNameTransforms = scope .();
			int transformsCount = ?;

			for (let e in enums)
			{
				JObject obj = e.AsObject;
				String enumname = obj["enumname"].Value.AsString;
				JArray values = obj["values"].Value.AsArray;
				buf.AppendF($"\tpublic enum {enumname} : int32\n\t{{\n");

				if (TRANSFORM_ENUM_VALUE_NAMES)
					transformsCount = CreateEnumNameTransforms(enumname, enumValueNameTransforms);

				for (let v in values)
				{
					JObject vo = v.AsObject;
					String vn = vo["name"].Value.AsString;
					String val = vo["value"].Value.AsString;

					StringView name;

					if(TRANSFORM_ENUM_VALUE_NAMES)
					{
						GetEnumValueName(enumname, vn, .(enumValueNameTransforms.Ptr, transformsCount), valueNameBuffer);
						name = valueNameBuffer;
					}
					else
						name = vn;

					if(name.Equals("Force32Bit", true))
						continue;

					buf.AppendF($"\t\t{name} = {val},\n");

				}
				buf.Append("\t}\n\n");
			}

			AppendFooter(buf);
			for(let v in enumValueNameTransforms)
			{
				delete v;
			}	
			return buf;*/
		}

		static String GenerateTypedefs(JArray typedefs, HashSet<String> generatedTypedefs)
		{
			String buf = new .();
			AppendHeader(buf);

			for(let td in typedefs)
			{
				JObject obj = td.AsObject;
				String name = obj["typedef"].Value.AsString;
				if(builtinTypes.Contains(name))
				{
					continue;
				}
				String type = obj["type"].Value.AsString;
				String buffer = scope .(64);
				String argsBuffer = scope .(128);

				let result = TypeParser.ParseType(type, buffer, argsBuffer, let typeInfo);
				switch(result)
				{
				case .Success_Type:
					{
						if(typeInfo.typeCode == .Integer && typeInfo.arraySize == 0 && (name.StartsWith('H') || name.EndsWith("_t") || name.EndsWith("Handle")))
						{
							buf.AppendF($"\tpublic struct {name} : {buffer} {{}}\n");
							generatedTypedefs.Add(name);
						}
						else
						{
							buf.AppendF($"\tpublic typealias {name} = {buffer};\n");
						}

					}
				case .Success_Function:
					buf.AppendF($"\tpublic function {buffer} {name}({argsBuffer});\n");

				case .Error:
					Console.WriteLine("Error while parsing typedef.");
				}
			}

			AppendFooter(buf);
			return buf;
		}

		static void StructGenerateFields(JArray fields, String buffer, Dictionary<String, String> generatedEnums)
		{
			for(let f in fields)
			{
				JObject fo = f.AsObject;
				String name = fo["fieldname"].Value.AsString;
				String type = fo["fieldtype"].Value.AsString;
				bool isPrivate;
				switch(fo["private"])
				{
				case .Ok(let val): isPrivate = val.AsBool.Value;
				case .Err: isPrivate = false;
				}

				if(generatedEnums != null && generatedEnums.TryGetValue(type, let v))
				{
					buffer.Append("\t\t");
					buffer.Append(isPrivate ? "private": "public");

					buffer.AppendF($" {v} {name};\n");
					continue;
				}

				String beefType = scope .(); 
				String beefTypeArgs = scope .();
				switch(TypeParser.ParseType(type, beefType, beefTypeArgs, ?))
				{
				case .Success_Type:
					{
						buffer.Append("\t\t");
						buffer.Append(isPrivate ? "private": "public");

						StringView newName = name;
						if(!isPrivate && newName.StartsWith("m_"))
						{
							newName = newName.Substring(2);
						}


						buffer.AppendF($" {beefType} {newName};\n");
					}

				case .Success_Function:
					{
						buffer.Append("\t\t");
						buffer.Append(isPrivate ? "private": "public");
						buffer.AppendF($" function {beefType} ({beefTypeArgs}) {name};\n");
					}
				case .Error:
					{
						Console.WriteLine("StructGenerateFields - error while parsing type TypeParser.ParseType");
					}
				}
			}
		}

		static void ParseArgs(JArray _params, String buffer)
		{
			int count = 0;
			for(let p in _params)
			{
				JObject obj = p.AsObject;
				String name = obj["paramname"].Value.AsString;
				String type = obj["paramtype"].Value.AsString;

				String bfType = scope .(64);
				switch(TypeParser.ParseType(type, bfType, null, ?))
				{
				case .Success_Type:
					buffer.AppendF($"{bfType} {name},");

				default:
					Console.WriteLine($"ParseArgs - unexpected result from TypeParser.ParseType while parsing parameter type. {_}");
					continue;
				}

				count++;
			}
			if(count != 0)
				buffer.RemoveFromEnd(1);
		}


		static void StructGenerateMethods(JArray methods, String buffer)
		{
			for(let f in methods)
			{
				JObject obj = f.AsObject;
				String name = obj["methodname"].Value.AsString;
				String flatname = obj["methodname_flat"].Value.AsString;
				JArray _params = obj["params"].Value.AsArray;
				String resultType = obj["returntype"].Value.AsString;

				// @TODO - implement operator overloading
				if(name.Contains("operator"))
					continue;

				String beefRetT = scope .();
				switch(TypeParser.ParseType(resultType, beefRetT, null, ?))
				{
				case .Success_Type:
					{
						String pBuffer = scope .(128);
						ParseArgs(_params, pBuffer);
						buffer.AppendF($"\t\t[LinkName(\"{flatname}\")] \n\t\tpublic extern {beefRetT} {name}({pBuffer});\n");
					}

				default:
					{
						Console.WriteLine($"StructGenerateMethods - unexpected result from TypeParser.ParseType while parsing return type. {_}");
						continue;
					}
				}
			}
		}

		static void StructGenerateEnums(JArray enums, String buffer, Dictionary<String, String> generatedEnums, int indent)
		{
			String tab = scope .('\t', indent);

			List<String> transforms = scope .();
			int count = ?;
			defer
			{
				for(let t in transforms)
					delete t;
			}

			for(let e in enums)
			{
				JObject obj = e.AsObject;

				String enumName = obj["enumname"].Value.AsString;
				if(generatedEnums != null && obj["fqname"] case .Ok(let val))
				{
					String fqname = val.AsString;
					generatedEnums.Add(fqname, enumName);
				}

				if (TRANSFORM_ENUM_VALUE_NAMES)
					count = CreateEnumNameTransforms(enumName, transforms);

				JArray values = obj["values"].Value.AsArray;

				StringView underlyingType = "int32";

				buffer.AppendF($"{tab}public enum {enumName} : {(underlyingType)}\n{tab}{{\n");

				for(let v in values)
				BUFFER_SCOPE: {
					JObject vo = v.AsObject;
					String vn = vo["name"].Value.AsString;
					String vv = vo["value"].Value.AsString;

					StringView name;
					if(TRANSFORM_ENUM_VALUE_NAMES)
					{
						String vnBuffer = scope:BUFFER_SCOPE .(64);
						GetEnumValueName(enumName, vn, .(transforms.Ptr, count), vnBuffer);
						name = vnBuffer;
					}
					else
						name = vn;

					if(name.Equals("Force32Bit", true))
						continue;
					
					buffer.AppendF($"{tab}\t{name} = {vv},\n");
				}

				buffer.AppendF($"{tab}}}\n\n");
			}	
		}	

		static String GenerateStructs(JArray structs)
		{
			String buf = new .();
			AppendHeader(buf);

			for(let s in structs)
			{
				JObject obj = s.AsObject;
				String name = obj["struct"].Value.AsString;

				buf.AppendF($"\t[CRepr]\n\tpublic struct {name}\n\t{{\n");

				if(obj["fields"] case .Ok(let fields))
				{
					StructGenerateFields(fields.AsArray, buf, null);
				}
				
				if(obj["methods"] case .Ok(let methods))
				{
					StructGenerateMethods(methods.AsArray, buf);
				}
				
				buf.Append("\t}\n");
			}

			AppendFooter(buf);
			return buf;
		}

		static String GenerateCallbackStructs(JArray structs)
		{
			String buf = new .();
			AppendHeader(buf);

			for(let s in structs)
			{
				JObject obj = s.AsObject;
				String name = obj["struct"].Value.AsString;
				int64 callbackid = obj["callback_id"].Value.AsInt64;
				JArray fields = obj["fields"].Value.AsArray;

				buf.AppendF($"\t[CRepr]\n\tpublic struct {name} : ICallbackStruct\n\t{{\n");

				buf.AppendF($"\t\tpublic const int32 CALLBACK_ID = {callbackid};\n");
				buf.AppendF($"\t\tpublic static int32 CallbackId => CALLBACK_ID;\n");

				Dictionary<String, String> generatedEnums = null;
				if(obj["enums"] case .Ok(let v))
				{
					generatedEnums = scope:: .();
					StructGenerateEnums(v.AsArray, buf, generatedEnums, 2);
				}

				StructGenerateFields(fields, buf, generatedEnums);

				buf.Append("\t}\n\n");
			}

			AppendFooter(buf);
			return buf;
		}

		static void GenerateInterfaceMethods(JArray methods, String buffer, bool interfaceOnly, List<InterfaceInfo.MethodInfo> minfo)
		{
			bool generateMInfo = minfo != null;
			for(let m in methods)
			{
				JObject obj = m.AsObject;
				String name = obj["methodname"].Value.AsString;
				String flatname = obj["methodname_flat"].Value.AsString;
				JArray prms = obj["params"].Value.AsArray;
				String rtype = obj["returntype"].Value.AsString;

				String rtypebf = scope .(32);

				InterfaceInfo.MethodInfo info = ?;
				if(generateMInfo)
				{
					info = minfo.Add(.. new .());
					info.name = name;
				}
				

				switch(TypeParser.ParseType(rtype, rtypebf, null, let typeInfo))
				{
				case .Success_Type:
					if(generateMInfo)
						info.result = (new String(rtypebf), typeInfo);
					break;

				case .Success_Function, .Error:
					Console.WriteLine($"GenerateInterfaceMethods rtype - Unexpected result from TypeParser.ParseType ({_}). Method: {name}");
					continue;
				}

				String argsBuf = scope .();
				int count = 0;
				for(let p in prms)
				{
					JObject po = p.AsObject;
					String pname = po["paramname"].Value.AsString;
					String ptype = po["paramtype"].Value.AsString;
					String argBuff = scope .(32);
					switch(TypeParser.ParseType(ptype, argBuff, null, var typeInfo))
					{
					case .Success_Type:
						{
							if(argBuff.StartsWith('I'))
							{
								if(argBuff.EndsWith('*'))
								{
									argBuff.RemoveFromEnd(1);
									typeInfo.pointerDepth--;
								}	

								if(argBuff.EndsWith("Response"))
								{
									argBuff.Set("void*");
								}	
							}

							argsBuf.AppendF($"{argBuff} {pname},");
							count++;

							if(generateMInfo)
								info.args.Add((pname, new String(argBuff), typeInfo));
						}

					case .Success_Function, .Error:
						Console.WriteLine($"GenerateInterfaceMethods - Unexpected result from TypeParser.ParseType ({_}). Method: {name}");
					}
				}
				if(count != 0)
					argsBuf.RemoveFromEnd(1);

				if(interfaceOnly)
				{
					buffer.AppendF($"\t\t{rtypebf} {name}({argsBuf});\n");
				}
				else
				{
					buffer.AppendF($"\t\t[LinkName(\"{flatname}\")]\n\t\tpublic extern {rtypebf} {name}({argsBuf});\n");
				}
			}
		}

		static void GenerateInterfaceAccesors(JArray accessors, String buffer, String interfaceName, InterfaceInfo info)
		{
			for(let a in accessors)
			{
				JObject obj = a.AsObject;
				String kind = obj["kind"].Value.AsString;

				String name = obj["name"].Value.AsString;
				String flatname = obj["name_flat"].Value.AsString;

				if(kind.CompareTo("user") == 0)
				{
					info.accessors[0] = name;
					info.type |= .User;
				}
				if(kind.CompareTo("gameserver") == 0)
				{
					info.accessors[1] = name;
					info.type |= .Server;
				}

				buffer.AppendF($"\t\t[LinkName(\"{flatname}\")]\n\t\tpublic static extern {interfaceName} {name}();\n");
			}	
		}

		static void GeneratePlainInterface(String name, JObject interfaceObj, String buffer)
		{
			buffer.AppendF($"\tpublic interface {name}\n\t{{\n");
			GenerateInterfaceMethods(interfaceObj["methods"].Value.AsArray, buffer, true, null);
			buffer.Append("\t}\n");
		}
		
		static String GenerateInterfaces(JArray interfaces, List<InterfaceInfo> infos)
		{
			String buf = new .();
			AppendHeader(buf, default, scope $"{DEFAULT_NAMESPACE}.Interfaces");

			String accessors = scope .();
			
			for(let s in interfaces)
			{
				JObject obj = s.AsObject;
				String name = obj["classname"].Value.AsString;

				// These interfaces are for retrieving responses from steam and can't be implemented directly in beef
				if(name.EndsWith("Response"))
				{
					GeneratePlainInterface(name, obj, buf);
					continue;
				}

				buf.AppendF($"\tpublic struct {name} : uint\n\t{{\n");

				InterfaceInfo info = new .();
				info.name = name;

				if(obj["enums"] case .Ok(let val))
				{
					info.generatedEnums = new .();
					StructGenerateEnums(val.AsArray, buf, info.generatedEnums, 2);
				}

				if(obj["fields"] case .Ok(let val))
				{
					StructGenerateFields(val.AsArray, buf, null);
				}

				
				if(obj["accessors"] case .Ok(let val))
				{
					GenerateInterfaceAccesors(val.AsArray, accessors, name, info);
				}
				else
				{
					Console.WriteLine($"Interface '{name}' doesn't have an accessor method!");
				}
				if(info.type == .Unknown)
				{
					delete info;
					info = null;
				}
				else
				{
					infos.Add(info);
				}

				GenerateInterfaceMethods(obj["methods"].Value.AsArray, buf, false, info?.methods);
				
				buf.Append("\t}\n");
			}

			buf.AppendF($"\tpublic static class Accessors\n\t{{\n{accessors}\t}}\n");

			AppendFooter(buf);
			return buf;
		}

		const String IFACE_FIELDNAME = "_iface";

		static void GenerateInterfaceWrapperMethod(String buffer, InterfaceInfo interfaceInfo, InterfaceInfo.MethodInfo mi)
		{
			const bool GENERATE_OUT_PARAMS = true;

			String methodBody = scope .(128);
			String args = scope .(128);
			String callBody = scope .(128);

			buffer.Append("\t\t");
			StringView resultType = mi.result.name;

			if(resultType == "SteamAPICall_t")
			{
				buffer.Append("[NoDiscard]\n\t\t");
			}

			bool hasReturnType = mi.result.info.typeCode != .Void;

			bool dontOutNextParam = false;

			for(let a in mi.args)
			{
				bool dontOutNextParamSetThisLoop = false;

				defer
				{
					if(!dontOutNextParamSetThisLoop)
						dontOutNextParam = false;
				}

				StringView argName = a.name;
				StringView argType = a.type;

				if(a.info.pointerDepth == 1)
				{
					if(a.info.isConst)
					{
						if(a.info.typeCode == .Character)
						{
							args.AppendF($"StringView {argName}, ");
							callBody.AppendF($"TerminateString!({argName}), ");
							continue;
						}
					}
					else if(GENERATE_OUT_PARAMS)
					{
						switch(a.info.typeCode)
						{
						case .Boolean, .Floating, .Integer:
							{
								if(dontOutNextParam)
								{
									argType.RemoveFromEnd(1);
									args.AppendF($"ref {argType} {argName}, ");
									callBody.AppendF($"&{argName}, ");
									dontOutNextParam = false;
									continue;
								}

								let index = @a.Index + 1;
								if(index < mi.args.Count)
								{
									if(mi.args[index].name.Equals("cubData"))
									{
										dontOutNextParam = dontOutNextParamSetThisLoop = true;
										break;
									}
								}

								if(argName.Contains("Dest") || argName.Contains("Buffer"))
								{
									dontOutNextParam = dontOutNextParamSetThisLoop = true;
									break;
								}	

								argType.RemoveFromEnd(1);
								args.AppendF($"out {argType} {argName}, ");
								callBody.AppendF($"&{argName}, ");
								methodBody.AppendF($"\t\t\t{argName} = ?;\n");
								continue;
							}

						case .Character:
							{
								dontOutNextParam = dontOutNextParamSetThisLoop = true;
								break;
							}
						case .Custom, .Void, .Unknown:
							{
								if(argName.Contains("Dest") || argName.Contains("Buffer"))
									dontOutNextParam = dontOutNextParamSetThisLoop = true;

								break;

							}
						}
					}
				}

				if(a.info.isReference && !a.info.isConst)
					callBody.Append("ref ");

				if(interfaceInfo.generatedEnums != null && argType.StartsWith('E'))
				{
					for(let ge in interfaceInfo.generatedEnums.Values)
					{
						if(ge == argType)
						{
							args.AppendF($"{interfaceInfo.name}.");
							break;
						}
					}
				}

				args.AppendF($"{argType} {argName}, ");
				callBody.Append(argName);
				callBody.Append(", ");
			}

			if(!args.IsEmpty)
				args.RemoveFromEnd(2);

			if(!callBody.IsEmpty)
				callBody.RemoveFromEnd(2);


			if(mi.result.info.typeCode == .Character && mi.result.info.pointerDepth == 1)
			{
				buffer.AppendF($"public static StringView {mi.name}({args})\n\t\t{{\n{methodBody}\t\t\treturn StringView({IFACE_FIELDNAME}.{mi.name}({callBody}));\n\t\t}}\n");
				return;
			}

			buffer.AppendF($"public static {mi.result.name} {mi.name}({args})\n\t\t{{\n{methodBody}\t\t\t{(hasReturnType ? "return " : "")}{IFACE_FIELDNAME}.{mi.name}({callBody});\n\t\t}}\n");
		}

		static void GenerateInterfaceWrappers(String outDirPath, String buf, List<InterfaceInfo> infos)
		{
			String userWrappers = scope .();
			String serverWrappers = scope .();

			for(let info in infos)
			{
				buf.Clear();
				AppendHeader(buf, "using Steamworks;\nusing Steamworks.Interfaces;\nusing internal Steamworks;");
				StringView name = info.name;
				if(name[0] == 'I')
					name = name.Substring(1);

				// We have a custom implementation for this interface
				if(name == "SteamMatchmakingServers")
				{
					userWrappers.AppendF($"CheckResult!({name}.APIInit_User());\n");
					continue;
				}
					
				buf.AppendF($"\tpublic static class {name}\n\t{{\n");

				buf.AppendF($"\t\tstatic {info.name} {IFACE_FIELDNAME};\n");
				if(info.type.HasFlag(.User))
				{
					userWrappers.AppendF($"CheckResult!({name}.APIInit_User());\n");
					buf.AppendF($"\t\tinternal static bool APIInit_User() => (_iface = Accessors.{info.accessors[0]}()) != 0;\n");
				}
				if(info.type.HasFlag(.Server))
				{
					serverWrappers.AppendF($"CheckResult!({name}.APIInit_Server());\n");
					buf.AppendF($"\t\tinternal static bool APIInit_Server() => (_iface = Accessors.{info.accessors[1]}()) != 0;\n");
				}	

				for(let mi in info.methods)
				{
					GenerateInterfaceWrapperMethod(buf, info, mi);
				}

				buf.Append("\t}");
				AppendFooter(buf);
				let path = Path.InternalCombine(.. scope .(), outDirPath, "Wrappers", scope $"{name}.bf");
				File.WriteAllText(path, buf);
			}

		}

		public static Result<void> GenerateFromJObject(JObject json, String outDirPath)
		{
			if ((Directory.CreateDirectory(outDirPath) case .Err(let err)) && err != .AlreadyExists)
			{
				Console.WriteLine("Couldn't create output directory!");
				return .Err;
			}

			HashSet<String> generatedTypedefs = scope .();
			// TYPEDEFS
			{
				let typedefs = GenerateTypedefs(json["typedefs"].Value.AsArray, generatedTypedefs);
				File.WriteAllText(Path.InternalCombine(.. scope .(), outDirPath, "Typedefs.bf"), typedefs);
				delete typedefs;
			}

			// CONSTANTS
			{
				let constants = GenerateConstants(json["consts"].Value.AsArray, generatedTypedefs);
				File.WriteAllText(Path.InternalCombine(.. scope .(), outDirPath, "Constants.bf"), constants);
				delete constants;
			}

			// ENUMS
			{
				let enums = GenerateEnums(json["enums"].Value.AsArray);
				File.WriteAllText(Path.InternalCombine(.. scope .(), outDirPath, "Enums.bf"), enums);
				delete enums;
			}

			// STRUCTS
			{
				let structs = GenerateStructs(json["structs"].Value.AsArray);
				File.WriteAllText(Path.InternalCombine(.. scope .(), outDirPath, "Structs.bf"), structs);
				delete structs;
			}

			// CALLBACK STRUCTS
			{
				let structs = GenerateCallbackStructs(json["callback_structs"].Value.AsArray);
				File.WriteAllText(Path.InternalCombine(.. scope .(), outDirPath, "CallbackStructs.bf"), structs);
				delete structs;
			}

			// INTEFACES
			{
				List<InterfaceInfo> infos = scope .();
				let interfaces = GenerateInterfaces(json["interfaces"].Value.AsArray, infos);
				File.WriteAllText(Path.InternalCombine(.. scope .(), outDirPath, "Interfaces.bf"), interfaces);

				GenerateInterfaceWrappers(outDirPath, interfaces, infos);
				for(let ii in infos)
					delete ii;

				delete interfaces;

			}


			return .Ok;
		}
	}
}
