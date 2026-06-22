import std.stdio;

void main()
{
	int number = 1; 		// ← preparation

	while (number < 11)		// ← condition check
	{ 
		writeln(number); 	// ← actual work
		++number; 			// ← iteration
	}

	writeln;
	writeln("Done, number = ", number);
}
