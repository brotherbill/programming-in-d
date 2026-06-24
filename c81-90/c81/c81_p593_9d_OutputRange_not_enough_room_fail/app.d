import std.stdio;
import std.range;

void main()
{
	int[] slice = [1, 2, 3];
	int[] slice2 = slice;

	writeln("slice2 before: ", slice2);
	writeln("slice  before: ", slice);
	writeln;

	foreach (i; 0 .. 4)
	{ // ← no room for 4 elements
		put(slice2, i * 100);
	}

	writeln("slice2 after : ", slice2);
	writeln("slice  after : ", slice);
}
