import std.stdio  : writeln;
import std.string : format;

void main()
{
	auto alarmClock = new AlarmClock(10, 15, 0, 6, 45);
	writeln("alarmClock.emitSound: ", alarmClock.emitSound);
}

interface SoundEmitter
{
	string emitSound(); // Declared, but needs to be implemented by effective class
}

class Clock
{
	int hour;
	int minute;
	int second;

	this(int hour, int minute, int second)
	{
		this.hour   = hour;
		this.minute = minute;
		this.second = second;
	}

	override string toString() const
	{
		return format("%02s:%02s:%02s", hour, minute, second);
	}
}

class AlarmClock : Clock, SoundEmitter
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

	string emitSound() const
	{
		return "beep";
	}
}
