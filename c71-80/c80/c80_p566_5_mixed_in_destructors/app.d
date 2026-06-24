import std.stdio;

mixin template Foo()
{
	~this()
	{
		writeln("Destructor mixed-in by Foo");
	}
}

mixin template Bar()
{
	~this()
	{
		writeln("Destructor mixed-in by Bar");
	}
}

struct S
{
	~this()
	{
		writeln("Actual destructor");
	}

	mixin Foo;
	mixin Bar;
}

void main()
{
	auto s = S();
}
