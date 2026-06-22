import std.stdio : writeln;

void main()
{
	int[] oddNumbers   = [1, 3, 5, 7, 9, 11];
	int[] primeNumbers = [3, 5, 7, 11];
	bool aCondition    = true;

	size_t length      = oddNumbers.length;

	if (aCondition)
	{
		// length variable on line 14 shadows the outer one on line 9, which causes a compilation error
		size_t length = primeNumbers.length; // ← compilation ERROR
	}

	writeln("length: ", length);
}
