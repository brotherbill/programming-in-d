module animal.horse;

class Horse
{
    string name;

    this(string name)
    {
        import std.stdio : writeln;

        this.name = name;
        writeln("constructed Horse: ", name);
    }
}
