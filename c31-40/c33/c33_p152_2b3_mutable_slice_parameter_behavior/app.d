import std.stdio : writeln, writefln;

void main()
{
	int[] mutableSlice = [7, 8];

	print_mutable(mutableSlice);
	writeln;

	print_const(mutableSlice);			// Compiles.  No harm in passing mutable slice as print_const won't mutate it.
	writeln;

	// print_immutable(mutableSlice);  	// Won't compile.  mutableSlice is not immutable.
}

void print_mutable(int[] slice) {
	writefln("%s mutable elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}

// This will compile for int[] slice,  const(int[])slice and immutable(int[]) slice
// This is "const-correct"
void print_const(const int[] slice)
{
	// slice ~= 50;			// ← compilation ERROR: Can't append to slice
	// slice[0] = 11;		// ← compilation ERROR: Can't change any element
	// slice.length = 2;	// ← compilation ERROR: Can't change length

	writefln("%s const elements: ", slice.length);
	foreach (i, element; slice)
	{
		writefln("%s: %s", i, element);
	}
}

// This will only compile for immutable(int[]) slice
void print_immutable(immutable int[] slice) {
	writefln("%s immutable elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}
