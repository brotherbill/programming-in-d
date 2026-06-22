void main()
{
	enum fileName = name ~ ".txt";
	enum totalSquares = totalLines * totalColumns;

	// ++totalSquares;	//  ← compilation ERROR.  Can't modify an enum.
	
	import std.stdio : writeln;

	// writeln("&fileName: ", &fileName);	// won't compile.  fileName not an lvalue.

	writeln(fileName, ", ", totalSquares);

	// The prior line is equivalent to:
	writeln("list.txt", ", ", 294);
	writeln;

	writeln("Don't use enums for objects created at run time");
	enum a = [42, 100];

	writeln("a: ", a); // an array [ 42, 100 ] is created at run time
	writeln;

	writeln("Better to use immutable:");
	immutable b = [42, 100];
	writeln("b       : ", b, ", &b       : ", &b);
	// b = [ 100, 42 ];  		// Compile ERROR.  Can't assign to immutable
	// b[0] = 99;		 		// Compile ERROR.  Can't modify immutable data
	// b ~= 86;			 		// Compile ERROR.  Can't append to immutable data
	writeln;

	static immutable b_static = [42, 100];
	writeln("b_static: ", b_static, ", &b_static: ", &b_static);
	// b_static = [ 100, 42 ];  // Compile ERROR. Can't assign to static immutable
	// b_static[0] = 99;		// Compile ERROR. Can't modify static immutable data
	// b_static ~= 86;			// Compile ERROR. Can't append to static immutable data
}

// Compile Time Function Execution (CTFE)
int totalLines()
{
	return 42;
}

int totalColumns() => 7;

string name()
{ 
	return "list";
}
