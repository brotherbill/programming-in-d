import std.stdio;

void main()
{
	writeln("printInParens(42) is: ");
	printInParens(42);
	writeln;

	writeln("printInParens(3.14) is: ");
	printInParens(3.14);
	writeln;
}

// The function that already exists
void printInParens(int value)
{
	writefln("int: (%s)", value);
}

// Overloading the function for 'double'
void printInParens(double value)
{
	writefln("double: (%s)", value);
}
