module cat;
import std.stdio : writeln;

static this()
{
    // ... the initial operations of the module...
    writeln("Spinning up module cat for this thread");
}

static ~this()
{
    // ... the final operations of the module...
    writeln("Spinning down module cat for this thread");
}

shared static this()
{
    // ... the initial operations of the module...
    writeln("Spinning up module cat for the entire app");
}

shared static ~this()
{
    // ... the initial operations of the module...
    writeln("Spinning down module cat for the entire app");
}

class Cat
{
    string name;

    this(string name)
    {
        import std.stdio : writeln;

        this.name = name;
        writeln("constructed Cat: ", name);
    }
}
