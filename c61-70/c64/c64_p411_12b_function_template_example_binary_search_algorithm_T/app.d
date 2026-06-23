import std.stdio;
import std.conv : to;
import binary_search;

void main()
{
    int[] values = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31];
    size_t loc19 = binarySearch(values, 19);
    writeln("19 is at index: ", loc19); // Should print 7

    size_t loc4 = binarySearch(values, 4);
    writeln("4 is at index: ", loc4 == size_t.max ? "not found" : to!string(loc4)); // Should print not found
}
