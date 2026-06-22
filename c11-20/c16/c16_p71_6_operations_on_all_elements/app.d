import std.stdio : writeln;

void main()
{
	// Demonstration of D's array element-wise operations
	int[] a = [1, 2, 3];
	int[] b = [10, 20, 30];
	int[] c;		 // result must have same type and length as a and b
	c.length = 3;	 // allocate space for 3 elements, so array addition uses pre-allocated memory
	writeln("initially a: ", a, ", b: ", b, ", c: ", c);
	writeln();

	writeln("--- To support element-wise operations, types and lengths must match ---");
	assert(typeof(a).stringof == typeof(b).stringof && typeof(b).stringof is typeof(c).stringof);
	assert(a.length  == b.length  && b.length  == c.length);
	c[] = a[] + b[]; // [11, 22, 33]
	writeln("after c[] = a[] + b[]; c: ", c, "   (element-wise addition, all must be same type, same length)");
	writeln();

	writeln("--- Element-wise operations with scalars ---");
	a[] *= 100;      // a is [100, 200, 300]
	writeln("after a[] *= 100;    a: ", a, "  (multiplication by scalar to each element)");
	writeln();

	writeln("--- Assign each element of a to 5 ---");
	a[] = 5;         // a is [  5,   5,   5]
	writeln("after a[] = 5;       a: ", a, "        (assignment of scalar to each element)");
	writeln();

	writeln("--- Element-wise copy assignment from one array to another ---");
	assert(typeof(a).stringof == typeof(b).stringof && typeof(b).stringof is typeof(c).stringof);
	assert(a.length  == b.length  && b.length  == c.length);
	a[] = b[];       // a =  [ 10,  20,  30]  preferred syntax
	a[0] = 1;        // change a to show a is copied, not referenced
	writeln("after a[] = b[];     a: ", a, ",   b: ", b, "    (element-wise assignment - preferred syntax)");

	b = [100, 200, 300]; // change b to show a is copied, not referenced
	a[] = b;         // a =  [ 10,  20,  30]  working syntax
	a[0] = 2;        // change a to show a is copied, not referenced
	writeln("after a[] = b;       a: ", a, ", b: ", b, " (element-wise assignment)");
	writeln();

	writeln("--- Slice assignments ---");
	b = [1_000, 2_000, 3_000]; 		// change b to show a is a slice of b, with sharing
	a = b[0 .. $];   				// a is a slice of b     preferred syntax
	b[1] = 999;	   	 				// change b to show a is a slice, not a copy
	writeln("after a = b[0 .. $]; a: ", a, ",  b: ", b, "    (slice of b - preferred syntax)");

	b = [10_000, 20_000, 30_000]; 	// change b to show a is a slice of b, with sharing
	a = b;           				// a is a slice of b     working syntax
	b[1] = 42;	   	 				// change b to show a is a slice, not a copy
	writeln("after a = b;         a: ", a, ", b: ", b, "   (slice of b - working syntax)");

	b = [111, 222, 333]; 			// change b to show a is a slice of b, with sharing
	a = b[];		  				// a =  [ 10,  20,  30]  working syntax
	a[0] = 3;        				// change a to show a is a slice, not a copy	
	writeln("after a = b[];       a: ", a, ",      b: ", b, "        (element-wise assignment)");
}
