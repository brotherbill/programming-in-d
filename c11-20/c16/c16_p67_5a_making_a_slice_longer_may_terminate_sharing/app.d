import std.stdio;

void main()
{
	int[] slice   = [1, 3, 5, 7, 9, 11, 13, 15];
	int[] half    = slice[0 .. $ / 2];
	int[] quarter = slice[0 .. $ / 4];

	writeln("Original slices:");
	writeln("quarter: ", quarter);
	writeln("half   : ", half);
	writeln("slice  : ", slice);
	writeln();

	quarter[1] = 0; // modify through one slice
	writeln("After changing quarter[1] to 0:");
	writeln("quarter: ", quarter);
	writeln("half   : ", half);
	writeln("slice  : ", slice);
	writeln();

	writeln("quarter extended leaves backing slice unchanged:");
	writeln("&quarter before appending 42: ", &(quarter[0]), " length: ", quarter.length, " capacity: ", quarter.capacity);
	writeln("When quarter is appended without enough capacity, a new backing array is created.");
	writeln("Then its contents are copied to a new backing array, and the new value is appended.");
	writeln("This breaks sharing of backing arrays.");
	writeln("This is done to prevent clobbering the neighbor on the right side of the backing slice array, which is rather rude.");
	writeln("quarter was moved to a new location in memory with room for 42.");
	quarter ~= 42;
	writeln("&quarter after  appending 42: ", &(quarter[0]));
	writeln();

	writeln("After appending 42 to quarter, and changing quarter[1] to 999:");
	writeln("half and slice are unchanged from lines 15 - 20.");
	quarter[1] = 999;
	writeln("quarter: ", quarter);
	writeln("half   : ", half);
	writeln("slice  : ", slice);
}
