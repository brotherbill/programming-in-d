import std.stdio;

void main()
{
	int[] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
	int * ptrNumbers = &numbers[0];
	size_t count = numbers.length;

	int[] slice = ptrNumbers[0 .. count];

	writeln("slice[1]: ",  slice[1]);  // Outputs: 2
	writeln("slice[10]: ", slice[10]); // (undefined behavior)  throws exception: index out of range
}
