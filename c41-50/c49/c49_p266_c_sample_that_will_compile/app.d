import std.stdio;

void main()
{
	int value = 5;
	auto result = sevenTimes(value);

	writeln("sevenTimes(5) is ", result);
}

real sevenTimes(real value)
{
	return 7 * value;
}

double sevenTimes(double value)
{
	return 7 * value;
}

long sevenTimes(long value)
{
	return 7 * value;
}
