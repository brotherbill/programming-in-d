import std.stdio : writeln;
import core.memory;

void main()
{
	auto a = new A();
	a = null;
	writeln("Before GC.collect");
	GC.collect;
	a = new A();
	a = null;
	writeln("Before GC.minimize");
	GC.minimize;
	writeln("After GC.minimize");
}

class A
{
	int[1000] x;

	~this()
	{
		writeln("class A finalized");
	}
}
