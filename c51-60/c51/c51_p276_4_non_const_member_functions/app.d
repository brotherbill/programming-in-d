import std.stdio : writeln;
import std.string : format;


void main()
{
	auto start = TimeOfDay(5, 30);
	start.increment(Duration(30));
	writeln("New time: ", start.toString());
}

struct TimeOfDay
{
	int hour;
	int minute;

	string toString() const
	{
		return format("%02s:%02s", hour, minute);
	}

	void increment(Duration duration)
	{
		hour   += duration.hour;
		minute += duration.minute;
		hour   += minute / 60;
		minute %= 60;
		hour   %= 24;
	}
}

struct Duration
{
	int hour;
	int minute;

	string toString() const 	// must have const or inout here
	{ 
		return format("%02s:%02s", hour, minute);
	}
}
