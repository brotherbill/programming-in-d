import std.stdio;
import std.string;

void main()
{
	// 10 hours or 10 minutes?
	auto travelDuration  = Duration(10); // 10 minutes
	auto travelDuration2 = Duration(minute: 10); // 10 minutes
	writeln("travelDuration(10)          is ", travelDuration);
	writeln("travelDuration2(minute: 10) is ", travelDuration2);

	auto travelDurationConstructed = Duration(hour: 10, minute: 30);
	writeln("travelDurationConstructed Duration(hour: 10, minute: 30) is ", travelDurationConstructed);
	writeln;

	auto travelDuration5Hours = Duration.make_hours(5);
	writeln("travelDuration(5 hours) is ", travelDuration5Hours);

	auto travelDuration15Minutes = Duration.make_minutes(15);
	writeln("travelDuration(15 minutes) is ", travelDuration15Minutes);

	auto travelDuration10Hours15Minutes = Duration.make_hours_minutes(10, 15);
	writeln("travelDuration(10 hours, 15 minutes) is ", travelDuration10Hours15Minutes);
}

struct Duration
{
	int minute;

	this(in int minute)
	{
		this.minute = minute;
	}

	this(in int hour, in int minute)
	{
		this.minute = hour * 60 + minute;
	}

	string toString() const
	{
		int hours = minute / 60;
		int minutes = minute % 60;
		return format("%02s:%02s", hours, minutes);
	}

	static Duration make_hours(in int hours)
	{
		return Duration(hours, 0);
	}

	static Duration make_minutes(in int minutes)
	{
		return Duration(minutes);
	}

	static Duration make_hours_minutes(in int hours, in int minutes)
	{
		return Duration(hours, minutes);
	}

}
