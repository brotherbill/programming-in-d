import std.stdio;

void main()
{
	writeln("Start of program");

	goto two;
	writeln("One"); two: writeln("Two");

	writeln("End of program");
}
