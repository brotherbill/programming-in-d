import std.stdio;

void main()
{
	int[string] daysInMonth; // First quarter only, non leap years

	daysInMonth = ["January": 31, "February": 28, "March": 31];

	writeln("Values only:");
	foreach (days; daysInMonth)
	{
		write(days, ", ");
	}
	writeln; writeln;

	// key = month, value = days
	writeln("Key and Value:");
	foreach (month, days; daysInMonth)
	{
		write(month, ": ", days, "; ");
	}
	writeln; writeln;

	writeln("byKey:");
	foreach (key; daysInMonth.byKey)
	{
		key ~= " Month";
		write(key, ", ");
	}
	writeln;
	foreach (key; daysInMonth.byKey)
	{
		write(key, ", ");
	}
	writeln; writeln;

	writeln("byKeyValue:");
	foreach (element; daysInMonth.byKeyValue)
	{
		element.key ~= " Month";
		element.value *= 10;
		writefln("The value for key %s is %s", element.key, element.value);
	}
	writeln;

	foreach (element; daysInMonth.byKeyValue)
	{
		writefln("The value for key %s is %s", element.key, element.value);
	}
	writeln;

	// This won't work (it hangs) since byKeyValue returns a struct with key and value members
	foreach (key, value; daysInMonth.byKeyValue)
	{
		writefln("The value for key %s is %s", key, value);
	}
}
