using System;
using System.Collections;

namespace JSONReader
{
	class JObject : IEnumerable<(String key, JValue value)>
	{
		public ~this()
		{
			for(let v in _values)
			{
				delete v.key;
				v.value.Dispose();
			}

			delete _values;
		}

		Dictionary<String, JValue> _values = new .();
		public int Count => _values.Count;
		public bool IsEmpty => _values.IsEmpty;

		public Result<JValue> this[StringView key]
		{
			get
			{
				if(_values.TryGetAlt(key, let matchKey, let val))
				{
					return .Ok(val);
				}
				return .Err;
			}
		}

		internal void AddValue(String key, JValue val)
		{
			_values.Add(key, val);
		}

		internal void AddValue(StringView key, JValue val)
		{
			_values.Add(new .(key), val);
		}

		public Dictionary<String, JValue>.Enumerator GetEnumerator()
		{
			return _values.GetEnumerator();
		}
	}
}
