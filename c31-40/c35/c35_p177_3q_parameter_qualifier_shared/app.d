import std.stdio : writeln;

void main()
{
	compilation_error;
	now_it_works;
	writeln("Done");
}

void foo(shared int[] i)
{
	// ...
}

void compilation_error()
{
	int[] numbers = [10, 20];
	foo(numbers);	 // ← compilation ERROR. Cannot implicitly convert from 'int[]' to 'shared int[]'.	
}

void now_it_works()
{
	shared int[] numbers = [10, 20];
	foo(numbers); // now compiles
}
