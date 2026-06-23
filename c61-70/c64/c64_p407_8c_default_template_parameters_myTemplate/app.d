import std.stdio;

void main()
{
	myTemplate!string("foo", 42, 'D');
}

void myTemplate(T0, T1 = int, T2 = char)(T0 a, T1 b, T2 c)
{
	writefln("T0: %s, T1: %s, T2: %s", a, b, c);
}
