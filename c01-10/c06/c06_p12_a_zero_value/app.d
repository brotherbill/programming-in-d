import std.stdio;

void main()
{
	// The definition of the variable; 
	// This definition specifies that the type of studentCount is int:
	int    studentCount;    // Initialized to 0 by default
	double jeopardy;	    // Initialized to nan, not 0.0, by default
	long   garbage = void;  // Uninitialized variable.  Contains whatever was in memory.

	// The name of the variable becomes its value:
	writeln("There are ", studentCount, " students.");
	writeln("Double jeopardy: ", jeopardy);
	writeln("Garbage value  : ", garbage);
}
