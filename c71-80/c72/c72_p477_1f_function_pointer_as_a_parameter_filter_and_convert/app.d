import std.stdio;

// import std.random

void main()
{
	int[] numbers;

	// Random numbers between -10 and 10
	foreach (i; 0 .. 10)
	{
		numbers ~= i * 2 + 1 - 10; // Just a placeholder for random numbers
	}

	writeln("input : ", numbers);
	writeln("output: ", filterAndConvert(numbers));
}

int[] filterAndConvert(const int[] numbers)
{
	int[] result;

	foreach (e; numbers)
	{
		if (e > 0)
		{ // filtering,
			immutable newNumber = e * 10; // and conversion
			result ~= newNumber;
		}
	}

	return result;
}
