import std.stdio;

void main()
{
	auto f = Foo();

	writeln(f.a, ": ", typeof(f.a).stringof);
	writeln(f.b, ": ", typeof(f.b).stringof);
}

struct Foo
{
	@property int a() const
	{
		return 42;
	}

	int b() const	// ← Defined without @property
	{ 
		return 42;
	}
}
