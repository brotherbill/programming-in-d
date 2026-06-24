import std.stdio;

void main()
{
	char[] m; // has mutable elements
	m ~= "hello";
	writefln("parenthesized(m): %s", parenthesized(m));
}

T parenthesized(T)(T phrase)
{
	return '(' ~ phrase ~ ')';
}
