real sevenTimes(real value)
{
	return 7 * value;
}

double sevenTimes(double value)
{
	return 7 * value;
}

void main()
{
	int value = 5;
	auto result = sevenTimes(value); // ← compilation ERROR.  D can't decide which overloaded function to choose.
}
