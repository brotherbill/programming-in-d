import std.stdio;

void main()
{
    printInParens(42, '→', '}');        // type: int, wchar
    printInParens(1.2, "--> ", " <--"); // type: double, string
}

void printInParens(T, ParensType)(T value, ParensType opening, ParensType closing)
{
    writeln(opening, value, closing);
}
