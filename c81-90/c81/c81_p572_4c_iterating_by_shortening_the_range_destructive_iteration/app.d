import std.stdio;

void main()
{
	int[] slice = [10, 11, 12];
	writeln("slice before: ", slice);

	for (; slice.length; slice = slice[1 .. $])
	{
		writeln(' ', slice[0], ' ', slice); // ← always the first element
	}

	assert(slice.length == 0); // ← the length does change
	writeln("slice after : ", slice);
}
