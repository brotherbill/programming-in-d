import std.stdio : writefln;

void main()
{
	Test t; // no values are specified for the members, so use default values from lines 14 - 16.
	writefln("%s, %s, %s", t.c, t.i, t.d);


	Test x = Test('X', 42);  // x.c == 'X'  x.i == 42  x.d == 0.25 from line 16.
	writefln("%s, %s, %s", x.c, x.i, x.d);
}

struct Test
{
	char   c = 'A';
	int    i = 11;
	double d = 0.25;
}
