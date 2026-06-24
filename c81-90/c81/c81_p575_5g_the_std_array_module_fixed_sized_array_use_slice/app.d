import std.stdio;
import std.array;
import std.range;

void main()
{
    int[4] array = [ 1, 2, 3, 4 ];
    print(array[]);	//  ← now compiles
}

void print(T)(T range) if (isInputRange!T)
{
    for (; !range.empty; range.popFront())  
    {
        write(' ', range.front);
    }

    writeln();
}
