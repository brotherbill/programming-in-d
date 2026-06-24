import std.stdio;

void main()
{
    caller!foo();
    caller!bar();

    int variable;
    caller!variable(); // ← compilation ERROR
}

void caller(alias func)()
{
    write("calling: ");
    func();
}

void foo()
{
    writeln("foo called.");
}

void bar()
{
    writeln("bar called.");
}
