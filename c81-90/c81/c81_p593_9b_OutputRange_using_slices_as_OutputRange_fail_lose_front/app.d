import std.stdio;
import std.range;

void main()
{
	int[] slice = [1, 2, 3];

	writeln("slice before: ", slice);
	put(slice, 100);
	writeln("slice after : ", slice);
}
