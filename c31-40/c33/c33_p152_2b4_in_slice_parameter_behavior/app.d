import std.stdio : writefln;

void main()
{
	const(int[]) constSlice = [10, 20, 30, 40];

	// print_mutable(constSlice);	// ← compilation ERROR.  Can't pass const to mutable
	print_const(constSlice); 		// Compiles fine
	// print_immutable(constSlice);	// ← compilation ERROR.  Can't pass const to immutable
}

// This won't compile as the parameter allows mutation, even though no mutation is occurring
void print_mutable(int[] slice) {
	writefln("%s elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}

// This will compile for all of int[] slice, const(int[])slice and immutable(int[]) slice
// This is "const-correct"
// `in` is equivalent to `const scope`
// This is the preferred D way to state that the slice parameter won't be mutated, transitively, that is, "all the way down"
// To get this behavior, add:   -preview=in    to the CLI when compiling.
void print_const(in int[] slice)
{
	// slice ~= 50;			// ← compilation ERROR: Can't append to slice
	// slice[0] = 11;		// ← compilation ERROR: Can't change any element
	// slice.length = 2;	// ← compilation ERROR: Can't change length

	writefln("%s elements: ", slice.length);
	foreach (i, element; slice)
	{
		writefln("%s: %s", i, element);
	}
}

// This won't accept const(int[]) slice, only immutable(int[]) slice
void print_immutable(immutable int[] slice) {
	writefln("%s elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}
