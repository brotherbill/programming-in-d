import std.stdio;

void main()
{
	int[] numbers;

	// Random numbers between -10 and 10
	foreach (i; 0 .. 10)
	{
		numbers ~= i * 3 + 1 - 10; // Just a placeholder for random numbers
	}

	writeln("input : ", numbers);

	auto handler = new NumberHandler(function bool(int number) {
		return number > 2;
	},
		function int(int number) { return number * 7; });
	writeln("result: ", handler.handle(numbers));
}

alias Predicate = bool function(int); // makes bool from int
alias Converter = int function(int); // makes int from int

class NumberHandler
{
	Predicate predicate;
	Converter converter;

	this(Predicate predicate, Converter converter)
	{
		this.predicate = predicate;
		this.converter = converter;
	}

	int[] handle(const int[] numbers)
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
}
