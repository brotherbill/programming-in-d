import std.stdio : writeln;

void main()
{
	const(int)[] sliceMutableElementsImmutable = [1, 2];
	sliceMutableElementsImmutable       ~= 3; // can add elements
	// sliceMutableElementsImmutable[0]  = 3; // ← compilation ERROR.  Each element is immutable.
	sliceMutableElementsImmutable.length = 1; // Can change length

	const int[] otherSlice         = [10, 11];
	sliceMutableElementsImmutable  = otherSlice; // can provide access to other elements
	sliceMutableElementsImmutable ~= 100;
	writeln("otherSlice: ", otherSlice);
	writeln("sliceMutableElementsImmutable: ", sliceMutableElementsImmutable);

	const int[]  a = [1]; // elements and slice are immutable
	const(int[]) b = [1]; // elements and slice are immutable
	const(int)[] c = [1]; // elements are immutable, slice is mutable
}
