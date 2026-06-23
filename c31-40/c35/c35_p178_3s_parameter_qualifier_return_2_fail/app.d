ref int pick(ref int lhs, ref int rhs)
{
	import std.random : uniform;

	return uniform(0, 2) ? lhs : rhs;
}

// Unlike Go language, which "expands" a and b to the heap, D is similar to C language here.
// int a and int b are local variables that live on the stack.
// The result is an address of where a (or b) lived on the stack.
// But when foo() completes, the stack is popped and what now occupies that stack memory is undefined.
// Thus, to use that reference causes undefined behavior, generally considered poor programming.
ref int foo()
{
	int a;
	int b;
	return pick(a, b); // ← RUN-TIME BUG: returning invalid reference, as a and b go out of scope on function return
}

ref int better_foo() 
{
	static int a;
	static int b;
	return pick(a, b); // OK: returning reference to static variables
}

// The D compiler does not catch this error!
void main()
{
	foo() = 42; 		// ← RUN-TIME BUG: writing to invalid memory.  Undefined behavior.

	better_foo() = 42;	// ← OK: writing to valid memory
}
