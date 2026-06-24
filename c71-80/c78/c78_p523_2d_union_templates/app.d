import std.stdio;

void main()
{
    auto address4 = SegmentedValue4!(int, ubyte)(0xc0a80102);
    foreach (octet; address4.segments)
    {
        write(octet, ' ');
    }
    writeln;

    auto address2 = SegmentedValue2!(int, ushort)(0xc0a80102);
    foreach (octet; address2.segments)
    {
        write(octet, ' ');
    }
    writeln;
}

union SegmentedValue4(ActualT, SegmentT)
{
    ActualT value;
    SegmentT[4] segments;
}

union SegmentedValue2(ActualT, SegmentT)
{
    ActualT value;
    SegmentT[2] segments;
}
