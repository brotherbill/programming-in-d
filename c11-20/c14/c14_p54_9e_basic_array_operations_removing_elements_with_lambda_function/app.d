import std.stdio : writeln;
import std.algorithm : sort, remove, reverse; // For array manipulation functions

void main()
{
	writeln("Removing element with lambda function");
	int[] array = [10, 20, 30, 40, 20, 50];
	writeln(__LINE__, " Original array      : ", array, " Length: ", array.length, " Capacity: ", array.capacity);

	// Note: ! is use of macro expansion.
	array.remove!(a => a == 20); // Remove all elements equal to 20
	writeln(__LINE__, " ERROR: Removed both 20's.  The last two original elements (20 and 50) stayed put, as length didn't drop by 2.");
	writeln(__LINE__, " This is a FEATURE, not a BUG.  You must reassign the array to the result of remove!().");
	writeln(__LINE__, " array after removal: ", array, " Length: ", array.length, " Capacity: ", array.capacity);
	writeln();

	int[] array2 = [10, 20, 30, 40, 20, 50];
	writeln(__LINE__, " Original array2     : ", array2, " Length: ", array2.length, " Capacity: ", array2.capacity);
	array2 = array2.remove!(a => a == 20); // Remove all elements equal to 20
	writeln(__LINE__, " array2 after removal: ", array2, " Length: ", array2.length, " Capacity: ", array2.capacity);
}


