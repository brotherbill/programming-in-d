import std.stdio;

void main()
{
	auto object = new Sub;
	object.foo(42); // Calls Super's foo, but no, it is hidden!
}

class Super
{
	void foo(int x)
	{
		writeln("Super foo: ", x);
	}
}

class Sub : Super
{
	void foo()
	{
		writeln("Sub foo with no args"); // ← compilation ERROR: hides Super.foo(int)
	}
}
