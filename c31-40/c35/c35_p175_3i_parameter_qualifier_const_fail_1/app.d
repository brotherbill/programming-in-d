import std.stdio : writeln;

// trim from the end
// trim from the beginning
void main()
{
    int[] numbers = [5, 6, 7, 8, 9];
    writeln("numbers before: ", numbers);
    writeln("inner(numbers): ", inner(numbers));
    writeln("numbers after : ", numbers);
}

int[] inner(const(int)[] slice) pure
{
    if (slice.length)
    {
        --slice.length;
        if (slice.length)
        {
            slice = slice[1 .. $];
        }
    }
    return slice;   // won't compile.  const(int)[] cannot be implicitly converted to int[]
}
