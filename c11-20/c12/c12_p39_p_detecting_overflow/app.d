import std.stdio;
import core.checkedint;

void main()
{
	// Start with in bounds addition
	int a      = 100;
	int b      =  25;
	int result = adder(a, b);

	writeln("adder(100, 25) = ", result);
	writeln();

	// Now try an addition that will overflow
	a = int.max - 1;
	b = 100;
	result = adder(a, b);

	writeln("adder(", a, ", ", b, ")", " = ", result);
}

int adder(int a, int b)
{
	bool hasOverflowed; // Initially false, which is .init value for bool
	int result = adds(a, b, hasOverflowed);

	if (hasOverflowed)
	{
		writeln("Overflow occurred in adder function! Can't add ", a, " and ", b);
	}
	return result;
}
