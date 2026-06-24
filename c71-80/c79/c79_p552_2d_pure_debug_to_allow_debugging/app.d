import std.stdio;

size_t fooCounter;

void foo(int i) pure
{
	debug ++fooCounter; // mutating module level variable

	if (i == 0)
	{
		debug writeln("i is zero");
		i = 42; // Changes local variable, which is discarded on return
	}
}

void main()
{
	foreach (i; 0 .. 100)
	{
		if ((i % 10) == 0)
		{
			foo(i);
		}
	}

	debug writefln("foo is called %s times", fooCounter);
}
