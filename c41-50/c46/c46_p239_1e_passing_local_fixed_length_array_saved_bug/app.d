import std.stdio : writefln;

int[] sliceForLaterUse; // module level variable, for mischief

void main()
{
	foo();
	// BUG: Accesses memory that is not existing anymore 
	//      Would expect: [1, 2]  If anything else, this is a BUG
	writefln("Inside main        : %s", sliceForLaterUse);
}

void foo()
{
	int[2] array = [1, 2];
	bar_hoarder(array); // Passes fixed-length array as a slice
} 						// ← NOTE: 'array' is not valid beyond this point

void bar_hoarder(int[] slice)
{
	sliceForLaterUse = slice; // Saves a slice that is about to become invalid
	writefln("Inside bar_hoarder : %s", sliceForLaterUse);
}
