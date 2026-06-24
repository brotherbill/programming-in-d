import std.stdio;

void foo(int delegate(double) pure dg)
{
	int i = dg(1.5);
}

void main()
{
	foo(a => 42); // ← compiles

	foo((a) { // ← compilation ERROR
		writeln("hello"); // writes to I/O
		return 42;
	});
}
