import std.stdio : writeln, writefln;

void main()
{
	addition_operator_test;
	increment_i_test;
	increment_i_address_test;
}

void addition_operator_test() 
{
	int  a = 1;
	int  b = 2;

	// c gets initialized by the return value of the + operator
	auto c = a + b;

	writeln("=== addition operator test ===");
	writefln("typeof(c) is %s, c: %d", typeof(c).stringof, c);
	writeln;
}

void increment_i_test()
{
	int i = 1;

	writeln("=== increment operator test ===");
	writefln("++i: %d", ++i);
	writeln;
}


void increment_i_address_test() 
{
	int i = 1;
	writeln("=== increment operator address test ===");
	writeln("The address of i                : ", &i);
	writeln("The address of the result of ++i: ", &(++i));
	writeln;
	assert(&i == &(++i));

	i = 1;

	// First increment i, then multiply result by 10.
	(++i) *= 10;
	// Equivalent to:
	// ++i;
	// i *= 10;

	writefln("After (++i) *= 10;, i is: %d", i);
}
