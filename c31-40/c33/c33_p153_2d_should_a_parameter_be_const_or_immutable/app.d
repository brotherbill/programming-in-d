import std.conv : to;

void main()
{
	// The original variable is immutable 
	immutable int[] slice = [10, 20, 30, 40];
	constFoo(slice);
	foo(slice);
}

// A function that takes its parameter as const, in order to be more useful. 
void constFoo(const int[] slice)
{
	// bar(slice);			// ← compilation ERROR.  slice is not guaranteed to be immutable.
	bar(slice.idup); 		// Now it compiles regardless of slice being immutable, const or mutable.  A string is immutable.
	bar(to!(immutable int[])(slice)); // Use template to make a copy if slice is const or mutable, pass through if immutable.
}

// Because it is a template, foo() can be called with both mutable and immutable variables. 
// We haven't covered templates yet.
void foo(T)(T[] slice)
{
	// 'to()' does not make a copy if the original variable is already immutable.
	bar(to!(immutable T[])(slice));
}

// A function that requires an immutable slice. 
void bar(immutable int[] slice)
{
	// ...
}
