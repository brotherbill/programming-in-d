import std.stdio : writeln;

void main()
{
	// Use construction syntax to create TimeOfDayStruct, then provide hour and minute.  Same natural order as lines 15 and 16.
	TimeOfDay periodStart    = TimeOfDay(8, 30); // hour: 8, minute: 30
	TimeOfDay periodDuration = TimeOfDay(1, 15); // hour: 1, minute: 15

	// Use construction syntax to create a unsigned byte initialized to 42.
	auto u = ubyte(42);	// u is a ubyte

	// Use construction syntax to create a signed integer initialized to u, which is 42.
	auto i = int(u); 	// i is an int
}

struct TimeOfDay
{
	int hour; 	// ← Not a variable; will become a part of a struct variable used in the program.
	int minute; // ← Not a variable; will become a part of a struct variable used in the program.
}
