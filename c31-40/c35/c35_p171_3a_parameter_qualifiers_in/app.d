import std.stdio : writeln;

void main()
{
	int remainder = 42;

	// Unlike C#, no explicit 'out' keyword is needed or allowed here
	immutable quotient = divide(7, 3, /* out */ remainder);
	writeln(" 9 In main,   quotient: ", quotient, ",   remainder: ", remainder);
}

int divide(in int dividend, in int divisor, out int remainder)
{
	assert(remainder == int.init && remainder == 0);
	writeln("15 In divide, remainder is initially  : ", remainder);

	remainder = dividend % divisor;
	writeln("18 In divide, remainder is computed as: ", remainder);

	immutable quotient = dividend / divisor;
	writeln("21 In divide, quotient  is computed as: ", quotient);
	writeln;

	return quotient;
}
