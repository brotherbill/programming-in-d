import std.stdio : writeln;

void main()
{
    int[] numbers = [5, 6, 7, 8, 9];
    writeln("numbers before: ", numbers);
    writeln("inner(numbers): ", inner(numbers));
    writeln("numbers after : ", numbers);
    writeln;

    int[] middle = inner(numbers); //  ← compilation ERROR.  Cannot implicitly convert from const(int)[] to int[]
    middle[] *= 10;
}

const(int)[] inner(const(int)[] slice) pure
{
    if (slice.length)
    {
        --slice.length;
        if (slice.length)
        {
            slice = slice[1 .. $];
        }
    }
    return slice;
}
