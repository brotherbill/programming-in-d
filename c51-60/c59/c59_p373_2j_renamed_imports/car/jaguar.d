module car.jaguar;

class Jaguar
{
    string name;

    this(string name)
    {
        import std.stdio : writeln;

        this.name = name;
        writeln("constructed car.jaguar.Jaguar: ", name, ", Drive Zoom, Zoom!");
    }
}
