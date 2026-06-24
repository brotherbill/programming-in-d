import std.stdio;

void main()
{
	auto object = S(42, "hello", 1.5);

	foreach (i, member; object.tupleof)
	{
		writefln("Member %s:", i);
		writefln("  type : %s", typeof(member).stringof);
		writefln("  value: %s", member);
	}
}

struct S
{
	int number;
	string message;
	double value;
}
