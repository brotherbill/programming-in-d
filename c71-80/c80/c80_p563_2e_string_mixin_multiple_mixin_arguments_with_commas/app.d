import std.stdio;

void main()
{
	mixin("const a = ", int.sizeof, ";");

	writeln("a: ", a);
}
