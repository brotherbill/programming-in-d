import std.stdio : writeln;

void main()
{
	int[] backingArray;
	backingArray.length = 10;

	int [] parentSlice = backingArray;
	foreach (i; 0 .. 10) parentSlice[i] = 10 * (i + 1);	

	int [] childSlice = parentSlice[5 .. $];

	assert(&backingArray[0] == &parentSlice[0]);
	assert(&backingArray[5] == &childSlice[0]);

	writeln("--- initial state: ---");
	writeln("backingArray: ", backingArray, ", capacity: ", backingArray.capacity, 
			", &backingArray[0]: ", &backingArray[0], ", &backingArray[5]: ", &backingArray[5]);
	writeln("parentSlice : ", parentSlice, ", capacity: ", parentSlice.capacity, 
			", &parentSlice [0]: ", &parentSlice[0], ", &parentSlice [5]: ", &parentSlice[5]);
	writeln("childSlice  :                     ", childSlice, ", capacity:  ", childSlice.capacity, 
			",                                 &childSlice  [0]: ", &childSlice[0]);
	writeln();

	writeln("--- demonstrate sharing: ---");
	childSlice[0] = 999;
	writeln("childSlice[0] = 999;");
	writeln("backingArray: ", backingArray);
	writeln("parentSlice : ", parentSlice);
	writeln("childSlice                      : ", childSlice);
	writeln();

	writeln("--- Demonstrate extending the slice maintains sharing ---");
	writeln("backingArray before length: ", backingArray.length, ", backingArray capacity: ", backingArray.capacity);
	writeln();

	// Let's say that we want to extend the parent slice by 2 elements, then have child slice reflect that change
	// Reextend backing array and recreate slices from scratch
	backingArray.length += 2;			// Extend backing array first, which may reallocate memory
	parentSlice = backingArray;			// Recreate parent slice to reflect new length
	childSlice = parentSlice[5 .. $];	// Recreate child  slice to reflect new length

	assert(&backingArray[0] == &parentSlice[0]);
	assert(&backingArray[5] == &childSlice[0]);

	parentSlice[5] = 555;
	childSlice[1] = 123;
	childSlice[$ - 2] = 888;
	childSlice[$ - 1] = 777;
	writeln("backingArray: ", backingArray, ", capacity: ", backingArray.capacity, 
			", &backingArray[0]: ", &backingArray[0], ", &backingArray[5]: ", &backingArray[5]);
	writeln("parentSlice : ", parentSlice, ", capacity: ", parentSlice.capacity, 
			", &parentSlice [0]: ", &parentSlice[0], ", &parentSlice [5]: ", &parentSlice[5]);
	writeln("childSlice  :                     ", childSlice, ", capacity: ", childSlice.capacity, 
			",                                 &childSlice  [0]: ", &childSlice[0]);
}
