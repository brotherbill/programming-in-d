import std.stdio;

void main()
{
    int[] mySlice = [10, 20, 30];
    mySlice = append(mySlice);
    writeln(mySlice);
}

// A function that takes advantage of the GC indirectly
int[] append(int[] slice)
{
    slice ~= 42;
    return slice;
}
