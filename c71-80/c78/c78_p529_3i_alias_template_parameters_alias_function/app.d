import std.stdio;

void main()
{
	caller!foo();
	caller!bar();
}

void caller(alias func)()
{
	write("calling: ");
	func();
}

void foo()
{
	writeln("foo called.");
}

void bar()
{
	writeln("bar called.");
}
