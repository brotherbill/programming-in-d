import std.stdio;

void main()
{
	// A lambda that returns 'a + 1'
	auto l0 = (int a) => a + 1;

	// Obsolete syntax for a lambda that returns 'a + 1'
	// Will not compile in D24 and later
	auto lbad = (int a) => { return a + 1; };

	// A lambda that returns 'a + 1' using the function body syntax
	auto l1 = (int a) { return a + 1; };

	assert(l0(42) == 43);
	assert(l1(42) == 43);
}
