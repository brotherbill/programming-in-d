import std.stdio;

void main()
{
	ubyte[128] buffer;				// A memory area of 128 bytes
	void[128]  voidBuffer = void;  	// A memory area of 128 bytes, not initialized to zeroes

	writeln("buffer    : ", typeof(buffer).stringof);
	writeln("&buffer   : ", &buffer);
	writeln("&voidBuffer  : ", &voidBuffer);
	writeln("Difference: ", cast(ubyte *)&voidBuffer - cast(ubyte *)&buffer);
	writeln;
}
