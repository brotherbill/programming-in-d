import std.stdio;

void main()
{
	// This is a definition. It defines an array that consists of 12 elements.
	// This array is used to hold the number of days in each month.
	// The array indexes correspond to the months of the year, starting from 0 for January to 11 for December.

	// By default, arrays and every other variable in D are initialized to its default values, which is 0 for integers.
	// Setting monthDays to void means it is uninitialized at this point.
	// This is micro-optimization, as it avoids unnecessary memory allocation until the array is actually used.
	// It is also dangerous, as accessing an uninitialized array will lead to undefined behavior.
	// D gives you the flexibility to do this, and it is often used in performance-critical code.
	// The idea is that if you need to squeeze out every bit of performance, 
	//  you can avoid the overhead of initializing the array until you actually need it.
	int[12] monthDays = void;
	
	writeln("Number of days in January: ", monthDays[0]);
	writeln("Number of days in October: ", monthDays[9]);
	writeln();
	writeln("monthDays  type: ", typeof(monthDays).stringof);

	// This is an array literal. It initializes the array with the number of days in each month.
	// The values are hardcoded for a non-leap year.
	// This is a fixed length array with 12 elements.
	int[12] monthDays2 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	writeln("monthDays2 type: ", typeof(monthDays2).stringof);

	// The type is explicitly int[], a dynamic array.  Note the absense of size in the declaration.
	int[] monthDays3 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; 
	writeln("monthDays3 type: ", typeof(monthDays3).stringof);

	// The type is inferred as int[], a dynamic array.
	auto monthDays4 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; 
	writeln("monthDays4 type: ", typeof(monthDays4).stringof);
	writeln();

	// This is another access. It accesses the element that corresponds to January and October, the value of which is passed to writeln.
	int jan = 0;
	int oct = 9;
	writeln("January has ", monthDays2[jan], " days.");
	writeln("October has ", monthDays2[oct], " days.");
}
