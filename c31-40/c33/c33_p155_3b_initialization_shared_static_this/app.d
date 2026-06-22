import std.stdio;

immutable int[] i = [10, 20, 30];
immutable (int[]) j = [10, 20, 30];	// Same as above

// This fails to compile. Have ticket in Dlang learn forum.
shared static this() {
	writeln("In shared static this()");
	// i[0] = 11;	// won't compile, because i is immutable
	// i ~= 43;		// won't compile, because i is immutable
	// j[0] = 11;	// won't compile, because i is immutable
	// j ~= 43;		// won't compile, because i is immutable
}

void main()
{
	writeln("In main()");
	writeln("i: ", i);
}
