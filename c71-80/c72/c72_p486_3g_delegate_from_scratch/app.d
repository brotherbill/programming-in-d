import std.stdio;

void main()
{
	auto o = MyStruct(42);
	void delegate() d;

	assert(d is null); // null to begin with

	d.funcptr = &MyStruct.func;
	d.ptr = &o;
	d();
}

struct MyStruct
{
	int i;

	void func()
	{
		writeln(i);
	}
}
