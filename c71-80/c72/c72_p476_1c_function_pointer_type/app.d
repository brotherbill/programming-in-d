import std.stdio;

void main()
{
    int function(char, double) ptr = &myFunction;

    int result = ptr('X', 3.14);
    writeln("Result: ", result);
}

int myFunction(char c, double d)
{
    return 42;
}
