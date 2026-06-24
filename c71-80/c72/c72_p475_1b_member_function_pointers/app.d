import std.stdio;

void main()
{
	auto o = MyStruct();

	auto f = &MyStruct.func;	// on a type
	auto d = &o.func; 			// on an object

	static assert(is(typeof(f) == void function()));
	static assert(is(typeof(d) == void delegate()));
}

struct MyStruct
{
	void func()
	{
		writeln("Hello from MyStruct.func");
	}
}
