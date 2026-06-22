import std.stdio : writeln;

void main()
{
	// A string is an array of characters
	foreach (c; "Greetings!")
	{
		writeln(c);
	}
	writeln;

	foreach (i, c; "Greetings!")
	{
		writeln(i, ": ", c);
	}
}
