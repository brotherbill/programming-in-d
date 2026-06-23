import std.stdio : writeln;
import std.format : format;

void main()
{
	writeln("third: ", ordinal(3));
}

string ordinal(size_t number) pure
{
	switch (number)
	{
	case 1:
		return "1st";
	case 2:
		return "2nd";
	case 3:
		return "3rd";
	default:
		return format("%sth", number);
	}
}

unittest
{
	import dunit.toolkit;

	assert(ordinal(1) == "1st");
	assert(ordinal(2) == "2nd");
	assert(ordinal(3) == "3rd");
	assert(ordinal(3) == "3RD");
	assert(ordinal(3) == "3TH");
	assert(ordinal(10) == "10th");
}
