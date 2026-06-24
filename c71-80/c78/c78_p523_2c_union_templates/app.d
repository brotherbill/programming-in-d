import std.stdio;

void main()
{
    auto address4 = IpAddress4(0xc0a80102);

    foreach (octet; address4.bytes)
    {
        write(octet, ' ');
    }
    writeln;

    auto address2 = IpAddress2(0xc0a80102);
    foreach (octet; address2.ushorts)
    {
        write(octet, ' ');
    }
    writeln;
}

union IpAddress4
{
    uint value;
    ubyte[4] bytes;
}

union IpAddress2
{
    uint value;
    ushort[2] ushorts;
}
