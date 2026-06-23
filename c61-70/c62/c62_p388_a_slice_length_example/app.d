import std.stdio;

void main() {
	int[] slice = [7, 8, 9];

	// is length a member variable? No.
	assert(slice.length == 3);	

	// This has side effect of increasing size of slice and .init new items.
	slice.length = 5;
	writeln("slice: ", slice);
}
