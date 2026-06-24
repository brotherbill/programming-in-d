import std.stdio;
import core.bitop;

void main()
{
    uint ip = 0xC0_A8_01_02;
    auto address = IpAddress(ip);

    writeln("address.bytes: ", address.bytes);
    with (address.ipAddressBytes)
    {
        writefln("Bytes are    : [%s, %s, %s, %s]", byte0, byte1, byte2, byte3);
    }

    import std.system : endian, Endian;

    if (endian == Endian.littleEndian)
    {
        uint ipSwap = bswap(ip);
        auto addressSwap = IpAddress(ipSwap);
        writeln("ipSwap.bytes : ", addressSwap.bytes);
    }

}

union IpAddress
{
    uint value;
    ubyte[4] bytes;
    IpAddressBytes ipAddressBytes;
}

struct IpAddressBytes
{
    ubyte byte0;
    ubyte byte1;
    ubyte byte2;
    ubyte byte3;
}
