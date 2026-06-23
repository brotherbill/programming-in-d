import std.stdio;

void main()
{
    printInParens(42, '<', '>');
}

void printInParens(T)(T value, char opening, char closing)
{
    writeln(opening, value, closing);
}
