import std.stdio : writeln;

void main()
{
	auto result = averageAge(-1, 10);  // Line 5 acts as a "client" of averageAge
	writeln("result: ", result);
}

// averageAge provides "service"
double averageAge(double first, double second)
{
	assert(first >= 0);
	assert(second >= 0);

	return (first + second) / 2;
}
