import std.stdio;

void main()
{
	int[] numbers = [10, 20, 30, 40, 50];
	int* ptr = &numbers[0];

	writeln("First element via pointer: ", *ptr);

	++ptr; // Move pointer to the next element
	writeln("Second element via pointer: ", *ptr);

	--ptr; // Move pointer back to the prior (first) element
	writeln("Back to first element via pointer: ", *ptr);

	ptr += 2; // Move pointer two elements forward
	writeln("Third element via pointer: ", *ptr);

	ptr -= 2; // Move pointer back to the first element
	writeln("Back to first element via pointer again: ", *ptr);

	writeln("ptr + 3: ", ptr + 3);
	writeln("ptr - 3: ", ptr - 3);
	writeln;

	int myVariable = 42;
	int* myPointer = &myVariable;
	writeln("Value of myVariable via myPointer: ", *myPointer);
}
