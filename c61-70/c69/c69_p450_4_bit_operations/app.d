import std.stdio;

void main()
{
	print(123456789);
	writeln;

	printComplementOperatorTilde;
	printAndOperatorAmpersand;
	printOrOperatorPipe;
	printXorOperatorCarrot;
	printRightShiftOperatorGtGt;
	printRightShiftOperatorGtGtNegative;
	printRightShiftOperatorGtGtLeftmostBitZero;
	printUnsignedRightShiftOperatorGtGtGt;
	printLeftShiftOperatorLtLt;
	printOperatorsWithAssignment;
}

void print(uint number)
{
	writefln("  %032b %08x %10s", number, number, number);
}

void printComplementOperatorTilde()
{
	uint number = 123456789;
	print(number);
	writeln("~ --------------------------------");
	print(~number);
	writeln;
}

void printAndOperatorAmpersand()
{
	uint lhs = 123456789;
	uint rhs = 987654321;
	print(lhs);
	print(rhs);
	writeln("& --------------------------------");
	print(lhs & rhs);
	writeln;
}

void printOrOperatorPipe()
{
	uint lhs = 123456789;
	uint rhs = 987654321;
	print(lhs);
	print(rhs);
	writeln("| --------------------------------");
	print(lhs | rhs);
	writeln;
}

void printXorOperatorCarrot()
{
	uint lhs = 123456789;
	uint rhs = 987654321;
	print(lhs);
	print(rhs);
	writeln("^ --------------------------------");
	print(lhs ^ rhs);
	writeln;
}

void printRightShiftOperatorGtGt()
{
	uint value = 123456789;
	print(value);
	writeln(">> -------------------------------");
	print(value >> 2);
	writeln;
}

void printRightShiftOperatorGtGtNegative()
{
	int value = 0x80010300;
	print(value);
	writeln(">> -------------------------------");
	print(value >> 3);
	writeln;
}

void printRightShiftOperatorGtGtLeftmostBitZero()
{
	int value = 0x40010300;
	print(value);
	writeln(">> -------------------------------");
	print(value >> 3);
	writeln;
}

void printUnsignedRightShiftOperatorGtGtGt()
{
	int value = 0x80010300;
	print(value);
	writeln(">>> ------------------------------");
	print(cast(uint) value >>> 3);
	writeln;
}

void printLeftShiftOperatorLtLt()
{
	uint value = 123456789;
	print(value);
	writeln("<< -------------------------------");
	print(value << 4);
	writeln;
}

void printOperatorsWithAssignment()
{
	uint value = 123456789;
	print(value);
	writeln("Operators with Assignment ----------");
	value &= 987654321;
	print(value);
	value |= 123456789;
	print(value);
	value ^= 987654321;
	print(value);
	value <<= 3;
	print(value);
	value >>= 2;
	print(value);
	value = cast(uint)(cast(int) value >> 2); // simulate >>>= for signed int
	print(value);
	writeln;
}
