import std.stdio;

void main()
{
	// number range, NOT a Phobos range
	foreach (value; 3 .. 7) {		
		writeln("value: ", value);
	}
	writeln;

	// number range, NOT a Phobos range
	int[] array = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120];
	int[] slice = array[5 .. 10];
	writeln("slice: ", slice);
}
