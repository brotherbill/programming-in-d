import std.stdio;

void main()
{
	writeln(" ", __LINE__, " sum( 1.1, 2.2, 3.3 ): ", sum(1.1, 2.2, 3.3));
	writeln(" ", __LINE__, " sum([1.1, 2.2, 3.3]): ", sum([1.1, 2.2, 3.3]));
	writeln;

	writeln(" ", __LINE__, " empty list: ", parenthesize("{", "}"));
	writeln(__LINE__, " fruit list: ", parenthesize("{", "}", "apple", "pear", "banana"));
}

double sum(double[] numbers...)
{
	double result = 0.0;

	foreach (number; numbers)
	{
		result += number;
	}

	return result;
}

char[] parenthesize(
	string opening, 	// ← The first two parameters must be
	string closing, 	//   specified when the function is called
	string[] words...)	// ← Need not be specified
{
	char[] result;
	foreach (word; words)
	{
		result ~= opening;
		result ~= word;
		result ~= closing;
	}
	return result;
}
