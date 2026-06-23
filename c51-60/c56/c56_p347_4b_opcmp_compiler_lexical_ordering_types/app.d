import std.stdio  : writeln, writefln;
import std.string : format;
import std.conv   : to;

// If comparing Clock to Clock or AlarmClock to AlarmClock, compare all fields
// If comparing Clock to AlarmClock or AlarmClock to Clock, then "AlarmClock" < "Clock", if this makes sense

void main()
{
	auto variable0 = new Clock(3, 4, 5);
	auto variable1 = new AlarmClock(6, 7, 8, 5, 0);
	assert(variable0 >= variable1); // Clock >= AlarmClock lexically, because when comparing Type Names, "Clock" >= "AlarmClock"
	assert(variable1 <= variable0); // AlarmClock <= Clock lexically, because when comparing Type Names, "AlarmClock" <= "Clock"

	auto clock0 = new Clock(10, 11, 12);
	auto clock1 = new Clock(12, 0, 0);
	auto clock2 = new Clock(10, 11, 12);
	assert(clock0 <= clock1);
	assert(clock0 == clock2);

	auto variable2 = new AlarmClock(10, 0, 0, 0, 0);
	assert(variable1 < variable2);
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

	override bool opEquals(Object o) const
	{
		auto rhs = cast(const Clock) o; 		// rhs means right-hand side
		// auto rhs = to!(const Clock)(o);      // alternative syntax

		bool result = rhs && (hour == rhs.hour) && (minute == rhs.minute) && (second == rhs.second);
		return result;
	}

	override int opCmp(Object o) const
	{
		// Taking advantage of the automatically-maintained order of the types
		writeln(typeid(this));
		writeln(typeid(o));

		if (typeid(this) != typeid(o))
		{
			writefln("Clock opCmp - typeid(this): %s, typeid(o): %s", typeid(this), typeid(o));
			return typeid(this).opCmp(typeid(o)); // comparing class names lexically as strings.  "app.AlarmClock" < "app.Clock"
		}

		auto rhs = cast(const Clock) o;
		// No need to check whether rhs is null, because it is known at this line that it has the same type as o
		if (hour != rhs.hour)
		{
			return hour - rhs.hour;
		}
		else if (minute != rhs.minute)
		{
			return minute - rhs.minute;
		}
		else
		{
			return second - rhs.second;
		}
	}

	override ulong toHash() const nothrow @trusted
	{
		return (60 * 60 * hour) + (60 * minute) * second;
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
		this.alarmHour = alarmHour;
		this.alarmMinute = alarmMinute;
	}

	override string toString() const
	{
		return format("time %s, alarm %02s:%02s", super.toString(), alarmHour, alarmMinute);
	}

	override bool opEquals(Object o) const
	{
		// auto rhs = cast(const AlarmClock) o;     // rhs means right-hand side
		auto rhs = to!(const AlarmClock)(o); // alternative syntax


		bool result = rhs && (alarmHour == rhs.alarmHour) && (alarmMinute == rhs.alarmMinute) && super.opEquals(
			o);
		return result;
	}

	override int opCmp(Object o) const
	{
		auto rhs = cast(const AlarmClock) o;

		const int superResult = super.opCmp(o);

		if (superResult != 0)
		{
			return superResult;
		}
		else if (alarmHour != rhs.alarmHour)
		{
			return alarmHour - rhs.alarmHour;
		}
		else
		{
			return alarmMinute - rhs.alarmMinute;
		}
	}

	override ulong toHash() const nothrow @trusted
	{
		return ((60 ^^ 4) * hour) + ((60 ^^ 3 * minute) + ((60 ^^ 2) * second)) + (60 * alarmHour) + alarmMinute;
	}
}
