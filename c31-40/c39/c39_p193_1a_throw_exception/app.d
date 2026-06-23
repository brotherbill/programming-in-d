import std.stdio  : writeln;
import std.string : format;
import std.random : uniform;

void main()
{
	randomDiceValues(3).writeln;
	randomDiceValues(-5).writeln;
}

int[] randomDiceValues(int count)
{
	if (count < 0)
	{
		throw new Exception(format("Invalid dice count: %s", count));
	}

	int[] values;

	foreach (i; 0 .. count)
	{
		values ~= uniform(1, 7);  // Fails on Windows for version 2.111.0.  Works on Linux.
	}
	
	return values;
}
