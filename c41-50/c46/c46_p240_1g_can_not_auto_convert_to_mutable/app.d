import std.stdio : writeln;

void main()
{
	char[] greeting;
	greeting ~= "hello world";
	writeln(parenthesized(greeting));
	writeln;
	valueCopiesAreOk;
}

char[] parenthesized(const char[] text)
{
	// This is a compilation error as both argument and text are references.
	// If allowed, this would allow mightyMutator to reference the same underlying character array as text.
	// This would bust through the const promise, so D cannot allow this.
	char[] mightyMutator = text; // ← compilation ERROR

	return "{" ~ text ~ "}";
}

void valueCopiesAreOk()
{
	const int totalCorners = 4;
	int theCopy = totalCorners;
	theCopy *= 2;

	writeln("totalCorners: ", totalCorners);
	writeln("theCopy     : ", theCopy);
}
