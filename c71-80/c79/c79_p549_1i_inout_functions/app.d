import std.stdio;

void main()
{
    string helloWrap = parenthesized("hello");
    writefln("helloWrap: %s", helloWrap);
}

string parenthesized(string phrase)
{
    return '(' ~ phrase ~ ')';
}
