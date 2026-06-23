import std.stdio;

void main()
{
	auto travelDuration = Duration(10);
	auto returnDuration = Duration(11);
	Duration totalDuration;
	
	// ...

	totalDuration = travelDuration + returnDuration;
	writefln("travelDuration + returnDuration is            : totalDuration (%s)", totalDuration);

	totalDuration = travelDuration.opBinary!"+"(returnDuration);
	writefln("travelDuration.opBinary!\"+\"(returnDuration) is: totalDuration (%s)", totalDuration);
}

struct Duration
{
	int minute;

	Duration opBinary(string op)(Duration rhs) const if (op == "+")
	{
		return Duration(minute + rhs.minute);	// new object
	}
}
