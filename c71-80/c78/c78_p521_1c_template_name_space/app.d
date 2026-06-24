import std.stdio;

alias MyStruct = MyTemplate!dchar.S;

void main()
{
	auto result = MyTemplate!int.foo(42);
	writeln("MyTemplate!int.foo(42)  : ", result);

	auto s = MyTemplate!double.S(5.6);
	writeln("MyTemplate!double.S(5.6): ", s.member);

	auto o = MyStruct('a');
	writeln("MyStruct('a')           : ", o.member);
}

template MyTemplate(T)
{
	T foo(T value)
	{
		return value / 3;
	}

	struct S
	{
		T member;
	}
}
