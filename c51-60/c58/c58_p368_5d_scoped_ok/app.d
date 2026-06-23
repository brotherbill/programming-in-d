import std.stdio;
import std.typecons;

void main()
{
	makeItWork;
}

class MyClass
{
	void foo() inout {
		writeln("foo()");
	}
}

void makeItWork()
{
	auto a = scoped!MyClass();
	const c = scoped!MyClass();
	immutable i = scoped!MyClass();

	a.foo();
	c.foo();
	i.foo();
}
