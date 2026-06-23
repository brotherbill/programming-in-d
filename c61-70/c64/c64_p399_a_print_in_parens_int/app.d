import std.stdio;

void main()
{
	writeln("printInParens(42) is: ");
	printInParens(42);
}

void printInParens(int value)
{
	writefln("(%s)", value);
}
