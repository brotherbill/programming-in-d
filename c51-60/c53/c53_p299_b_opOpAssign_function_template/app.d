import std.stdio : writeln;

void main()
{
	int weight = 50;
	weight    += 10; // by an operator

	auto lunchTime = TimeOfDay(12, 0);

	lunchTime += Duration(10); // by a member function
	writeln("lunchtime 12:10 is ", lunchTime);

	// by a template member function, same as lunchTime += Duration(15);
	lunchTime.opOpAssign!"+"(Duration(15));	
	writeln("lunchtime 12:25 is ", lunchTime);
}

struct Duration
{
	int minute;
}

struct TimeOfDay
{
	int hour;
	int minute;

	// template for TimeOfDay += Duration
	ref TimeOfDay opOpAssign(string op)(in Duration duration) if (op == "+")
	in (duration.minute >= 0, "duration.minute must be zero or more minutes")
	out
	{
		// oldHour and oldMinute are not members of TimeOfDay 
		// assert(hour == (oldHour + (duration.minute / 60)) % 24);
		// assert(minute == (oldMinute + duration.minute) % 60);
	}
	do
	{
		minute += duration.minute;
		hour   += minute / 60;
		minute %= 60;
		hour   %= 24;

		return this;
	}
}
