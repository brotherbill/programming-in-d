import std.stdio;

void main()
{
	const(int[]) constSlice = [10, 20, 30, 40];

	// print_mutable  (constSlice);	// ← compilation ERROR.  Cannot pass const slice to mutable parameter.
	print_const       (constSlice); // ← compiles fine.  Works as expected.
	// print_immutable(constSlice); // ← compilation ERROR.  Cannot pass const slice to immutable parameter.
}

// This won't compile as the parameter allows mutation, even though no mutation is occurring
void print_mutable(int[] slice) {
	writefln("%s elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}

// This will compile for both const(int[])slice and immutable(int[]) slice
// This is "const-correct"
// In layman's terms, "const" means "I promise not to change it", whereas "immutable" means "it can never be changed".
void print_const(const int[] slice)
{
	// slice ~= 50;			// ← compilation ERROR: Can't append to slice
	// slice[0] = 11;		// ← compilation ERROR: Can't change any element
	// slice.length = 2;	// ← compilation ERROR: Can't change length
	// slice = null;		// ← compilation ERROR: Can't reassign slice

	writeln("--- print_const called ---");
	writefln("%s elements: ", slice.length);
	foreach (i, element; slice)
	{
		writefln("%s: %s", i, element);
	}
}

// This won't compile as immutable int[] is too strong.
// slice argument must be immutable int[], not merely const int[].  print can only accept immutable int[] slices.
// immutable data is a stronger guarantee than const data.  It states that the original data is immutable "all the way down".
void print_immutable(immutable int[] slice) {
	writefln("%s elements: ", slice.length);
	foreach (i, element; slice) {
		writefln("%s: %s", i, element);
	}
}
