import std.stdio;

void main()
{
	bool isOptimistic = true;

	// technique 1: ternary operator
	writeln("The glass is half ", isOptimistic ? "full." : "empty.");

	// technique 2: first part, then if else
	write("The glass is half ");

	if (isOptimistic)
	{
		writeln("full.");
	}
	else
	{
		writeln("empty.");
	}

	// technique 3: entire message, if else
	if (isOptimistic)
	{
		writeln("The glass is half full.");
	}
	else
	{
		writeln("The glass is half empty.");
	}
}
