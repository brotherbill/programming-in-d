import std.stdio;
import std.array;

void main()
{
	int[4] array = [ 1, 2, 3, 4 ];
    print(array);
}

void print(T)(T range)
{
    for (; !range.empty; range.popFront())	//  ← compilation ERROR
    {
        write(' ', range.front);
    }

    writeln();
}
