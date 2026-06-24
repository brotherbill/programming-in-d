import std.stdio;

void main()
{
	foo();
}

// This template is impure when N is zero
void templ(size_t N)()
{
	static if (N == 0)
	{
		// Prints when N is zero:
		writeln("zero");
	}
}

void foo() pure
{
	templ!0(); // ← compilation ERROR
}
