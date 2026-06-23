import std.stdio  : writeln;
import std.string : format;
import std.conv   : to;

void main()
{
	auto noon = new Clock(12, 0, 0);
	writeln(noon);

	string[Clock] timeTags;
	timeTags[noon] = "Noon";

	if (noon in timeTags)
	{
		writeln("noon is in timeTags");
	}
	else
	{
		writeln("noon is NOT in timeTags");
	}

	writeln;

	if (new Clock(12, 0, 0) in timeTags)
	{
		writeln("Exists");
	}
	else
	{
		writeln("Missing");
	}

	auto fiveAm = new AlarmClock(5, 0, 0, 0, 0);
	string[AlarmClock] alarmTags;
	alarmTags[fiveAm] = "5am";

	assert(new AlarmClock(5, 0, 0, 0, 0) in alarmTags);
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

	override size_t toHash() const
	{
		// Because there are 3600 seconds in an hour and 60 seconds in a minute: 
		return (3600 * hour) + (60 * minute) + second;
	}

	// Compiler wants opEquals when adding toHash
	override bool opEquals(Object o) const
	{
		Clock rhs = cast(Clock) o;
		if (rhs is null)
			return false;

		// Assumes normalized
		return (hour == rhs.hour && minute == rhs.minute && second == rhs.second);
	}
}

class AlarmClock : Clock
{
	int alarmHour;
	int alarmMinute;

	this(int hour, int minute, int second, // for Clock's members
		int alarmHour, int alarmMinute)
	{ 
		// for AlarmClock's members
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
		// auto rhs = cast(const AlarmClock) o;     // rhs means right-hand side
		auto rhs = to!(const AlarmClock)(o); // alternative syntax

		bool result = rhs && (alarmHour == rhs.alarmHour) && (alarmMinute == rhs.alarmMinute) && super.opEquals(o);
		return result;
	}

	// sub-optimal hash algorithm.  Use better hash algorithm.  This is D course, not an algorithms course.
	override size_t toHash() const
	{
		// Because there are 3600 seconds in an hour and 60 seconds in a minute: 
		return super.toHash() * 1_500 + 60 * alarmHour + alarmMinute;
	}
}
