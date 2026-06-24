import std.stdio;

void main()
{
	foreach (first, second; NumberRange(0, 15))
	{
		writef("%s,%s  ", first, second);
	}
}

struct NumberRange
{
	int begin;
	int end;

	int opApply(int delegate(ref int, ref int) dg) const
	{
		int result = 0;

		for (int i = begin; (i + 1) < end; i += 5)
		{
			int first = i;
			int second = i + 1;

			result = dg(first, second);

			if (result)
			{
				break;
			}
		}

		return result;
	}
}
