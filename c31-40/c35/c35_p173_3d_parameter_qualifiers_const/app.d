import std.stdio : writeln;

dchar lastLetter(const dchar[] str)
in (str !is null && str.length > 0)
out (result; result == str[$ - 1])
do
{
	return str[$ - 1];
}

void main()
{
	const char[] testStr = "Hello, World!";
	// Won't compile because lastLetter expects dchar[], not char[]
	// writeln("The last letter of '", testStr, "' is: ", lastLetter(testStr));

	const dchar[] testStr2 = "Hello, World!";
	writeln("18 The last letter of \"", testStr2, "\" is: ", lastLetter(testStr2));

	immutable char[] anotherStr = "D Programming Language";
	// Won't compile because lastLetter expects dchar[], not char[]
	// writeln("The last letter of '", anotherStr, "' is: ", lastLetter(anotherStr));

	immutable dchar[] anotherStr2 = "D Programming Language";
	writeln("25 The last letter of \"", anotherStr2, "\" is: ", lastLetter(anotherStr2));

	char[] mutableStr = "Mutable String Example?".dup;
	// Won't compile because lastLetter expects dchar[], not char[]
	// writeln("The last letter of '", mutableStr, "' is: ", lastLetter(mutableStr));

	dchar[] mutableStr2 = "Mutable String Example?"d.dup;
	writeln("32 The last letter of '", mutableStr2, "' is: ", lastLetter(mutableStr2));

	writeln("34 The last letter of 'constant' is ", lastLetter("constant"));
}
