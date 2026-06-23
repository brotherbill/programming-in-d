import std.conv : to;

void main()
{
	int[] slice = [10, 20, 30];
	assert(&(slice[0]) is slice.ptr); 					// ptr is a property of the array type

	auto immutableSlice = to!(immutable int[])(slice); 	// makes duplicate copy of slice

	assert(&(slice[0]) !is &(immutableSlice[0])); 		// parentheses are necessary after &
	assert(slice.ptr !is immutableSlice.ptr);
}
