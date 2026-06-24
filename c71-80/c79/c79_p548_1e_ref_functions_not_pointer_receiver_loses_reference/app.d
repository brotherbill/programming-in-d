import std.stdio;

void main()
{
    int a = 1;
    int b = 2;

    int result = greater(a, b); // ← equivalent to result = a; or result = b;
    result += 10; // ← only result changes

    writefln("a: %s, b: %s, result: %s", a, b, result);
}

ref int greater(ref int first, ref int second)
{
    return (first > second) ? first : second;
}
