import std.stdio;

void main()
{
	unionSet;
	intersectionSet;
	setSelectedBitsToOne;
	clearSelectedBitsToZero;
	determinesWhetherBitIsSet;
	rightShiftByThreeSameAsDivideByEight;
	leftShiftByFiveSameAsMultiplyByThirtyTwo;
}

void print(uint number)
{
	writefln("  %032b %08x %10s", number, number, number);
}

void unionSet()
{
	uint lhs = 0xaaaaaaaa;
	uint rhs = 0x55555555;

	print(lhs);
	print(rhs);
	writeln("| --------------------------------");
	print(lhs | rhs);
	writeln;
}

void intersectionSet()
{
	uint lhs = 0xaaaaaaaa;
	uint rhs = 0x55555555;

	print(lhs);
	print(rhs);
	writeln("& --------------------------------");
	print(lhs & rhs);
	writeln;
}

void setSelectedBitsToOne()
{
	uint expression = 0x00ff00ff;
	uint bitsToSet = 0x10001000;
	write("before     :");
	print(expression);
	write("to set to 1:");
	print(bitsToSet);
	expression |= bitsToSet;
	write("after      :");
	print(expression);
	writeln;
}

void clearSelectedBitsToZero()
{
	uint expression = 0x00ff00ff;
	uint bitsToClear = 0xffefffef;
	write("before       :");
	print(expression);
	write("bits to clear:");
	print(bitsToClear);
	expression &= bitsToClear;
	write("after        :");
	print(expression);
	writeln;
}

void determinesWhetherBitIsSet()
{
	uint expression = 123456789;
	uint bitToQuery = 0x00010000;
	print(expression);
	print(bitToQuery);
	writeln(expression & bitToQuery ? "yes, 1" : "not 1");
	writeln;

	bitToQuery = 0x00001000;
	print(expression);
	print(bitToQuery);
	writeln(expression & bitToQuery ? "yes, 1" : "not 1");
	writeln;
}

void rightShiftByThreeSameAsDivideByEight()
{
	{
		uint value = 8000;
		writeln("8000 >> 3: ", value >> 3);
		writeln;
	}

	{
		int value = -8000;
		writeln("-8000 >> 3: ", value >> 3);
		writeln;
	}
}

void leftShiftByFiveSameAsMultiplyByThirtyTwo()
{
	uint value = 10;
	writeln("10 << 5: ", value << 5);
	writeln;
}
