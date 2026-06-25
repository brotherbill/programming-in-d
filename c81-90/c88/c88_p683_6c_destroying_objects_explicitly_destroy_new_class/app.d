import std.stdio : writeln, writefln;

void main()
{
    auto c = new C(42);

    writeln("Before destroy()");
    destroy(c); // ← Correct usage
    writeln("After destroy()");

    writefln("c: %s", c);	// Fail at run time, since c is destroyed
    writeln("Leaving main");
}

class C
{
    int i;
    this(int i)
    {
        this.i = i;
        writefln("Constructing object with value %s", i);
    }

    ~this()
    {
        writefln("Destroying object with value %s", i);
    }
}
