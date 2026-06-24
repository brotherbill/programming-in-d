import std.stdio;

void main()
{ 	
	// These are all equivalent ways to declare a pointer to a single int
	int  *myPointer1; 	// Each of these are equivalent, but will be misleading if multiple variables are declared on the same line
	int * myPointer2; 	// This one is often preferred
	int*  myPointer3; 	// This one is less common but still valid
}
