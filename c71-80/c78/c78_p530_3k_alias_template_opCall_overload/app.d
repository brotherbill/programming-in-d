import std.stdio;

void main()
{
	auto o = new C();
	caller!o();

	caller!({ writeln("Function literal called."); })();
}

class C
{
	void opCall()
	{
		writeln("C.opCall called.");
	}
}

void caller(alias func)()
{
	write("calling: ");
	func();
}
