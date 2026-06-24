import std.stdio;

void main()
{
	auto quotRem = fancyDivide(19, 7);
	writeln(quotRem);
}

struct QuotientRemainder {
	int quotient;
	int remainder;
}

QuotientRemainder fancyDivide(int numerator, int denominator) 
in {
	assert(denominator != 0, "denominator may not be zero");
}
do {
	int quotient = numerator / denominator;
	int remainder = numerator % denominator;

	return QuotientRemainder(quotient, remainder);
}