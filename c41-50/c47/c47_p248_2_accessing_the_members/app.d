import std.stdio : writefln;

void main()
{
	TimeOfDay start;
	start.hour = 10; 		// must be nice being a CEO

	TimeOfDay periodStart;
	periodStart.hour   =  8;
	periodStart.minute = 30;

	TimeOfDay periodDuration;
	periodDuration.hour   =  1;
	periodDuration.minute = 15;

	immutable periodEnd = addDuration(periodStart, periodDuration);
	writefln("Period end: %s:%s", periodEnd.hour, periodEnd.minute);
}

struct TimeOfDay
{
	int hour; 	// ← Not a variable; will become a part of a struct variable used in the program.
	int minute; // ← Not a variable; will become a part of a struct variable used in the program.
}

TimeOfDay addDuration(TimeOfDay start, TimeOfDay duration)
{
	TimeOfDay result;

	result.minute  = start.minute  + duration.minute;
	result.hour    = start.hour    + duration.hour;
	result.hour   += result.minute / 60;
	result.minute %= 60;
	result.hour   %= 24;

	return result;
}
