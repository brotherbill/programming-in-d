void main()
{
	import std.stdio : writefln;
	
	int a;
	int b;

	pick(a, b) = 42;

	writefln("a: %s, b: %s", a, b);
}

ref int pick(ref int lhs, ref int rhs)
{
	import std.random : uniform;

	return uniform(0, 2) ? lhs : rhs;
}
