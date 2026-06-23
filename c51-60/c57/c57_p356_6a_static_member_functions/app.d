import std.stdio : writeln;

void main()
{
	auto object0 = Foo();
	auto object1 = Foo();

	object0.modify(10); // object0.i changes
	object1.modify(10); // object1.i changes
}

struct Foo
{
	int i;

	void modify(int value)
	{
		i      = value;
		this.i = value; // duplicate code to demonstrate using this.
	}
}
