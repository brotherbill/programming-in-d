import std.stdio  : writeln;
import std.string : format;
import std.conv   : to;

void main()
{
	auto variable0 = new Clock(6, 7, 8);
	auto variable1 = new Clock(6, 7, 8);
	assert(variable0 == variable1); // They are equal now because the contents are the same

	auto partner0 = new Clock(9, 10, 11);
	auto partner1 = partner0;
	assert(partner0 == partner1);	// They are equal because they refer to the same object

	auto alarm0 = new AlarmClock(10, 30, 0, 6, 30);
	auto alarm1 = new AlarmClock(10, 30, 0, 6, 30);
	assert(alarm0 == alarm1);		// They are equal because the contents are the same, even though they are different objects
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

	override bool opEquals(Object o) const
	{
		auto rhs = cast(const Clock) o; 	// rhs means right-hand side
		// auto rhs = to!(const Clock)(o);	// alternative syntax

		// If the cast fails, rhs will be null, and the result will be false. 
		// If the cast succeeds, we compare the contents of the two objects.
		bool result = rhs && (hour == rhs.hour) && (minute == rhs.minute) && (second == rhs.second);
		return result;
	}

	override ulong toHash() const 
	{
		return hour * minute * second;
	}
}

class AlarmClock : Clock
{
	int alarmHour;
	int alarmMinute;

	this(int hour, int minute, int second, // for Clock's members
		int alarmHour, int alarmMinute)
	{ // for AlarmClock's members
		super(hour, minute, second);
		this.alarmHour   = alarmHour;
		this.alarmMinute = alarmMinute;
	}

	override string toString() const
	{
		return format("time %s, alarm %02s:%02s", super.toString(), alarmHour, alarmMinute);
	}

	override bool opEquals(Object o) const
	{
		// auto rhs = cast(const AlarmClock) o; 	// rhs means right-hand side
		auto rhs    = to!(const AlarmClock)(o); // alternative syntax


		bool result = rhs && (alarmHour == rhs.alarmHour) && (alarmMinute == rhs.alarmMinute) && super.opEquals(o);
		return result;
	}

	override ulong toHash() const 
	{
		return super.toHash * alarmHour * alarmMinute;
	}
}
