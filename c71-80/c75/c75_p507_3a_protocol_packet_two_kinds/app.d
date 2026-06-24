import std.stdio;

void main()
{

}

struct Host
{
	// ...
}

struct ProtocolA
{
	// ...
}

struct ProtocolB
{
	// ...
}

enum ProtocolType
{
	A,
	B
}

struct NetworkPacket
{
	Host source;
	Host destination;
	ProtocolType type;

	union
	{
		ProtocolA aParts;
		ProtocolB bParts;
	}

	ubyte[] payload;
}
