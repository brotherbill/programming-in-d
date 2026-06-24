import std.stdio;

void main()
{
	writeln("S.sizeof(): ", S.sizeof);

	S s = {first: 86, third: 99};
	writefln("s.first: %s, s.second: %s, s.third: %s", s.first, s.second, s.third);
}

struct S
{
	int first;

	union
	{
		int second;
		int third;
	}
}
