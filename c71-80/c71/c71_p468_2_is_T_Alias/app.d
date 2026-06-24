import std.stdio;

void main()
{
    static if (is(int AnIntByAnotherName))
    {
        writeln("int is a valid type");
        AnIntByAnotherName x = 42; // int and AnIntByAnotherName are the same type
        writeln("Value of x: ", x);
    }
    else
    {
        writeln("int is not a valid type");
    }
}
