import std.stdio;

void main()
{
	foo!(42);
	foo!(0);

}

void foo(int value)()
{
	// ... general definition ...
	writeln("foo: ", value);
}

void foo(int value : 0)()
{
	// ... special definition for zero ...
	writeln("foo(0) specialization");
}
