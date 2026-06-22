import std.stdio : writeln;

void main()
{
	// standard foreach loop for array of strings
	string[] daysInWeek = ["Monday", "Tuesday", "Wednesday"];

	foreach (dayInWeek; daysInWeek)
	{
		writeln(dayInWeek);
	}
	writeln;

	// foreach loop with index.  No need for auto keyword for index variable
	foreach (i, dayInWeek; daysInWeek)
	{
		writeln(i, ": ", dayInWeek);
	}
}
