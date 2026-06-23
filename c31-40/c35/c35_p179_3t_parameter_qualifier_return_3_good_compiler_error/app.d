// return ref is conventional.  ref return will also work.
ref int pick(return ref int lhs, return ref int rhs)
{
	import std.random;

	return uniform(0, 2) ? lhs : rhs;
}

// Now line 17 is "caught" by the compiler, rejecting it.
ref int foo()
{
	int a;
	int b;

	// Compiler catches this error now!
	// returning `pick(a, b)` escapes a reference to local variable `a`
	return pick(a, b); 
}

// This version is correct.
ref int better_foo()
{
	static int a;
	static int b;
	return pick(a, b); // compiles OK
}

// The D compiler now catches this error!
void main()
{
	foo() = 42; 		// ← BUG: writing to invalid memory
	better_foo() = 42; 	// OK
}
