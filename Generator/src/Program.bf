using System;
using System.IO;
using System.Collections;

using JSONReader;

namespace Generator
{
	static class Program
	{
		static String jsonInputPath;
		static String outputPath;

		static function void() das;

		static void Main(String[] args)
		{
			if (args.Count < 2)
			{
				Console.WriteLine("Not enough arguments!");
				return;
			}

			jsonInputPath = args[0];
			outputPath = args[1];

			String fileContents = File.ReadAllText(jsonInputPath, .. scope String());
			JValue val = .NULL;
			defer val.Dispose();
			switch (JSONParser.Parse(fileContents))
			{
			case .Ok(out val):
				{
					switch(val)
					{
					case .OBJECT(let v): Generator.GenerateFromJObject(v, outputPath);
					default: Runtime.FatalError();
					}
				}
			case .Err(let err):
				{
					Console.WriteLine("Failed to parse JSON");
					return;
				}
			}
		}
	}
}
