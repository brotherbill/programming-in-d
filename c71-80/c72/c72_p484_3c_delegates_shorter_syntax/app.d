import std.stdio;

void main()
{
	writeln(delimitedNumbers(3, () => 42));

	int lastNumber;
	int counter3;

	writeln(delimitedNumbers(15, () => lastNumber += (++counter3 % 3)));
	writeln("Last number: ", lastNumber);

}

int[] delimitedNumbers(int count, int delegate() numberGenerator)
{
	int[] result = [-1];

	result.reserve(count + 2);

	foreach (i; 0 .. count)
	{
		result ~= numberGenerator();
	}

	result ~= -1;

	return result;
}
