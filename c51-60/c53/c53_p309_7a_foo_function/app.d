import std.stdio : writeln, writefln;

void main()
{
	Foo foo;
	foo();
	foo("your new AI management");
}

struct Foo
{
	// use struct instance as a method.
	void opCall() const
	{
		writeln("Greetings from foo fighters!");
	}

	// use struct instance as a method, with a parameter
	void opCall(in string greeter) const
	{
		writefln("Greetings from %s!", greeter);
	}
}
