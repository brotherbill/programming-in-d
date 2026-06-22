import std.stdio : writeln;

void main()
{
	writeln("=== extending Slice Does Not Maintain Sharing ===");
	int[] baseArray = [1, 3, 5, 7, 9, 11, 13, 15];
	int[] tailSlice = baseArray[$ / 2 .. $];
	assert(&baseArray[4] is tailSlice.ptr); // sharing
	writeln("baseArray: ", baseArray, " length: ", baseArray.length, ", capacity: ", baseArray.capacity, ", &baseArray[4]: ", &baseArray[4]);
	writeln("tailSlice:             ", tailSlice, " length: ", tailSlice.length, ", capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln("Has sharing!");
	writeln();

	tailSlice.length += (tailSlice.capacity - tailSlice.length); // extend to capacity
	assert(&baseArray[4] !is tailSlice.ptr); // broke sharing
	writeln("baseArray after tailSlice increasing length:", baseArray, "         , length: ", baseArray.length, ", capacity: ", baseArray.capacity, ", &baseArray[4]: ", &baseArray[4]);
	writeln("tailSlice after incrementing length by 3:               ", tailSlice, ", length: ", tailSlice.length, ", capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln("Broke sharing!");
	writeln();

	tailSlice[0] = 888;
	writeln("After changing tailSlice[0] to 888. ", " length: ", tailSlice.length, ", capacity: ", tailSlice.capacity);
	writeln("Broke sharing:  baseArray[4] should be 888.");
	writeln("baseArray.ptr: ", baseArray.ptr, ", tailSlice.ptr: ", tailSlice.ptr, ", baseArray moved in memory!");
	writeln("tailSlice:           ", tailSlice);
	writeln("baseArray: ", baseArray);
}
