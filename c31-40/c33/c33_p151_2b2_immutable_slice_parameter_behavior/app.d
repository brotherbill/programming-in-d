import std.stdio;

void main()
{
	immutable(int[]) immutableSlice = [1, 2, 3, 4, 5];

	// print_mutable(immutableSlice);	// ← Won't compile.  Would mutate immutableSlice.

	print_const(immutableSlice); 		// ← OK with second or third print function.
	writeln;

	print_immutable(immutableSlice); 	// ← OK with second or third print function.
	writeln;
}

// This will compile, but won't accept immutableSlice as an argument.  Can only accept mutable slices.
void print_mutable(int[] slice) {
	writefln("%s mutable elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}

// This will compile for both const(int[])slice and immutable(int[]) slice
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

void print_immutable(immutable int[] slice) {
	writefln("%s immutable elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}
