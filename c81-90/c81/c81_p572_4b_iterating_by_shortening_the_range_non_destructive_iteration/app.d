import std.stdio;

void main()
{
	int[] slice = [10, 11, 12];
	writeln("slice before: ", slice);

	for (int i = 0; i != slice.length; ++i)
	{
		write(' ', slice[i]);
	}
	writeln;

	assert(slice.length == 3); // ← the length doesn't change
	writeln("slice after : ", slice);
}
