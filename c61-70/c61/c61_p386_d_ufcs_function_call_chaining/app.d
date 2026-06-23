import std.stdio;
import std.algorithm;

static bool isEven(int a) => a % 2 == 0;

void main()
{
	auto values = [1, 2, 3, 4, 5];

	writeln("function syntax: ", evens(divide(multiply(values, 10), 3)));

	writeln("UFCS     syntax: ", values.multiply(10).divide(3).evens);
	values.multiply(10).divide(3).evens.writeln(" Second argument");
	writeln;

	// functional programming in D
	// bool isEven(int a) {
	// 	return a % 2 == 0;
	// }

	auto result =
		values
		.map!(a => a * 10)
		.map!(a => a / 3)
		.filter!(a => a.isEven);
	writeln("Functional programming: ", result);
	writeln("values not mutated: ", values);
}

// Returns the result of dividing all of the elements by 'divisor'
int[] divide(int[] slice, int divisor)
{
	int[] result;

	result.reserve(slice.length);

	foreach (value; slice)
	{
		result ~= value / divisor;
	}

	return result;
}
// Returns the result of multiplying all of the elements by 'multiplier'
int[] multiply(int[] slice, int multiplier)
{
	int[] result;

	result.reserve(slice.length);

	foreach (value; slice)
	{
		result ~= value * multiplier;
	}

	return result;
}

// Filters out elements that have odd values
int[] evens(int[] slice)
{
	int[] result;

	result.reserve(slice.length);

	foreach (value; slice)
	{		
		if (value.isEven)
		{
			result ~= value;
		}
	}

	return result;
}
