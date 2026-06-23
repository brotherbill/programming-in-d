import std.stdio : writeln;

void main()
{
	int weight = 50;
	weight    += 10; 					// by an operator

	auto lunchTime = TimeOfDay(12, 0);
	lunchTime.increment(Duration(10)); 	// by a member function

	writeln("lunchtime: ", lunchTime);

	// Error: operator `+=` not supported for `lunchTime` of type `TimeOfDay`
	lunchTime += Duration(10);		// by an operator (even for a struct)  Won't compile (yet)
}

struct Duration
{
	int minute;
}

struct TimeOfDay
{
	int hour;
	int minute;

	void increment(Duration duration)
	{
		minute += duration.minute;
		hour   += minute / 60;
		minute %= 60;
		hour   %= 24;
	}
}
