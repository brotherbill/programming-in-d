import std.stdio;

void main()
{
    auto numbers = [-100, 0, 1, 2, 7, 10, 42, 365, 1000];
    auto index = binarySearch(numbers, 42);

    writeln("Index: ", index);
}

size_t binarySearch(const int[] values, int value)
{
    debug writefln("searching %s among %s", value, values);

    if (values.length == 0)
    {
        debug writefln("%s not found", value);
        return size_t.max;
    }

    immutable midPoint = values.length / 2;

    debug writefln("considering index %s", midPoint);

    if (value == values[midPoint])
    {
        debug writefln("found %s at index %s", value, midPoint);
        return midPoint;

    }
    else if (value < values[midPoint])
    {
        debug writefln("must be in the first half");
        return binarySearch(values[0 .. midPoint], value);

    }
    else
    {
        debug writefln("must be in the second half");
        return binarySearch(values[midPoint + 1 .. $], value);
    }
}
