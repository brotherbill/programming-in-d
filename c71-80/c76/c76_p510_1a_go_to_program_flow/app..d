import std.stdio;

void main()
{
	writeln("TRUE");
	foo(true);

	writeln;

	writeln("FALSE");
	foo(false);
}

void foo(bool condition)
{
	writeln("first");

	if (condition)
	{
		goto end;
	}

	writeln("second");

end:
	writeln("third");
}
