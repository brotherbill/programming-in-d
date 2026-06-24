import std.stdio;
import std.algorithm;
import std.conv;

void main()
{
	auto values = [10, 42, 100];
	auto results = map!(quarterOf, tenTimes)(values);

	writefln(" Quarters   Ten Times");

	foreach (quarterResult, tenTimesResult; results)
	{
		writefln("%8.2f %8s", quarterResult, tenTimesResult);
	}
}

double quarterOf(double value) pure nothrow
{
	return value / 4;
}

string tenTimes(double value) pure
{
	return to!string(value * 10);
}
