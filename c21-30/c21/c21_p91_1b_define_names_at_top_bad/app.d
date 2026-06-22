import std.stdio : write, writeln, readf;

void main()
{
	int count; 				// ← HERE
	int[] numbers; 			// ← HERE.  Not used if count <= 0.  Always initialized.
	double averageValue; 	// ← HERE.  Not used.                Always initialized.

	write("How many numbers are there? ");
	readf(" %s", &count);

	if (count >= 1)
	{
		numbers.length = count;

		// ... assume the calculation is here ...
	}
	else
	{
		writeln("ERROR: You must enter at least one number!");
	}

	writeln("App completed");
}
