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

	// Print the numbers
	writeln("Before sorting:");
	print(numbers);

	sort(numbers);

	// Print the numbers
	writeln("After sorting:");
	print(numbers);
}

void print(int[] slice)
{
	foreach (i, element; slice)
	{
		writefln("%3s:%5s", i, element);
	}
}
