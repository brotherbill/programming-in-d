import std.stdio;

void main()
{
	test1;
	writeln;

	test2_sign_bit;
	writeln;

	test3_unsigned_int;
}

void test1()
{
	//               1073741824                     4 1
	//               ↓                              ↓ ↓
	int number = 0b_01000000_00000000_00000000_00000101;
	writeln(number);
}

void test2_sign_bit()
{
	int number = 0b_10000000_00000000_00000000_00000000;
	writeln(number);
}

void test3_unsigned_int()
{
	uint number = 0b_10000000_00000000_00000000_00000000;
	writeln(number);
}
