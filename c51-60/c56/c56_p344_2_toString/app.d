import std.stdio  : writeln;
import std.string : format;

void main()
{
	auto clock = new Clock(20, 30, 0);
	writeln(clock); // Calls clock.toString()

	auto alarmClock = new AlarmClock(20, 30, 0, 7, 0);
	writeln(alarmClock);
}

class Clock
{
	int hour;
	int minute;
	int second;

	this(int hour, int minute, int second)
	{
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}

	override string toString() const
	{
		return format("%02s:%02s:%02s", hour, minute, second);
	}
}

class AlarmClock : Clock
{
	int alarmHour;
	int alarmMinute;

	this(int hour, int minute, int second, 	// for Clock's members
		int alarmHour, int alarmMinute)		// for AlarmClock's members
	{ 
		super(hour, minute, second);
		this.alarmHour = alarmHour;
		this.alarmMinute = alarmMinute;
	}

	override string toString() const
	{
		return format("time %s, alarm %02s:%02s", super.toString(), alarmHour, alarmMinute);
	}
}
