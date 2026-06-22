import std.stdio : writeln;

void main()
{
	// number is declared within the for loop and is scoped to it.  This is an exception to the usual braces-based scoping rules.
	for (int number = 1; number < 11; ++number)
	{
		writeln(number);
	}

	// The variable 'number' is not accessible here because it was declared inside the for loop
	// writeln("Done, number is ", number);  // Won't compile since number is not in scope
}
