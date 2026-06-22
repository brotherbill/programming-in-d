import std.stdio;

void main()
{
	string cannotBeMutated = "greetings";
	// cannotBeMutated[0] = 'G'; // This will cause a compilation error

	// char[] aSlice = "greetings"; // This is a mutable slice of characters, but not a string, so won't compile

	char[] mutableSlice = "greetings".dup; // This creates a mutable slice of characters
	mutableSlice[0] = 'G'; // This is allowed, as mutableSlice is mutable
	writeln("Mutable slice: ", mutableSlice);
	writeln();

	// string result = mutableSlice ~ '.';	// Can't assign a mutable slice to a string directly, so this doesn't compile
	string result = (mutableSlice ~ '.').dup; // This creates a new string from the mutable slice
	writeln("Resulting string  : ", result);

	// This is preferred over .dup, as it avoids unnecessary copying
	string result2 = (mutableSlice ~ '.').idup; // This also creates a new string from the mutable slice
	writeln("Resulting string 2: ", result2);
}
