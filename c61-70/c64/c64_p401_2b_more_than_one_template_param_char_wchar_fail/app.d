import std.stdio;

void main()
{
    printInParens(42, '<', '>');
    printInParens(42, '→', '←');	// won't compile
}

void printInParens(T)(T value, char opening, char closing)
{
    writeln(opening, value, closing);
}
