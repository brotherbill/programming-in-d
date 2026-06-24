import std.stdio;

void main()
{
	writeln("S.i.sizeof: ", S.i.sizeof);
	writeln("S.d.sizeof: ", S.d.sizeof);
	writeln("S.sizeof: ", S.sizeof);
	writeln("U.sizeof: ", U.sizeof);
}

struct S
{
	int i;
	double d;
}

union U
{
	int i;
	double d;
}
