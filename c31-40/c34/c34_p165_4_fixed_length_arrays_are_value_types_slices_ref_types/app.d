import std.stdio : writeln, writefln;

void main()
{
	int[3] array1 = [10, 20, 30];
	auto array2 = array1; // array2's elements are different from array1's

	writefln("array1: %s", typeof(array1).stringof);
	writefln("array2: %s", typeof(array2).stringof);
	writeln;

	array2[0] = 11;

	// First array is not affected:
	assert(array1[0] == 10);

	writeln("array1: ", array1);
	writeln("array2: ", array2);
}
