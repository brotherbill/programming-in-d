void main()
{
	const_tester;
	immunity_tester;
}

void const_tester() 
{
	const int[] slice = [1, 2];
	// slice         ~= 3; 	// ← compilation ERROR, cannot add elements
	// slice[0]       = 3; 	// ← compilation ERROR, cannot replace an element
	// slice.length   = 1; 	// ← compilation ERROR, cannot change length

	const int[] otherSlice = [10, 11];
	// slice = otherSlice;	// ←  compilation ERROR, cannot assign to another slice
}

void immunity_tester() 
{
	immutable int[] slice = [1, 2];
	// slice             ~= 3; 	// ← compilation ERROR, cannot add elements
	// slice[0]           = 3; 	// ← compilation ERROR, cannot replace an element
	// slice.length       = 1; 	// ← compilation ERROR, cannot change length

	immutable int[] otherSlice = [10, 11];
	// slice = otherSlice;	// ←  compilation ERROR, cannot assign to another slice
}
