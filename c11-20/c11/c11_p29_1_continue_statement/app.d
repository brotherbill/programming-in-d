import std.stdio;

void main()
{
	int number;

	while (number >= 0)
	{
		write("Please enter a number: ");
		readf(" %s", &number);
		
		if (number == 13)
		{
			writeln("Sorry, not accepting that one...");
			continue;
		}


		writeln("Thank you for ", number);
	}

	writeln("Exited the loop");
}
