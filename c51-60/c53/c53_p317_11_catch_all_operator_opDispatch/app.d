import std.stdio : writefln;

void main()
{
	Foo foo;
	foo.bar();	// Won't compile.  bar is not defined in Foo, but opDispatch is defined for this signature.
	// foo.baz(99); // Won't compile.  baz is not defined in Foo, and opDispatch not defined for this signature.
	int result = foo.aNonExistentFunction(42, "Meaning");
	writefln("Result of calling aNonExistentFunction: %s", result);
	foo.anotherNonExistentFunction(88, "piano keys");
}

struct Foo
{
	int opDispatch(string name)(int parameter, string parameter2)
	{
		writefln("Foo.opDispatch - function name: %s, parameter value: %s, parameter2 value: %s",
			name, parameter, parameter2);
		return 42;
	}

	void opDispatch(string name)()
	{
		writefln("Foo.opDispatch - function name: %s", name);
	}
}
