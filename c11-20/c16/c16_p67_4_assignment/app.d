import std.stdio : writeln;

void main()
{
	assignOneFixedLengthArrayToAnotherFixedLengthArray;
	appendMaintainsSliceReference;
	appendFourBreaksSliceReference;
	createSliceReferenceMultipleTimes;
}

void assignOneFixedLengthArrayToAnotherFixedLengthArray() {
	// Fixed length arrays
	int[3] a = [1, 2, 3];
	int[3] b = [4, 5, 6];
	// long[3] long_a = a;  // This line would cause an assignment error because types do not match
	// int[4] b = a;	    // This line would cause an assignment error because lengths do not match

	writeln("--- assignOneFixedLengthArrayToAnotherFixedLengthArray() BEGIN ---");
	a = b;	 				// Copy semantics when both arrays are of the same fixed length

	a[0] = 10;				// Modify a only
	b[2] = 30;				// Modify b only

	writeln(__LINE__, " a after a = b; a[0] = 10; b[2] = 30; : ", a);
	writeln(__LINE__, " b after a = b; a[0] = 10; b[2] = 30; : ", b);
	writeln("--- assignOneFixedLengthArrayToAnotherFixedLengthArray() END ---");
	writeln();
}

void appendMaintainsSliceReference() 
{
	writeln("--- appendMaintainsSliceReference() BEGIN ---");
	int[] a = [1, 2, 3];
	a.reserve(10);		 	// increase capacity to at least 10

 	int[] b = a;  // b is slice of a

	writeln(__LINE__, " a before:  ", a, "     (length: ", a.length, ")", " (capacity: ", a.capacity, ")");
	writeln(__LINE__, " b before:  ", b, "     (length: ", b.length, ")", " (capacity: ", b.capacity, ")");

 	a ~= 4; 	// b is still [1, 2, 3], and is still shared with a
                // a is now   [1, 2, 3, 4],  is still shared with b

	b[0] = 10;   // modifies both a and b, with slice sharing semantics  

	writeln(__LINE__, " a after :  ", a, " (length: ", a.length, ")", " (capacity: ", a.capacity, ")");
	writeln(__LINE__, " b after :  ", b, "    (length: ", b.length, ")", " (capacity: ", b.capacity, ")");
	writeln("--- appendMaintainsSliceReference() END ---");
	writeln();
}

void appendFourBreaksSliceReference() 
{
	writeln("--- appendFourBreaksSliceReference() BEGIN ---");
	int[] a = [1, 2, 3];
	a.reserve(10);		 	// increase capacity to at least 10

 	int[] b = a;  // b is slice of a

	writeln(__LINE__, " a before:  ", a, "    (length: ", a.length, ")", " (capacity: ", a.capacity, ")");
	writeln(__LINE__, " b before:  ", b, "    (length: ", b.length, ")", " (capacity: ", b.capacity, ")");

 	a = a ~ 4;  // b is still [1, 2, 3], but no longer shared with a
                // a is now   [1, 2, 3, 4],  no longer shared with b

	b[0] = 10;   // modifies b only				  

	writeln(__LINE__, " a after :  ", a, " (length: ", a.length, ")", " (capacity: ", a.capacity, ")");
	writeln(__LINE__, " b after :  ", b, "   (length: ", b.length, ")", " (capacity: ", b.capacity, ")");
	writeln("--- appendFourBreaksSliceReference() END ---");
	writeln;
}

void createSliceReferenceMultipleTimes()
{
	writeln("--- createSliceReferenceMultipleTimes() BEGIN ---");

	int[] odds  = [1, 3, 5, 7, 9, 11];	// 6 elements
	int[] evens = [2, 4, 6, 8, 10];		// 5 elements

	// Dynamic array, not attached to any array yet
	int[] slice;						

	// Attach slice to odds
	slice = odds[2 .. $ - 2];			// slice = [5, 7], length = 2
	writeln(__LINE__, " slice odds:  ", slice, "    (length: ", slice.length, ")", " (capacity: ", slice.capacity, ")");

	// Attach slice to evens
	slice = evens[1 .. $ - 1];	// slice = [4, 6, 8], length = 3
	writeln(__LINE__, " slice evens: ", slice, " (length: ", slice.length, ")", " (capacity: ", slice.capacity, ")");
	writeln("--- createSliceReferenceMultipleTimes() END ---");
}
