import std.stdio;

void main()
{
    int a = 1;
    int b = 2;

    greater(a, b) += 10; // ← either a or b changes

    writefln("a: %s, b: %s", a, b);
}

ref int greater(ref int first, ref int second)
{
    return (first > second) ? first : second;
}
