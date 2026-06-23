import std.stdio : writeln;
import std.string : format;

void main()
{
	writeln(timeToString(12, 34));		// valid input.  Should print "12:34"
	writeln(timeToString(2025, 25)); 	// violates precondition "guard" of timeToString function on line 13
}

string timeToString(int hour, int minute)
in
{
	assert(0 <= hour && hour <= 23, format("hour %s is not in range [0, 23]", hour));
	assert(0 <= minute && minute <= 59, format("minute %s is not in range [0, 59]", minute));
}
do
{
	return format("%02s:%02s", hour, minute);
}
