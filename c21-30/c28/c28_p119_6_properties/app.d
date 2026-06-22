import std.stdio : writeln;

void main()
{
	int[string] daysOfMonth; // first quarter only, non leap year
	daysOfMonth["January"]  = 31;
	daysOfMonth["February"] = 28;
	daysOfMonth["March"]    = 31;

	writeln("length: ", daysOfMonth.length);
	writeln;

	writeln("keys - copy:     ", daysOfMonth.keys);
	writeln("byKey - no copy: ", daysOfMonth.byKey);
	writeln;

	writeln("byKeyValue - no copy:");
	foreach (pair; daysOfMonth.byKeyValue)
	{
		writeln("  ", pair.key, ": ", pair.value);
	}	
	writeln;

	writeln("values - copy:     ", daysOfMonth.values);
	writeln("byValue - no copy: ", daysOfMonth.byValue);
	writeln("size of associated array reference: ", daysOfMonth.sizeof);

	daysOfMonth.rehash;
	writeln("length after rehash: ", daysOfMonth.length);
	writeln;

	writeln("size of associated array after rehash: ", daysOfMonth.sizeof);
}
