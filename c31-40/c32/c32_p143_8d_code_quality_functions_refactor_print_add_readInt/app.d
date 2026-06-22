import std.stdio;
import std.algorithm;
import std.format;

void main()
{
	int[] numbers;
	int count = readInt("How many numbers are you going to enter? ");

	// Read the numbers
	foreach (i; 0 .. count)
	{
		numbers ~= readInt(format("Number %s", i));
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

int readInt(string message)
{
	int result;

	write(message, "? ");
	readf(" %s", &result);

	return result;
}
