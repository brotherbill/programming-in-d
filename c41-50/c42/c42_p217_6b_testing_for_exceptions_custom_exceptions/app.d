import std.stdio : writeln;
import std.exception : assertThrown, assertNotThrown;

void main() 
{

}

class UnequalLengths : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__)
	{
		super(msg, file, line);
		writeln("Unequal lengths");
	}
}

class RangeError : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__)
	{
		super(msg, file, line);
		writeln("Range error");
	}
}

int[] average(int[] a, int[] b)
{
	if (a.length != b.length)
	{
		throw new UnequalLengths("Unequal lengths");
	}

	int[] result;
	result.length = a.length;
	result[] = (a[] + b[]) / 2;
	return result;
}

unittest
{
	// Must throw UnequalLengths for uneven slices
	assertThrown!UnequalLengths(average([1], [1, 2]));
	/* The equivalent of the line above */
	/+
	{
		auto isUnequalLengthsThrown = false;
		try
		{
			average([1], [1, 2]);
		}
		catch (UnequalLengths exc)
		{
			isUnequalLengthsThrown = true;
		}
		assert(isUnequalLengthsThrown == true);
	}
	+/

	// Must not throw RangeError for empty slices (it may throw other types of exceptions)
	assertNotThrown!RangeError(average([], []));
	/* The equivalent of the line above */
	/+
	{
		auto inRangeErrorThrown = false;
		try
		{
			average([1], [1, 2]);
		}
		catch (RangeError exc)
		{
			inRangeErrorThrown = true;
		}
		catch (Exception exc)
		{
			// do nothing
		}
		assert(inRangeErrorThrown == false);
	}
	+/
}
