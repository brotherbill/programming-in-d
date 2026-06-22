import std.stdio;

void main()
{
	float result = 0;

	// Adding 0.001 for a thousand times:
	int counter = 1;
	while (counter <= 1000)
	{
		result += 0.001;
		++counter;
	}

	if (result == 1)
	{
		writeln("As expected: 1");
	}
	else
	{
		writeln("DIFFERENT: ", result);
	}
}
