import std.stdio  : writeln;
import std.string : format;

void main()
{
	immutable readingTime = TimeOfDay(15, 0);
	immutable simpleTime  = TimeOfDaySimple(10, 30);

	readingTime = TimeOfDay(16, 0);		// ← compilation ERROR, cannot reassign immutable variable
	readingTime.minute += 10;			// ← compilation ERROR, cannot modify field/member of immutable variable

	writeln("simpleTime is: ", simpleTime);
	writeln("readingTime is: ", readingTime);

	auto strReadingTime = readingTime.toString;
	writeln("typeof(strReadingTime) is: ", typeof(strReadingTime).stringof);
	writeln("readingTime is: ", readingTime.toString);
}

struct TimeOfDay
{
	int hour;
	int minute;

	// must have const or inout here
	string toString() const
	{ 
		return format("%02s:%02s", hour, minute);
	}
}

struct TimeOfDaySimple
{
	int hour;
	int minute;
}
