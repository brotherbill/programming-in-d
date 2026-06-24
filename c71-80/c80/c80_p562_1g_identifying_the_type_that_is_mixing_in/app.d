import std.stdio;

void main()
{
	auto a = MyStruct();
	a.foo();
}

mixin template MyMixin(T)
{
	void foo(this MixingType)()
	{
		import std.stdio : writefln;

		writefln("The actual type that is mixing in: %s", MixingType.stringof);
	}
}

struct MyStruct
{
	mixin MyMixin!(int);
}
