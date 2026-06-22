import std.stdio;

void main()
{
	int number;

	while (number >= 0)
	{
		write("Please enter a number: ");
		readf(" %s", &number);

		if (number == 42)
		{
			writeln("FOUND IT!");
			break;
		}

		writeln("Thank you for ", number);
	}
	
	writeln("Exited the loop");
}
