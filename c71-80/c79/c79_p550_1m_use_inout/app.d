import std.stdio;

void main()
{
	char[] m = cast(char[]) "mello";
	writeln(parenthesized(m), ", ", typeof(parenthesized(m)).stringof);

	const(char)[] c = "cello";
	writeln(parenthesized(c), ", ", typeof(parenthesized(c)).stringof);

	immutable(char)[] i = "iello";
	writeln(parenthesized(i), ", ", typeof(parenthesized(i)).stringof);
}

inout(char)[] parenthesized(inout(char)[] phrase)
{
	return '(' ~ phrase ~ ')';
}
