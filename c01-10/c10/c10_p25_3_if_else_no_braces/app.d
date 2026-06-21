import std.stdio : writeln;

void main()
{
	bool existsCoffee = false;

	// This is a code smell.  Should use braces for clarity.
	if (existsCoffee)
		writeln("Drink coffee");
	else
		writeln("Drink tea");
		writeln("with lemon");

	// This is an approved way of avoiding braces.
	// Only one expression should be provided.
	if (existsCoffee) writeln("Drink coffee");
	else              writeln("Drink tea");
	writeln("with lemon");

	// Correct way to write code, for those who don't like lemon in their coffee.
	if (existsCoffee) writeln("Drink coffee");
	else
	{
		writeln("Drink tea");
		writeln("with lemon");
	}
}
