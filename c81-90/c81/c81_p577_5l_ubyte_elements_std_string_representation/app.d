import std.stdio;
import std.array;
import std.string;

void main()
{
	char[] s = "hello".dup;

	s.representation.front = 'H';	// compiles
	writeln("s.representation: ", s.representation);
	writeln("s: ", s);

	assert(s == "Hello");
}
