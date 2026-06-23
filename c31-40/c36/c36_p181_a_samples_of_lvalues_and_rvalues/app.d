import std.stdio;

void main()
{
	int mut            = 42;
	immutable(int) imm = 86;
	auto arr           = [1];
	auto aa            = [10: "ten"];
	enum message       = "hello";

	ref int pick(return ref int lhs, return ref int rhs)
	{
		return true ? lhs : rhs;
	}

	ref int ref_function()
	{
		static int a = 100;
		static int b = 200;

		writeln("Inside ref_function(), &a: ", &a);
		return pick(a, b); 
	}

	// All of the following arguments are lvalues.
	writeln("Lvalues");
	writeln("mut           : ", mut, ",  ", &mut); 								// mutable variable
	writeln("imm           : ", imm, ",  ", &imm); 								// immutable variable
	writeln("arr           : ", arr, ", ", &arr); 								// array
	writeln("arr[0]        : ", arr[0], ",   ", &(arr[0])); 					// array element
	writeln("aa[10]        : ", aa[10], ", ", &(aa[10])); 						// associative array element
	writeln("ref_function(): ", ref_function, ",       ", &(ref_function()));	// return value of a ref function
	writeln("ref_function(): ", ref_function, ",       ", &ref_function); 		// type of a ref function
	writeln; // etc.

	// All of the following arguments are rvalues
	writeln("Rvalues");
	writeln("42            : ", 42); 				// a literal
	writeln("message       : ", message); 			// a manifest constant
	writeln("mut + 1       : ", mut + 1); 			// a temporary value
	writeln("calculate(mut): ", calculate(mut));	// return value of a function, not a ref function
	writeln;
	// etc.

	const     string const_string     = "I'm a const string";
	immutable string immutable_string = "I'm an immutable string";
	enum      string enum_string      = "I'm a literal enum string";
	writeln("&const_string    : ", &const_string); 		// const variable
	writeln("&immutable_string: ", &immutable_string); 	// immutable variable
	// writeln("&enum_string     : ", &enum_string); 	// enum variable.  Won't compile, as enums are literals, not variables, and have no address.
}

int calculate(int i)
{
	return i * 2;
}
