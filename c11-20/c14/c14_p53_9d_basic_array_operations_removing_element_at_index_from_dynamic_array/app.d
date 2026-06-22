import std.stdio : writeln;

void main()
{
	remove_item_at_index_1_in_place_three_ways;
	remove_items_at_index_1_and_3_in_place_using_library_variadic_parameters;
	remove_items_at_index_1_and_3_in_place_using_slice_parameter;
}

/// Remove item at index 1 in place
void remove_item_at_index_1_in_place_three_ways() 
{
	import std.algorithm : remove;

	writeln("--- Remove item at index 1 in place, without allocation and garbage collection ---");
	// Note need to reassign the array after removal
	int[] array = [10, 20, 30, 40];
	
	array.remove(1); // Remove element at index 1
	writeln(__LINE__, " ERROR: Removed item 1, D shifted all elements left, but length didn't drop by 1");
	writeln(__LINE__, " This is a FEATURE, not a BUG.  You must reassign the array to the result of remove().");
	writeln(__LINE__, " array after naked removal: ", array, " Length: ", array.length, " Capacity: ", array.capacity);
	writeln();

	int[] array2 = [10, 20, 30, 40];

	auto temp = array2.remove(1); // Remove element at index 1, assign to temp
	writeln(__LINE__, " ERROR: Removed item 1, D shifted all elements left, but length didn't drop by 1 in source array.");
	writeln(__LINE__, " This is a FEATURE, not a BUG.  You must reassign the array to the result of remove().");
	writeln(__LINE__, " Destination array has source array without item 1, and with correct length.");
	writeln(__LINE__, " temp after remove and assign  : ", temp,  "     Length: ", temp.length,  " Capacity: ", temp.capacity);
	writeln(__LINE__, " array2 after remove and assign: ", array2, " Length: ", array2.length, " Capacity: ", array2.capacity);
	writeln();

	int[] array3 = [10, 20, 30, 40];

	writeln(__LINE__, " SUCCESS: Removed item 1, D shifted all elements left, and length dropped by 1 in array3.");
	writeln(__LINE__, " This is the Mother Dee approved way to remove an element by index from a dynamic array.");
	array3 = array3.remove(1); // Remove element at index 1
	writeln(__LINE__, " array3 after removal: ", array3, " Length: ", array3.length, " Capacity: ", array3.capacity);
	writeln();
}

/// Remove items at indexes 1 and 3 in place, without allocation or garbage collection
void remove_items_at_index_1_and_3_in_place_using_library_variadic_parameters() 
{
	// by convention, imports go at the top of the module or at the top of the function
	import std.algorithm.mutation : remove;

	writeln("--- Remove items at indexes 1 and 3 in place without allocation or garbage collection, using library---");

	int[] array = [10, 20, 30, 40];
	writeln(__LINE__, " array original     : ", array, " Length: ", array.length, " Capacity: ", array.capacity);
	
	// array indexes must be in ascending order, with no duplicates
	array = array.remove(1, 3);

	writeln(__LINE__, " array after removal: ", array, "         Length: ", array.length, " Capacity: ", array.capacity);
	writeln();
}

/// Remove items at indexes 1 and 3 in place, without allocation or garbage collection
void remove_items_at_index_1_and_3_in_place_using_slice_parameter() 
{
	// by convention, imports go at the top of the module or at the top of the function
	import std.algorithm.mutation : remove;

	writeln("--- Remove items at indexes 1 and 3 in place without allocation or garbage collection, workaround ---");

	int[] array = [10, 20, 30, 40];
	
	writeln(__LINE__, " array original     : ", array, " Length: ", array.length, " Capacity: ", array.capacity);
	
	// array indexes must be in ascending order, with no duplicates
	array = removeItemsAtIndexes(array, [1, 3]);

	writeln(__LINE__, " array after removal: ", array, "         Length: ", array.length, " Capacity: ", array.capacity);
	writeln();
}

private int[] _removeItemsAtIndexes_old_array;
int[] removeItemsAtIndexes(ref int[] array, size_t[] indexesToRemove)
in 
{
	assert(array !is null, "array must not be null");
	assert(areSliceIndexesMonotoneIncreasing(indexesToRemove),
			"indexesToRemove must be in ascending order with no duplicates");
}
out
{
	assert(array.length == _removeItemsAtIndexes_old_array.length - indexesToRemove.length,
		"array length after removal is incorrect");
}
do
{
	import std.algorithm.mutation : remove;

	_removeItemsAtIndexes_old_array = array.dup; // for postcondition checking.  We won't modify this copy.

	foreach_reverse (i; 0 .. indexesToRemove.length)
	{
		array = array.remove(indexesToRemove[i]);
	}

	return array; // return the modified array for chaining
}	

bool areSliceIndexesMonotoneIncreasing(size_t[] sliceIndexes)
in
{
	assert(sliceIndexes !is null, "sliceIndexes must not be null");
}
do
{
	for (size_t i = 1; i < sliceIndexes.length; i++)
	{
		if (sliceIndexes[i] <= sliceIndexes[i - 1])
		{
			return false;
		}
	}
	return true;
}
