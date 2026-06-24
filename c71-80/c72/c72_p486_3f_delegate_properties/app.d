import std.stdio;

void main()
{
	auto o = MyStruct(); // Parentheses are necessary
	auto d = &o.func;

	assert(d.funcptr == &MyStruct.func);
	assert(d.ptr == &o);
}

struct MyStruct
{
	void func()
	{
		writeln("In MyStruct.func()");
	}
}
