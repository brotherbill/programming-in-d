import std.stdio : readf, write, writeln;

void main()
{
	int number;

	// type in a negative integer to exit the loop
	while (number >= 0)
	{
		write("Please enter a number: ");
		readf(" %s", &number);
		writeln("Thank you for ", number);
	}
	
	writeln("Exited the loop");
}
