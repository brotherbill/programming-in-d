import std.stdio;
import std.typecons;

void main()
{
	makeItFail;
}

class Kaboom
{
	void foo()
	{
		writeln("foo");
	}
}

void makeItFail()
{
	Kaboom kaboom = scoped!Kaboom(); // This is a definite D code smell.  Don't ever do this.
	writeln("makeItFail");
	kaboom.foo(); // Proxy object kaboom is being used as type Kaboom
}
