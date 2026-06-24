import std.stdio;

void main()
{
    writeln(sum(4), ", ", sumRecursive(4));
}

int sum(int last)
{
    int result = 0;

    foreach (value; 0 .. last + 1)
    {
        result += value;
    }
    return result;
}

int sumRecursive(int last)
{
    return (last == 0 ? last : last + sumRecursive(last - 1));
}
