import std.stdio : writeln, writefln;

// Do not confuse this with a mixin template!
dchar[] mix(immutable dchar[] first, dstring second)
in (first != null && second != null)
out (result; result.length == first.length + second.length)
{
	writefln(" 8: first  has type: %s", typeof(first).stringof);
	writefln(" 9: second has type: %s", typeof(second).stringof);
	writeln;

	dchar[] result;
	int i;

	for (i = 0; (i < first.length) && (i < second.length); ++i)
	{
		result ~= first[i];		// alternate appending characters
		result ~= second[i];	// from each string
	}

	result ~= first [i .. $];	// append any remaining characters
	result ~= second[i .. $];   // from either string

	return result;
}

void main()
{
	writeln("29: ", mix("HELLO", "worldly d-programmers!"));

	const dchar[] firstPart  = "GREETINGS";			
	const dstring secondPart = "earthlings!";		// dstring is an alias for immutable(dchar)[]
	// writeln("33: ", mix(firstPart, secondPart));	// won't compile as firstPart is not immutable.  const is not immutable.
	writefln("34: secondPart has type: %s", typeof(secondPart).stringof);

	dchar[] firstPart2 = "GREETINGS"d.dup;
	// writeln("37: ", mix(firstPart2, secondPart));	// won't compile as firstPart2 is not immutable
}
