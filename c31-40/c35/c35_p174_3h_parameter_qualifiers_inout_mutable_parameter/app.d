import std.stdio : write, writeln;

void main()
{
	int[] numbers = [5, 6, 7, 8, 9];
	
	writeln("--- mutable slice test ---");
	writeln("numbers before: ", numbers);
	writeln("inner(numbers):    ", inner(numbers));
	writeln("numbers after : ", numbers);
	writeln;

	writeln("--- const slice test ---");
	writeln("numbers before: ", numbers);
	writeln("inner(numbers):    ", inner(cast(const(int)[])numbers));
	writeln("numbers after : ", numbers);
	writeln;

	writeln("--- immutable slice test ---");
	writeln("numbers before: ", numbers);
	writeln("inner(numbers):    ", inner(numbers.idup));
	writeln("numbers after : ", numbers);
	writeln;
}

// /+
// Three overloads of the same function 'inner', each for a different type of slice: mutable, const, and immutable.
int[] inner(int[] aSlice) pure
{
	debug writeln("inner(", typeof(aSlice).stringof, ")\t");
	return (aSlice.length <= 2) ? [] : aSlice[1 .. $ - 1];
}

const (int)[] inner(const (int)[] aSlice) pure
{
	debug writeln("inner(", typeof(aSlice).stringof, ")\t");
	return (aSlice.length <= 2) ? [] : aSlice[1 .. $ - 1];
}

immutable (int)[] inner(immutable (int)[] aSlice) pure
{
	debug writeln("inner(", typeof(aSlice).stringof, ")\t");
	return (aSlice.length <= 2) ? [] : aSlice[1 .. $ - 1];
}
// +/

/+
// Replace the above three functions with a single inout function
inout(int)[] inner(inout(int)[] aSlice) pure
{
	debug writeln("inner(", typeof(aSlice).stringof, ")\t");
	return (aSlice.length <= 2) ? [] : aSlice[1 .. $ - 1];
}
+/
