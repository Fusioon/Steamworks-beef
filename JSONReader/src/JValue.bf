using System;
namespace JSONReader
{
	enum JValue : IDisposable
	{
		case NULL;
		case BOOL(bool v);
		case INT64(int64 v);
		case DOUBLE(double v);
		case STRING(String v);
		case ARRAY(JArray v);
		case OBJECT(JObject v);

		public void Dispose()
		{
			switch(this)
			{
			case .STRING(let v): delete v;
			case .ARRAY(let v): delete v;
			case .OBJECT(let v): delete v;

			case .NULL, .BOOL, .INT64, .DOUBLE: break;
			}
		}

		public Result<bool> AsBool
		{
			get
			{
				switch(this)
				{
				case .NULL: return false;
				case .BOOL(let v):	return v;
				case .INT64(let v):	return v != 0 ? true : false;
				case .DOUBLE(let v): return v != 0 ? true : false;
				case .STRING, .ARRAY, .OBJECT: break;
				}
				return .Err;
			}
		}

		public Result<int32> AsInt32
		{
			get
			{
				switch(this)
				{
				case .NULL: return 0;
				case .BOOL(let v):	return v ? 1 : 0;
				case .INT64(let v):	return (int32)v;
				case .DOUBLE(let v): return (int32)v;
				case .STRING, .ARRAY, .OBJECT: break;
				}
				return .Err;
			}
		}

		public Result<int64> AsInt64
		{
			get
			{
				switch(this)
				{
				case .NULL: return 0;
				case .BOOL(let v):	return v ? 1 : 0;
				case .INT64(let v):	return v;
				case .DOUBLE(let v): return (int64)v;
				case .STRING, .ARRAY, .OBJECT: break;
				}
				return .Err;
			}
		}

		public Result<float> AsFloat
		{
			get
			{
				switch(this)
				{
				case .NULL: return 0;
				case .BOOL(let v):	return v ? 1 : 0;
				case .INT64(let v):	return (float)v;
				case .DOUBLE(let v): return (float)v;
				case .STRING, .ARRAY, .OBJECT: break;
				}
				return .Err;
			}
		}

		public Result<double> AsDouble
		{
			get
			{
				switch(this)
				{
				case .NULL: return 0;
				case .BOOL(let v):	return v ? 1 : 0;
				case .INT64(let v):	return (double)v;
				case .DOUBLE(let v): return v;
				case .STRING, .ARRAY, .OBJECT: break;
				}
				return .Err;
			}
		}

		public Result<String> AsString
		{
			get
			{
				switch(this)
				{
				case .NULL: return .Ok(null);

				case .STRING(let v): return v;
				case .BOOL, .INT64, .DOUBLE, .ARRAY, .OBJECT: break;
				}
				return .Err;
			}
		}

		public Result<JObject> AsObject
		{
			get
			{
				switch(this)
				{
				case .NULL: return .Ok(null);

				case .OBJECT(let v): return v;
				case .BOOL, .INT64, .DOUBLE, .ARRAY, .STRING: break;
				}
				return .Err;
			}
		}

		public Result<JArray> AsArray
		{
			get
			{
				switch(this)
				{
				case .NULL: return .Ok(null);

				case .ARRAY(let v): return v;
				case .BOOL, .INT64, .DOUBLE, .OBJECT, .STRING: break;
				}
				return .Err;
			}
		}
	}
}
