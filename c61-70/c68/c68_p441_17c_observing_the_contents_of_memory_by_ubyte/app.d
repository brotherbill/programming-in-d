import std.stdio;

void main()
{
	int variable = 0x01_02_03_04;
	int* address = &variable;
	ubyte* bytePointer = cast(ubyte*) address;

	writeln(bytePointer[0]);
	writeln(bytePointer[1]);
	writeln(bytePointer[2]);
	writeln(bytePointer[3]);
}
