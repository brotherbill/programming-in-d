import std.stdio;

void main()
{
	bool aCondition = true;
	int  outer;

	if (aCondition)
	{ // ← curly bracket starts a new scope
		int inner = 1;
		outer     = 2; // ← 'outer' is available here
	} // ← 'inner' is not available beyond this point

	// inner = 3; 		// ← compilation ERROR  (uncomment first part to get compilation error)
	//   'inner' is not available in the outer scope

	writeln("outer = ", outer);
}
