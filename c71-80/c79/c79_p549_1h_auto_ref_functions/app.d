import std.stdio;

void main()
{
    string* ptrSum = &parenthesized("2 + 3");
    string sum = parenthesized("4 * 5");

    writefln("ptrSum : %s %s", ptrSum, *ptrSum);
    writefln("sum    : %s", sum);
}

auto ref string parenthesized(string phrase)
{
    string result = '(' ~ phrase ~ ')';
    writeln("&result: ", &result);
    return result; // ← compiles
}
