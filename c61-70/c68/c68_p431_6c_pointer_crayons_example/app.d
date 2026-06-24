import std.stdio;
import std.string;
import std.conv;

enum Color
{
	red,
	yellow,
	blue
}

void main()
{
	writefln("Crayon objects are %s bytes each.", Crayon.sizeof);

	Crayon[] crayons = [
		Crayon(Color.red, 11),
		Crayon(Color.yellow, 12),
		Crayon(Color.blue, 13)
	];

	Crayon* ptr = &crayons[0]; 					// (1)

	for (int i = 0; i != crayons.length; ++i)
	{
		writeln("Pointer value: ", ptr); 		// (2)

		writeln("Crayon: ", *ptr); 				// (3)
		++ptr; 									// (4)	
	}

	// 1. Definition: The pointer is initialized by the address of the first element.
	// 2. Using its value: The value of the pointer is the address of the element that it is pointing at.
	// 3. Accessing cthe element that is being pointed at.
	// 4. Pointing at the next element.
}

struct Crayon
{
	Color color;
	double length;

	string toString() const
	{
		return format("%scm %s crayon", length, color);
	}
}
