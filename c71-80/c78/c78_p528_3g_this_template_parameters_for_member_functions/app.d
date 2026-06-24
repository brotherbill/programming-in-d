import std.stdio;

void main()
{
	auto m = MyStruct!int();
	auto c = const(MyStruct!int)();
	auto i = immutable(MyStruct!int)();

	m.foo();
	c.foo();
	i.foo();
}

struct MyStruct(T)
{
	void foo(this OwnType)() const
	{
		writeln("Type of this object: ", OwnType.stringof);
	}
}
