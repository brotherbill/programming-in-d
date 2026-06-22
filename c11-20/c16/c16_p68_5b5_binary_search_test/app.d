import std.stdio : writeln;

void main()
{
	writeln("=== binary Search Test ===");
	int[] baseArray = [1, 3, 5, 7, 9, 11, 13, 15];	// Must be ascending sorted

	writeln("Searching for 7: ", binarySearch(baseArray, 7));   // true
	writeln("Searching for 2: ", binarySearch(baseArray, 2));   // false
}

// Recursive binary search implementation using slicing
bool binarySearch(int[] haystack, int needle)
{
	if (haystack.length == 0) 
	{
		return false;	// an empty array cannot contain the needle
	}

	if (haystack.length == 1) 
	{
		return haystack[0] == needle;	// base case: single element array
	}		

	size_t midIndex = haystack.length / 2;
	int[]  lowHalf  = haystack[0 .. midIndex];
	int[]  highHalf = haystack[midIndex .. $];

	immutable int midValue = haystack[midIndex];	
	if (needle < midValue)
	{
		return binarySearch(lowHalf, needle);
	} 
	else 
	{
		return binarySearch(highHalf, needle);
	}
}
