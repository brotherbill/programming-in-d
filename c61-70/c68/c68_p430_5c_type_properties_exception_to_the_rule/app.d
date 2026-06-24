import std.stdio;

void main()
{
	char c;
	char* p = &c;

	writeln("p.sizeof: ", p.sizeof); // size of the pointer, not the pointee
}
