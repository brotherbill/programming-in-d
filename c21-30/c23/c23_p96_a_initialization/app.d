import std.stdio;

void main()
{
	bool isLeapYear = true;

	// technique 1: use ternary operator
	int days = isLeapYear ? 366 : 365;
	writeln("ternary: ", days);

	// technique 2: use verbose if - else
	if (isLeapYear)
	{
		days = 366;
	}
	else
	{
		days = 365;
	}
	writeln("if else: ", days);

	// technique 3: initialize, then increment if leap year
	days = 365;
	if (isLeapYear)
	{
		++days;
	}
	writeln("init then increment: ", days);
}
