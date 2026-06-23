mport std.random;
import std.stdio;
import std.string;
import std.algorithm;

void main()
{
	TimeOfDay[] times;

	foreach (i; 0 .. 10) 
	{
		times ~= TimeOfDay(uniform(0, 24), uniform(0, 60));
	}

	sort(times);
	writeln(times);
}

struct TimeOfDay
{
	int hour;
	int minute;

	int opCmp(TimeOfDay rhs) const
	{
		return (hour == rhs.hour)
				? (minute - rhs.minute)
				: (hour - rhs.hour);
	}

	string toString() const
	{
		return format("%02s:%02s", hour, minute);
	}
}
