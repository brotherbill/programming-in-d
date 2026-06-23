import std.stdio : writeln;

void main()
{
	int[] daysIn2000 = monthDays(2000);
}

int[] monthDays(int year)
{
	int[] days = [ 31, februaryDays(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	assert((sum(days) == 365) || (sum(days) == 366), "days in year must be 365 or 366");
	return days;
}

int februaryDays(int year)
{
	return 30;
}

int sum(const int[] days) pure
{
	int result = 0;
	foreach (int day; days)
	{
		result += day;
	}
	return result;
}
