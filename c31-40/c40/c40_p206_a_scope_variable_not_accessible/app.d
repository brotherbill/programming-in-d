import std.stdio:  writeln;

void main()
{
	int a = 100;

	foo(a);
	writeln(a); // prints 100
}

void foo(ref int r)
{	
	try
	{
		int addend = 42;

		r += addend;
		mayThrow();
	}
	catch (Exception exc)
	{
		r -= addend;
	}
}

void mayThrow()
{
	throw new Exception("I was thrown just for grins");
}
