import std.stdio;

void main()
{
    int[1] items = [42];
    foo!(int[1])(items);

    int[2] twins = [86, 99];
    foo!(int[2])(twins);
}

// Short form template
void foo(T)(T items) if (T.length == 1)
{
    writeln("foo(0): ", items[0]);
}

void foo(T)(T items) if (T.length == 2)
{
    writeln("foo(0): ", items[0], ", and foo(1): ", items[1]);
}
