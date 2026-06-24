import std.stdio;

void main()
{
	bool condition = true;

	if (condition)
	{
		goto aLabel; // skips the constructor
	}

	auto s = S(42); // constructs the object properly

aLabel:
	s.bar(); // BUG: 's' may not be ready for use
}

struct S
{
	int integer;

	void bar()
	{
		writeln("integer is ", integer);
	}
}
