import std.stdio;

void main()
{
	int twiceInt = twice(42);
	writeln("twiceInt: ", twiceInt);

	double twiceDouble = twice!double(3.14);
	writeln("twiceDouble: ", twiceDouble);
}

template twice(T)
{
	T twice(T value)
	{
		return 2 * value;
	}
}

template Fraction(T)
{
	class Fraction
	{
		T numerator;
		T denominator;
	}
	// ...
}
