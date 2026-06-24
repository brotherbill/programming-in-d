import std.stdio;
import std.array;

void main()
{
    print([1, 2, 3, 4]);
}

void print(T)(T range)
{
    for (; !range.empty; range.popFront())
    {
        write(' ', range.front);
    }

    writeln();
}
