import std.stdio  : writeln;
import std.string : format;

void main()
{
	auto time = TimeOfDay(15, 30);
	writeln("3:30 pm is ", time);

	time.decrement(Duration(12));
	writeln("12 minutes before 3:30 pm is ", time);
	writeln;

	time = TimeOfDay(15, 30);
	time.decrement(Duration(hour: 3, minute: 0));
	writeln("3 hours before 3:30 pm is ", time);

	time = TimeOfDay(15, 30);
	time.decrement(Duration.fromHours(2));
	writeln("2 hours before 3:30 pm is ", time);
}

struct Duration
{
	int minute;

	this (in int minute)
	{
		this.minute = minute;
	}

	this(in int hour, in int minute)
	{
		this.minute = hour * 60 + minute;
	}

	static Duration fromHours(in int hour)
	{
		return Duration(minute: hour * 60);
	}
}

struct TimeOfDay
{
	int hour;
	int minute;

	string toString() const
	{
		return format("%02s:%02s", hour, minute);
	}

	void toMinutes()
	{
		minute += hour * 60;
		hour = 0;
	}

	void normalize()
	out(; (0 <= hour && hour < 24) && (0 <= minute && minute < 60))
	{
		while (hour < 0)
		{
			hour += 24;
		}

		while (minute < 0)
		{
			minute += 60 * 24;
		}
			
		hour  += minute / 60;
		minute = minute % 60;
		hour  %= 24;
	}

	void decrement(Duration duration)
	{
		this.toMinutes;
		this.minute -= duration.minute;
		this.normalize;
	}
}
