import std.stdio;

void main()
{
	writeln("=== extending Base Array Beyond Capacity Does Not Maintain Sharing ===");
	int[] baseArray = [1, 3, 5, 7, 9, 11, 13, 15];
	int[] tailSlice = baseArray[$ / 2 .. $];
	assert(&baseArray[4] is tailSlice.ptr);
	writeln("We have sharing between baseArray and tailSlice.");
	writeln("baseArray     : ", baseArray, " length: ", baseArray.length, 
			" capacity: ", baseArray.capacity, ", &baseArray[4]: ", &baseArray[4]);

	writeln("tailSlice:                  ", tailSlice, " length: ", tailSlice.length, 
			" capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln();

	baseArray.length += (1 + baseArray.capacity - baseArray.length); // extend just beyond capacity
	assert(&baseArray[4] !is tailSlice.ptr);
	writeln("Increase baseArray.length by 1 beyond capacity.  Breaks baseArray sharing.  baseArray escaped to heap.");
	writeln("baseArray after: ", baseArray, " length: ", baseArray.length, 
			", capacity: ", baseArray.capacity, ", &baseArray[4]: ", &baseArray[4]);

	writeln("tailSlice after:             ", tailSlice, "             length:  ", tailSlice.length, 
			", capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);

	writeln("Old baseArray moved in memory!  baseArray breaks sharing with tailSlice.");
	writeln();

	tailSlice[0] = 888;
	assert(&baseArray[4] !is &tailSlice[0]);
	writeln("After tail baseArray length increase and changing tailSlice[0] to 888. ", " length: ", tailSlice.length, 
			" capacity: ", tailSlice.capacity);
	writeln("Broke sharing:  baseArray[4] should be 888.");
	writeln("baseArray.ptr: ", baseArray.ptr, ", tailSlice.ptr: ", tailSlice.ptr, ", baseArray moved in memory!");
	writeln("tailSlice:                ", tailSlice);
	writeln("baseArray     : ", baseArray);
}
