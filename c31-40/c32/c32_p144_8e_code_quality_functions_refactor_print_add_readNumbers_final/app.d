void main()
{
	import std.algorithm : sort;

	int[] numbers = readNumbers;
	print("Before sorting:", numbers);
	numbers.sort;
	print("After sorting", numbers);
}

void print(string title, int[] slice)
{
	import std.stdio : writeln, writefln;
	
	writeln(title, ":");
	foreach (i, element; slice)
	{
		writefln("%3s:%5s", i, element);
	}
	writeln;
}

int readInt(string message)
{
	import std.stdio : readf, write;

	int result;

	write(message, "? ");
	readf(" %s", &result);

	return result;
}

int[] readNumbers()
{
	import std.stdio : writeln;
	import std.format : format;

	int[] result;
	int count = readInt("How many numbers are you going to enter");

	foreach (i; 0 .. count)
	{
		result ~= readInt(format("Number %s", i));
	}

	writeln;
	return result;
}
