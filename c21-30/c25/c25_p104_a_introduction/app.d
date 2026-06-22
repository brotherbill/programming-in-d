import std.stdio : writeln, writefln;

void main()
{
	double[] items;

	items ~= 1.23;
	items ~= 45.6;

	writeln("--- default formatting ---");
	for (int i = 0; i != items.length; ++i)
	{
		writeln("Item ", i + 1, ": ", items[i]);
	}
	writeln;

	writeln("--- formatted output ---");
	writeln("%d means default decimal formatting");
	writeln("%9.02f means floating point, width 9, right adjusted as a number, 2 decimal places, padded with zeroes");
	for (int i = 0; i != items.length; ++i)
	{
		writefln("Item %d:%9.02f", i + 1, items[i]);
	}
	writeln;
}
