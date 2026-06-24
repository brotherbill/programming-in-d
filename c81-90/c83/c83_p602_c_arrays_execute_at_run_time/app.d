import std.stdio;

void main()
{
	enum arr = [1, 2];

	// Executed at run time, not unrolled at compile time:
	foreach (i; arr)
	{
		writefln("i: %s", i);
	}
}
