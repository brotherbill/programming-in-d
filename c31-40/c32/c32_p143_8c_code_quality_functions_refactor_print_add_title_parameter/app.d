import std.stdio : readf, writeln, write, writefln;
import std.algorithm : sort;

void main()
{
	int[] numbers;
	int count;

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

	print("Before sorting:", numbers);
	sort(numbers);
	print("After sorting", numbers);
}

void print(string title, int[] slice)
{
	writeln(title, ":");
	foreach (i, element; slice)
	{
		writefln("%3s:%5s", i, element);
	}
}
