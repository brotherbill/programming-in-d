import std.stdio;

// If a C library had a function named 'override', 
//  it could only be called from D through a name like 'c_override',
//  mangled as the actual function name: 

pragma(mangle, "override") 				// Specify the exact name in the C library
extern (C) string c_override(string); 	// Declare the function with extern(C) linkage

void main()
{
	// D code calls the function as c_override() but the linker would find it by its correct C library name 'override':
	auto s = c_override("hello");
}
