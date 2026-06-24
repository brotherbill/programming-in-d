import std.stdio;

void main()
{
	int[] numbers = [1, 8, 6, -2, 10];
	int[] chosen = filter!"number < 7"(numbers);
	writeln("chosen: ", chosen);
}

int[] filter(string predicate)(int[] numbers)
{
	int[] result;

	foreach (number; numbers)
	{
		if (mixin(predicate))
		{
			result ~= number;
		}
	}

	return result;
}
