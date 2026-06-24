import std.stdio;

void main()
{
    char[] m; // has mutable elements
    m ~= "hello";
    writefln("parenthesized(m): %s", parenthesized(m)); // ← compilation ERROR
}

string parenthesized(string phrase)
{
    return '(' ~ phrase ~ ')';
}
