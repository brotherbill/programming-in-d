import std.stdio;
import std.datetime.stopwatch;

// A function with a fast body:
ubyte compute(ubyte i)
{
	return cast(ubyte)(i * 42);
}

void main()
{
	size_t counter = 0;
	StopWatch sw;

	sw.start();

	// A short loop that repeats many times:
	foreach (i; 0 .. 100_000_000)
	{
		const number = cast(ubyte) i;
		if (compute(number) == number)
		{
			++counter;
		}
	}

	sw.stop();

	writefln("%s milliseconds", sw.peek.total!"msecs");

	pragma(inline, false)
	{
		// Functions defined in this scope should NOT be inlined
		int bar()
		{
			return 24;
		}
	}

	int foo()
	{
		pragma(inline, true); // This function should be inlined
		return 42;
	}
}

void someOtherFunction()
{
	// This syntax is obsolete, use blocks instead
	// pragma(inline, true):

	// This syntax is obsolete, use blocks instead
	//pragma(inline):

}
