import std.stdio : readf, write, writeln, writefln;
import std.algorithm : sort;

void main()
{
	int[] numbers;
	int   count;

	write("How many numbers are you going to enter? ");
	readf(" %s", &count);
	
	// Read the numbers
	foreach (i; 0 .. count)
	{
		int number;
		write("Number ", i, "? ");
		readf(" %s", &number);
		numbers ~= number;
	}
	writeln;

	// Print the numbers
	writeln("Before sorting:");
	foreach (i, number; numbers)
	{
		writefln("%3d:%5d", i, number);
	}
	writeln;

	sort(numbers);	// sort in place

	// Print the numbers
	writeln("After sorting:");
	foreach (i, number; numbers)
	{
		writefln("%3d:%5d", i, number);
	}
}
