void main()
{
	// uses Foo custom copy constructor
	auto var1 = new Foo(S(1.5), "hello", 42);

	// Foo has custom dup method
	auto var2 = var1.dup;
	assert(var1 !is var2);

	// Foo has custom idup method
	immutable(Foo) imm = var1.idup;
	// imm.i = 3;					// won't compile as imm is immutable
}

class Foo
{
	S      o; // S is a struct type
	char[] s;
	int    i;

	// ...

	// copy constructor
	this(S o, const char[] s, int i) pure
	{
		this.o = o;
		this.s = s.dup;  // this.s must not be shared with s
		this.i = i;
	}

	// Unlike structs, if you want idup defined, add it yourself
	immutable(Foo) idup() const pure
	{
		return new immutable(Foo)(o, s, i);
	}

	// Unlike structs, if you want dup defined, add it yourself
	Foo dup() const pure
	{
		return new Foo(o, s, i);
	}
}

struct S
{
	double weight;
}
