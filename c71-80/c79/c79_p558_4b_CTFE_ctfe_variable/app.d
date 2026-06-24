import std.stdio;

size_t counter;

void main()
{
	enum i = foo();
	auto j = foo();

	writefln("i: %s, j: %s", i, j);
	writefln("foo is called %s time%s.", counter, counter != 1 ? "s" : "");
}

int foo()
{
	if (!__ctfe)
	{
		// This code is for execution at run time
		++counter;
	}

	return 42;
}
