import std.stdio;

void main()
{
	int[] slice = [10, 11, 12];
	int[] surrogate = slice;		// copy of slice

	for (; surrogate.length; surrogate = surrogate[1 .. $])
	{
		writeln(' ', surrogate[0], ", slice: ", slice, ", surrogate: ", surrogate);
	}
	writeln;

	assert(surrogate.length == 0);	// ← surrogate is consumed
	assert(slice.length == 3);		// ← slice remains the same	
	writeln("     slice: ", slice, ", surrogate: ", surrogate);
}
