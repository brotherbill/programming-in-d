import std.stdio : writeln;
import std.string : format;

void main()
{
	auto time = TimeOfDay(15, 30);
	writeln("3:30 pm is ", time);

	time.decrement(Duration(12));
	writeln("12 minutes before 3:30pm is ", time);

	time = TimeOfDay(15, 30);
	time.decrement(Duration(23, 18));
	writeln("42 minutes after 3:30pm is ", time);

	time = TimeOfDay(15, 30);
	time.decrement(Duration(22, 20));
	writeln("1 hour, 40 minutes after 3:30pm is ", time);
}

struct Duration
{
	int minute;

	// manually add back "removed default" constructor
	this(int minute)
	{
		this.minute = minute;
	}

	// added constructor for two parameters
	// adding this removes default constructor
	this(int hour, int minute)
	{
		this.minute = hour * 60 + minute;
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
