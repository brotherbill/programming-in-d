module animal.dog;

class Dog
{
    string name;

    this(string name)
    {
        import std.stdio : writeln;

        this.name = name;
        writeln("constructed Dog: ", name);
    }
}
