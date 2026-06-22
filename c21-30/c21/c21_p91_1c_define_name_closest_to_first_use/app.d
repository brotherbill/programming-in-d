import std.stdio : write, writeln, readf;

void main()
{
	write("How many numbers are there? ");
	int count; 					// ← HERE

	readf(" %s", &count);

	if (count >= 1)
	{
		int[] numbers; 			// ← HERE
		numbers.length = count;

		double averageValue; 	// ← HERE
		// ... assume that the calculation is here ...
	}
	else
	{
		writeln("ERROR: You must enter at least one number!");
	}

	writeln("App completed");
}
