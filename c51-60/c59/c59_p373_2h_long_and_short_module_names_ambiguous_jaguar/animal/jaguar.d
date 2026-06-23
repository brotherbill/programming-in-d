module animal.jaguar;

class Jaguar
{
    string name;

    this(string name)
    {
        import std.stdio : writeln;

        this.name = name;
        writeln("constructed animal.jaguar.Jaguar: ", name, ", Roar!");
    }
}
