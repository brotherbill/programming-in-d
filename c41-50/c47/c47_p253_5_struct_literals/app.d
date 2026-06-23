import std.stdio : writeln, writefln;

void main()
{
	TimeOfDay structLiteral  = {8, 30};
	auto      structLiteral2 = TimeOfDay(hour: 8, minute: 30);

	immutable periodStart    = TimeOfDay(8, 30);
	immutable periodDuration = TimeOfDay(1, 15);
	immutable periodEnd      = addDuration(periodStart, periodDuration);

	writefln("Period end: %s:%s", periodEnd.hour, periodEnd.minute);
	writeln;

	immutable periodEnd2 = addDuration(TimeOfDay(8, 30), TimeOfDay(1, 15));
	writefln("Period end2: %s:%s", periodEnd2.hour, periodEnd2.minute);
}

struct TimeOfDay
{
	int hour;
	int minute;
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
