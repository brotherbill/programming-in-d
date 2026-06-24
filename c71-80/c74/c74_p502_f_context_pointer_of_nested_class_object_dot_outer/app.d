import std.stdio;

void main()
{
	foo;
}

void foo()
{
	class C
	{
	}

	auto a = new C();
	auto b = new C();

	assert(a.outer is b.outer);
}
