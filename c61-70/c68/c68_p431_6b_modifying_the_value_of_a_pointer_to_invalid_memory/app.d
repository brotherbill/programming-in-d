import std.stdio;

void main() {
	int pointee = 42;
	int* ptr = &pointee;

	writefln("Value before: %d", *ptr);
	++ptr;		// Error: undefined identifier ++ptr.  What is it pointing to?
	writefln("Value after : %d", *ptr);
}
