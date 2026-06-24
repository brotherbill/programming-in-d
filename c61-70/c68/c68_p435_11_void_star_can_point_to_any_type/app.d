import std.stdio;

void main()
{
	int number = 42;
	double otherNumber = 1.25;
	void* canPointAtAnything;

	canPointAtAnything = &number;
	writeln("number via ptr: ", *(cast(int*) canPointAtAnything));

	canPointAtAnything = &otherNumber;
	writeln("otherNumber via ptr: ", *(cast(double*) canPointAtAnything));
	writeln;

	// *canPointAtAnything = 43;	// ← compilation ERROR

	changeNumber();

	canPointAtAnything = &number;
	writeln("canPointAtAnything has address: ", canPointAtAnything);
	++canPointAtAnything;
	writeln("++canPointAtAnything has address: ", canPointAtAnything); // void* always increment by 1 byte
}

void changeNumber()
{
	int number = 42; 									// (1)
	void* canPointAtAnything = &number; 				// (2)		

	writeln("Before change: ", number);

	int* intPointer = cast(int*) canPointAtAnything; 	// (3)
	*intPointer = 43; 									// (4)	

	writeln("After change: ", number);
}

// 1. The actual variable
// 2. Storing the address of the variable in a void pointer
// 3. Assigning that address to a pointer of the correct type
// 4. Modifying the variable through the new pointer
