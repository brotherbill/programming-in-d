import std.stdio;

void main()
{
    printInParens(42, '<', '>');
    printInParens(42, '→', '←');
    printInParens(42, '→', '}');
    printInParens(1.2, "-=", "=-");
}

void printInParens(T, ParensType)(T value, ParensType opening, ParensType closing)
{
    writeln(opening, value, closing);
}
