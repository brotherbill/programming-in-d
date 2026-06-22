import std.stdio;

void main()
{
	// Create a fixed array of integers.
	// A fixed array has a size that is known at compile time, and may not be resized.
	int[5] numbers = [1, 2, 3, 4, 5];

	// Print each number in the array.
	writeln(__LINE__, ": Fixed Array: numbers", ", length: ", numbers.length, " and capacity: ", numbers.capacity);
	foreach (num; numbers)
	{
		writeln(__LINE__, ": ", num);
	}
	writeln();

	// Create a dynamic array of integers.
	// A dynamic array can grow or shrink in size at runtime.
	int[] dynamicArray;
	writeln(__LINE__, ": dynamicArray length: ", dynamicArray.length, " and capacity: ", dynamicArray.capacity);

	// Add elements to the dynamic array.
	dynamicArray ~= 10;
	dynamicArray ~= 20;
	dynamicArray ~= 30;
	dynamicArray ~= [40, 50, 60]; // add multiple elements
	writeln(__LINE__, ": dynamicArray length after adding elements: ", dynamicArray.length, " and capacity: ", dynamicArray.capacity);
	writeln(__LINE__, ": dynamicArray contents:");
	foreach (num; dynamicArray)
	{
		writeln(__LINE__, ": ", num);
	}
	writeln();

	dynamicArray.length = 10;
	dynamicArray ~= 999; // add to end of array
	writeln(__LINE__, ": dynamicArray length after changing length to 10: ", dynamicArray.length, " and capacity: ", dynamicArray.capacity);
	writeln(__LINE__, ": dynamicArray contents:");
	foreach (num; dynamicArray)
	{
		writeln(__LINE__, ": ", num);
	}
	writeln();

	// Resize the dynamic array to a smaller size.		
	dynamicArray.length = 2;
	dynamicArray.length = 3;
	writeln(__LINE__, ": dynamicArray length after changing length to 2, then 3: ", dynamicArray.length, " and capacity: ", dynamicArray.capacity);
	writeln(__LINE__, ": dynamicArray contents:");
	foreach (num; dynamicArray)
	{
		writeln(__LINE__, ": ", num);
	}
	writeln();

	// Resize the dynamic array to a larger size.  New elements are initialized to zero.	
	dynamicArray.length = 5;
	writeln(__LINE__, ": dynamicArray length after changing length to 5: ", dynamicArray.length, " and capacity: ", dynamicArray.capacity);
	writeln(__LINE__, ": dynamicArray contents:");
	foreach (num; dynamicArray)
	{
		writeln(__LINE__, ": ", num);
	}
}
