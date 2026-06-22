import std.stdio : write, writeln;
import std.range : stride;

void main()
{
	// Stride through the string "abcçd" with a step of 1
	foreach (c; stride("abcçd", 1))
	{
		write("c has type: ", typeof(c).stringof, ", value: ");
		writeln(c);
	}
}
