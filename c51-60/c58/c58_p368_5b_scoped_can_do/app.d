import std.stdio;
import std.typecons;

void main()
{
	autoWorks;
	constWorks;
	immutableWorks;
}

class C
{
	void foo() const
	{
		writeln("foo");
		writeln;
	}
}

void autoWorks()
{
	auto c = scoped!C();
	writeln("autoWorks");
	c.foo(); // Proxy object c is being used as type C
}

void constWorks()
{
	const c = scoped!C();
	writeln("constWorks");
	c.foo(); // Proxy object c is being used as type C
}

void immutableWorks()
{
	immutable c = scoped!C();
	writeln("immutableWorks");
	c.foo(); // Proxy object c is being used as type C
}
