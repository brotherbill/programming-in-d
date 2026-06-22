import std.stdio : writeln;

void main()
{
	writeln("=== extending base Array Within Bounds Maintains Sharing ===");
	int[] baseArray = [1, 3, 5, 7, 9, 11, 13, 15];
	int[] tailSlice = baseArray[$ / 2 .. $];
	writeln("baseArray: ", baseArray, " length: ", baseArray.length, " capacity: ", baseArray.capacity, ", &baseArray[4]: ", &baseArray[4]);
	writeln("tailSlice:             ", tailSlice, " length: ", tailSlice.length, " capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln();

	// extend to capacity.  Equivalent to:  baseArray.length = baseArray.capacity;
	baseArray.length += (baseArray.capacity - baseArray.length); 

	writeln("baseArray after increasing length: ", baseArray, " length: ", baseArray.length, 
			" capacity: ", baseArray.capacity, ", &baseArray[4]: ", &baseArray[4]);

	writeln("tailSlice after increasing length:             ", tailSlice, "          length:  ", tailSlice.length, 
			"  capacity: ", tailSlice.capacity, ", &tailSlice[0]: ", &tailSlice[0]);

	writeln("Sharing successful");
	writeln();

	// Demonstrate that slice sharing is maintained
	tailSlice[0] = 999;

	writeln("baseArray after tailSlice[0] = 999: ", baseArray, " length: ", baseArray.length, 
			" capacity: ", baseArray.capacity, ", &baseArray[4]: ", &baseArray[4]);

	writeln("tailSlice after tailSlice[0] = 999:             ", tailSlice, "          length:  ", tailSlice.length, 
			"  capacity: ", tailSlice.capacity, ", &tailSlice[0]: ", &tailSlice[0]);
}
