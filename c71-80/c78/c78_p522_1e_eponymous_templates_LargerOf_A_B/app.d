import std.stdio;

void main()
{
	auto f = calculate(1, 2L);
	static assert(is(typeof(f) == long));
	writeln("is(typeof(f) == long): ", is(typeof(f) == long));
}

template LargerOf(A, B)
{
	static if (A.sizeof < B.sizeof)
	{
		alias LargerOf = B;
	}
	else
	{
		alias LargerOf = A;
	}
}

// The return type of this function is the larger of its two template parameters: Either type A or type B
auto calculate(A, B)(A a, B b)
{
	LargerOf!(A, B) result;
	// ...
	return result;
}
