import std.stdio : writeln;
import std.exception : assertThrown;

void main()
{
	// assertThrown(average([1], [1, 2]));

	// The equivalent to the line above
	{
		auto isThrown = false;

		try
		{
			average([1], [1, 2]);
		}
		catch (Exception exc)
		{
			isThrown = true;
		}

		assert(isThrown);
	}
}

void average(int[] a, int[] b)
{
	throw new UnequalLengths("Unequal lengths");
}

class UnequalLengths : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__)
	{
		super(msg, file, line);
		writeln("Unequal lengths");
	}
}

unittest
{
	assertThrown(average([1], [1, 2]));
}
