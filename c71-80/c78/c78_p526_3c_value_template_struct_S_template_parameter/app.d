import std.stdio;

void main()
{
	foo!(S(42))();  // Instantiating with literal S(42)
	foo!(S(999))(); // Instantiating with literal S(999)
}

struct S
{
	int i;
}

// Value template parameter of struct S
void foo(S s)()
{
	writeln("struct S s: ", s);
}
