import std.stdio;

void main()
{
	auto fraction = Fraction(1, 4); // meaning 1/4
	writeln(calculate(fraction, 0.75));
}

struct Fraction
{
	long numerator;
	long denominator;

	double value() const
	{
		writeln("Converting Fraction to double...");
		return double(numerator) / denominator;
	}

	alias value this; // implicitly call Fraction.value() when converting to double
}

double calculate(double lhs, double rhs)
{
	return (2 * lhs) + rhs;
}
