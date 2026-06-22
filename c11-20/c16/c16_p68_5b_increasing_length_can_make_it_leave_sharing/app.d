import std.stdio;

// Breaking sharing is bad. Really bad.
// Your algorithm breaks.
// Breaking sharing causes UB (Undefined Behavior)
// Allowing sharing to break means you are not using D right.
// A good D developer never allows sharing to break.

void main()
{
	extendingBaseArraySmallMaintainsSharing();
	// extendingBaseArrayLargeDoesNotMaintainSharing();
    // extendingSliceDoesNotMaintainSharing();
	// demoExtendingSafely();
	// binarySearchTest();
}

void extendingBaseArraySmallMaintainsSharing()
{
	writeln("=== extendingBaseArraySmallMaintainsSharing ===");
	int[] base = [1, 3, 5, 7, 9, 11, 13, 15];
	int[] tailSlice = base[$ / 2 .. $];
	writeln("base     : ", base, " length: ", base.length, " capacity: ", base.capacity, ", &base[4]     : ", &base[4]);
	writeln("tailSlice:             ", tailSlice, " length: ", tailSlice.length, " capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln();

	base.length += (base.capacity - base.length); // extend to capacity.  Equivalent to:  base.length = base.capacity;
	writeln("base after increasing length: ", base, " length: ", base.length, " capacity: ", base.capacity, ", &base[4]: ", &base[4]);
	writeln("Sharing successful");
	tailSlice[0] = 999;
	writeln("tailSlice:             ", tailSlice);
	writeln("base     : ", base);
	writeln();
}

void extendingBaseArrayLargeDoesNotMaintainSharing() 
{
	writeln("=== extendingBaseArrayLargeDoesNotMaintainSharing ===");
	int[] base = [1, 3, 5, 7, 9, 11, 13, 15];
	int[] tailSlice = base[$ / 2 .. $];
	writeln("base     : ", base, " length: ", base.length, " capacity: ", base.capacity, ", &base[4]     : ", &base[4]);
	writeln("tailSlice:             ", tailSlice, " length: ", tailSlice.length, " capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln();

	base.length += (1 + base.capacity - base.length); // extend just beyond capacity
	writeln("Increase base.length by 1 beyond capacity.  Breaks base sharing.  base escaped to heap.");
	writeln("base after: ", base, " length: ", base.length, ", capacity: ", base.capacity, ", &base[4]     : ", &base[4]);
	writeln("tailSlice after:        ", tailSlice, "             length:  ", tailSlice.length, ", capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln();

	tailSlice[0] = 888;
	writeln("After tail base length increase and changing tailSlice[0] to 888. ", " length: ", tailSlice.length, " capacity: ", tailSlice.capacity);
	writeln("Broke sharing:  base[4] should be 888.");
	writeln("base.ptr: ", base.ptr, ", tailSlice.ptr: ", tailSlice.ptr, ", base moved in memory!");
	writeln("tailSlice:           ", tailSlice);
	writeln("base     : ", base);
	writeln();
}

void extendingSliceDoesNotMaintainSharing()
{
	writeln("=== extendingSliceDoesNotMaintainSharing ===");
	int[] base = [1, 3, 5, 7, 9, 11, 13, 15];
	int[] tailSlice = base[$ / 2 .. $];
	writeln("base     : ", base, " length: ", base.length, ", capacity: ", base.capacity, ", &base[4]     : ", &base[4]);
	writeln("tailSlice:             ", tailSlice, " length: ", tailSlice.length, ", capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln();

	tailSlice.length += (tailSlice.capacity - tailSlice.length); // extend to capacity
	writeln("base after tailSlice increasing length:   ", base, "         , length: ", base.length, ", capacity: ", base.capacity, ", &base[4]     : ", &base[4]);
	writeln("tailSlice after incrementing length by 3:             ", tailSlice, ", length: ", tailSlice.length, ", capacity:  ", tailSlice.capacity, ", tailSlice.ptr: ", tailSlice.ptr);
	writeln();

	tailSlice[0] = 888;
	writeln("After changing tailSlice[0] to 888. ", " length: ", tailSlice.length, ", capacity: ", tailSlice.capacity);
	writeln("Broke sharing:  base[4] should be 888.");
	writeln("base.ptr: ", base.ptr, ", tailSlice.ptr: ", tailSlice.ptr, ", base moved in memory!");
	writeln("tailSlice:           ", tailSlice);
	writeln("base     : ", base);
	writeln();
}
 
void demoExtendingSafely() 
{
	int[] backingArray;
	backingArray.length = 10;

	int [] parentSlice = backingArray;
	foreach (i; 0 .. 10) parentSlice[i] = 10 * (i + 1);	

	int [] childSlice = parentSlice[5 .. $];

	writeln("initial state:");
	writeln("backingArray: ", backingArray);
	writeln("parentSlice : ", parentSlice);
	writeln("childSlice  :                     ", childSlice);
	writeln();

	writeln("demonstrate sharing:");
	childSlice[0] = 999;
	writeln("backingArray: ", backingArray);
	writeln("parentSlice : ", parentSlice);
	writeln("childSlice                      : ", childSlice);
	writeln();

	writeln("Demonstrate extending the slice maintains sharing");
	writeln("backingArray length before: ", backingArray.length, ", backingArray capacity: ", backingArray.capacity);
	backingArray.length += 2;
	parentSlice = backingArray[0 .. $];
	childSlice = parentSlice[5 .. $];

	backingArray[5] = 555;
	childSlice[1] = 123;
	childSlice[$ - 2] = 888;
	childSlice[$ - 1] = 777;
	writeln("backingArray: ", backingArray);
	writeln("parentSlice : ", parentSlice);
	writeln("childSlice  :                     ", childSlice);
	writeln();
}

void binarySearchTest()
{
	writeln("=== binarySearchTest ===");
	int[] baseArray = [1, 3, 5, 7, 9, 11, 13, 15];

	writeln("Searching for 7: ", binarySearch(baseArray, 7));   // true
	writeln("Searching for 2: ", binarySearch(baseArray, 2));   // false
}	

// Recursive binary search implementation using slicing
bool binarySearch(int[] haystack, int needle)
{
	if (haystack.length == 0) 
	{
		return false;
	}
	if (haystack.length == 1) 
	{
		return haystack[0] == needle;
	}		

	size_t midIndex = haystack.length / 2;
	int[] lowHalf = haystack[0 .. midIndex];
	int[] highHalf = haystack[midIndex .. $];

	if (needle < haystack[midIndex])
	{
		return binarySearch(lowHalf, needle);
	} 
	else 
	{
		return binarySearch(highHalf, needle);
	}
}	
