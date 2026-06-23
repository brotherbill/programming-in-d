import std.conv : to;

void main()
{
	double d = -1.75;
	doubleToShortWontCompile(d);
	short s = to!short(d); // Explicit conversion, declaring loss of fractional data is acceptable
	assert(s is -1);

	string fortyTwo = "42";
	stringToIntWontCompile(fortyTwo);
	int i = to!int(fortyTwo);
	assert(i is 42);
}

void doubleToShortWontCompile(double d)
{
	short s = d;	// won't compile due to loss of fractional data
}

void stringToIntWontCompile(string number)
{
	int i = number;	// won't compile because number might be "I am not a number"
}
