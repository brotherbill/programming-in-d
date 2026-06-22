import std.stdio : writeln;

void main()
{
	// parameter is const_slice
	const_function(       const_slice);			
	// immutable_function(const_slice);		// won't compile.  immutable is more restrictive than const.
	// mutable_function(  const_slice);		// won't compile.  Sending const to a mutable function is not allowed as it may modify the data.

	// parameter is immutable_slice
	const_function(     immutable_slice);
	immutable_function( immutable_slice);
	// mutable_function(immutable_slice);	// won't compile

	// parameter is mutable slice
	const_function(mutable_slice);
	// immutable_function(mutable_slice);	// won't compile
	mutable_function(mutable_slice);
}

void bestPractices(const(int[]) slice)
{
	// explicit full immutable
}

void lessPreferred(const int[] slice)
{
	// equivalent to best practices, but implicit
}

const     (int[]) const_slice     = [10, 20, 30];
immutable (int[]) immutable_slice = [10, 20, 30];
           int[]  mutable_slice   = [10, 20, 30];

void const_function(const int[] slice)
{

}

void immutable_function(immutable int[] slice) 
{

}

void mutable_function(int[] slice) 
{

}
