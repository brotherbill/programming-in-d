import std.stdio;

// import std.random

void main()
{
	int[] numbers;

	// Random numbers between -10 and 10
	foreach (i; 0 .. 10)
	{
		numbers ~= i * 3 + 1 - 10; // Just a placeholder for random numbers
	}

	writeln("input : ", numbers);
	writeln("output > 0, * 10: ", filterAndConvert(numbers, &isGreaterThanZero, &tenTimes));
	writeln("output even, negative: ", filterAndConvert(numbers, &isEven, &negativeOf));
	writeln("output lambda        : ", filterAndConvert(numbers, number => number % 2 == 0, number => -number));
}

alias Predicate = bool function(int); // makes bool from int
alias Converter = int function(int); // makes int from int

bool isGreaterThanZero(int number)
{
	return number > 0;
}

int tenTimes(int number)
{
	return number * 10;
}

bool isEven(int number)
{
	return (number % 2) == 0;
}

int negativeOf(int number)
{
	return -number;
}

int[] filterAndConvert(const int[] numbers, Predicate predicate, Converter converter)
{
	int[] result;

	foreach (number; numbers)
	{
		if (predicate(number))
		{
			immutable newNumber = converter(number);
			result ~= newNumber;
		}
	}

	return result;
}
