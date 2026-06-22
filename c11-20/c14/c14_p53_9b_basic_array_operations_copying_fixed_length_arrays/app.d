import std.stdio : writeln;

void main()
{
	writeln("Copying fixed-length arrays");
	writeln("Both source and destination must have same type and same length.");
	int[5] source = [10, 20, 30, 40, 50];
	int[5] destination;		// Won't compile if length is different or type is different
	// source ~= 60;  // Uncommenting this line will cause a compile-time error since fixed-length arrays cannot be resized

	destination = source; // Copying fixed-length array
	writeln(__LINE__, " Source     : ", source);
	writeln(__LINE__, " Destination: ", destination);
	writeln();
}
