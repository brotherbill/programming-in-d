import std.stdio : writeln;

void main()
{
	writeln("Adding elements to dynamic array");

	int[] array;

	// You may append elements one at a time using ~= operator
	array ~= 7;
	array ~= 360;

	// Or you can append multiple elements at once using an array literal
	// Unlike functional languages, D allows you to append an array literal directly
	array ~= [30, 40];

	writeln(__LINE__, " array: ", array, " Length: ", array.length, " Capacity: ", array.capacity);
}
