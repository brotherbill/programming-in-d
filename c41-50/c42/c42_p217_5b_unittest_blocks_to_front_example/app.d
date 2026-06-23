import std.stdio : writeln;

void main()
{

}

dstring toFront(dstring str, dchar letter)
{
	return ""; // initial implementation
}

unittest
{
	immutable str = "hello"d;

	assert(toFront(str, 'h') == "hello");
	assert(toFront(str, 'o') == "ohell");
	assert(toFront(str, 'l') == "llheo");
}
