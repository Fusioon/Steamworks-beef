using System;
using System.IO;

using JSONReader;
using System.Collections;
namespace Generator
{
	class Generator
	{
		const bool TRANSFORM_ENUM_VALUE_NAMES = true;

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

		static void AppendHeader(String buffer)
		{
			buffer.Append
				("""
using System;

namespace Steamworks
{

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

				buf.AppendF($"\t\tpublic const {bfType} {name} = {(needsCast ? "(.)" : "")}{v};\n");
			}

			buf.Append("\t}\n");

			AppendFooter(buf);
			return buf;
		}

		static int CreateEnumNameTransforms(String enumName, List<String> output)
		{
			int count = 0;

			void Add(StringView name)
			{
				if (count < output.Count)
					output[count].Set(name);
				else
					output.Add(new .(name));

				count++;
			}

			List<String> tmp = scope .();
			void AddTmp(StringView name)
			{
				tmp.Add(new .(name));
			}	

			Add(enumName);

			int lastPos = 0;
			char8 lc = 0;
			int i;
			for (i = 0; i < enumName.Length;)
			{
				let c = enumName[i];
				if ((c.IsUpper || c == '_') && lc.IsLower && i - lastPos >= 2)
				{
					Add(StringView(enumName, lastPos, i - lastPos));
					AddTmp(StringView(enumName, 0, i));
					lastPos = i;
					if (c == '_')
					{
						lastPos++;
					}
				}

				lc = c;
				i++;
			}

			if(lastPos < i)
			{
				Add(StringView(enumName, lastPos, i - lastPos));
			}

			Runtime.Assert(count < 10);

			if(enumName == "ENotificationPosition")
				Console.Write("");

			let maxcount = count;
			
			for(i = 1; i < maxcount; i++)
			{
				if(!output[i].StartsWith("E"))
					Add(scope $"E{output[i]}");

				for(int j = i+1; j < maxcount - 1; j++)
				{
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
				let withoutFlags = Add( .. enumName.Substring(0, enumName.Length - "Flags".Length));
				Add(scope $"{withoutFlags}Flag");
			}	
			if(enumName.EndsWith("Kind"))
				Add(enumName.Substring(0, enumName.Length - "Kind".Length));

			return count;
		}

		static void GetEnumValueName(StringView valueName, List<String> transforms, int count, String buffer, out int matchIndex)
		{
			StringView name = valueName;

			bool isk_n = false;

			if(name.StartsWith("k_n"))
			{
				name = name.Substring(3);
				isk_n = true;
			}
			else if(name.StartsWith("k_"))
				name = name.Substring(2);

			if(name.StartsWith("eE"))	// for EVRHMDType
				name = name.Substring(1);

			if(isk_n && name.StartsWith(transforms[0].Substring(1), .OrdinalIgnoreCase))
			{
				matchIndex = 0;
				name = name.Substring(transforms[0].Length - 1);
			}
			else if (name.StartsWith(transforms[0], .OrdinalIgnoreCase))
			{
				matchIndex = 0;
				name = name.Substring(transforms[0].Length);
			}
			else
			{
				matchIndex = -1;

				for (int i = count - 1; i >= 1; i--)
				{
					if (name.StartsWith(transforms[i], .OrdinalIgnoreCase))
					{
						matchIndex = i;
						name = name.Substring(transforms[i].Length);
						break;
					}
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

		static String GenerateEnums(JArray enums, List<GeneratedEnumInfo> o_enumList)
		{
			String buf = new .();
			AppendHeader(buf);

			String valueNameBuffer = scope .(96);
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

				int currentTransformIndex = 0;

				for (let v in values)
				{
					JObject vo = v.AsObject;
					String vn = vo["name"].Value.AsString;
					String val = vo["value"].Value.AsString;

					StringView name;

					if(TRANSFORM_ENUM_VALUE_NAMES)
					{
						GetEnumValueName(vn, enumValueNameTransforms, transformsCount, valueNameBuffer, let transformMatch);
						name = valueNameBuffer;
						currentTransformIndex = transformMatch;

						if(name == "Force32Bit")
							continue;
					}
					else
						name = vn;

					buf.AppendF($"\t\t{name} = {val},\n");

				}
				buf.Append("\t}\n\n");

				o_enumList.Add(.(enumname));
			}

			AppendFooter(buf);
			for(let v in enumValueNameTransforms)
			{
				delete v;
			}	
			return buf;
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

		static void StructGenerateEnums(JArray enums, String buffer, Dictionary<String, String> generatedEnums)
		{
			List<String> transforms = scope .();
			int count;
			defer
			{
				for(let t in transforms)
					delete t;
			}

			for(let e in enums)
			{
				JObject obj = e.AsObject;

				String enumName = obj["enumname"].Value.AsString;
				String fqname = obj["fqname"].Value.AsString;
				generatedEnums.Add(fqname, enumName);
				count = CreateEnumNameTransforms(enumName, transforms);
				JArray values = obj["values"].Value.AsArray;

				StringView underlyingType = "int32";

				buffer.AppendF($"\t\tpublic enum {enumName} : {(underlyingType)}\n\t\t{{\n");

				for(let v in values)
				{
					JObject vo = v.AsObject;
					String vn = vo["name"].Value.AsString;
					String vv = vo["value"].Value.AsString;

					String vnBuffer = scope .(64);
					GetEnumValueName(vn, transforms, count, vnBuffer, ?);
					buffer.AppendF($"\t\t\t{vnBuffer} = {vv},\n");
				}

				buffer.Append("\t\t}\n");
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
					StructGenerateEnums(v.AsArray, buf, generatedEnums);
				}

				StructGenerateFields(fields, buf, generatedEnums);

				buf.Append("\t}\n\n");
			}

			AppendFooter(buf);
			return buf;
		}

		static void GenerateInterfaceMethods(JArray methods, String buffer)
		{
			for(let m in methods)
			{
				JObject obj = m.AsObject;
				String name = obj["methodname"].Value.AsString;
				String flatname = obj["methodname_flat"].Value.AsString;
				JArray prms = obj["params"].Value.AsArray;
				String rtype = obj["returntype"].Value.AsString;

				String rtypebf = scope .(32);

				switch(TypeParser.ParseType(rtype, rtypebf, null, ?))
				{
				case .Success_Type:
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
					switch(TypeParser.ParseType(ptype, argBuff, null, ?))
					{
					case .Success_Type:
						{
							if(argBuff.StartsWith('I') && argBuff.EndsWith('*'))
							{
								argBuff.RemoveFromEnd(1);
							}

							argsBuf.AppendF($"{argBuff} {pname},");
							count++;
						}

					case .Success_Function, .Error:
						Console.WriteLine($"GenerateInterfaceMethods - Unexpected result from TypeParser.ParseType ({_}). Method: {name}");
					}
				}
				if(count != 0)
					argsBuf.RemoveFromEnd(1);

				buffer.AppendF($"\t\t[LinkName(\"{flatname}\")]\n\t\tpublic extern {rtypebf} {name}({argsBuf});\n");
			}
		}

		static void GenerateInterfaceAccesors(JArray accessors, String buffer, String interfaceName)
		{
			for(let a in accessors)
			{
				JObject obj = a.AsObject;
				String kind = obj["kind"].Value.AsString;
				String name = obj["name"].Value.AsString;
				String flatname = obj["name_flat"].Value.AsString;

				buffer.AppendF($"\t\t[LinkName(\"{flatname}\")]\n\t\tpublic static extern {interfaceName} {name}();\n");
			}	
		}

		static String GenerateInterfaces(JArray interfaces)
		{
			String buf = new .();
			AppendHeader(buf);

			String accessors = scope .();
			
			for(let s in interfaces)
			{
				JObject obj = s.AsObject;
				String name = obj["classname"].Value.AsString;

				buf.AppendF($"\tpublic struct {name} : uint\n\t{{\n");

				if(obj["enums"] case .Ok(let val))
				{
					Dictionary<String, String> generatedEnums = scope .();
					StructGenerateEnums(val.AsArray, buf, generatedEnums);
				}

				if(obj["fields"] case .Ok(let val))
				{
					StructGenerateFields(val.AsArray, buf, null);
				}

				GenerateInterfaceMethods(obj["methods"].Value.AsArray, buf);

				if(obj["accessors"] case .Ok(let val))
				{
					GenerateInterfaceAccesors(val.AsArray, accessors, name);
				}
				else
				{
					Console.WriteLine($"Interface '{name}' doesn't have an accessor method!");
				}

				buf.Append("\t}\n");
			}

			buf.AppendF($"\tpublic static class Accessors\n\t{{\n{accessors}\t}}\n");

			AppendFooter(buf);
			return buf;
		}

		struct GeneratedEnumInfo : IDisposable
		{
			public List<String> validNames;
			public StringView name;

			public this(StringView enumName)
			{
				name = enumName;
				validNames = new .();
			}

			public void Dispose()
			{
				if(validNames != null)
				{
					for(validNames)
						delete _;

					delete validNames;
				}
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

			List<GeneratedEnumInfo> generatedEnums = scope .();
			defer
			{
				for(generatedEnums)
					_.Dispose();
			}
			// ENUMS
			{
				let enums = GenerateEnums(json["enums"].Value.AsArray, generatedEnums);
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
				let interfaces = GenerateInterfaces(json["interfaces"].Value.AsArray);
				File.WriteAllText(Path.InternalCombine(.. scope .(), outDirPath, "Interfaces.bf"), interfaces);
				delete interfaces;
			}


			return .Ok;
		}
	}
}
