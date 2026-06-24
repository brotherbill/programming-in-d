import std.stdio;
import std.array;

void main()
{
	// The dchar that is returned by front is constructed from the two characters that represent é
	dchar letter = "é".front;

	writeln(letter);
}
