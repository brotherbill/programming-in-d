import std.stdio;

void main()
{
    withoutWith;
    withWith;
}

enum Color
{
    red,
    orange,
    yellow,
    green,
    blue,
    indigo,
    violet
}

void withoutWith()
{
    enum c = Color.blue;

    final switch (c)
    {
    case Color.red:
        writeln("red");
        break;
    case Color.orange:
        writeln("orange");
        break;
    case Color.yellow:
        writeln("yellow");
        break;
    case Color.green:
        writeln("green");
        break;
    case Color.blue:
        writeln("blue");
        break;
    case Color.indigo:
        writeln("indigo");
        break;
    case Color.violet:
        writeln("violet");
        break;
    }
}

void withWith()
{
    enum c = Color.blue;

    final switch (c) with (Color)
    {
    case red:
        writeln("red");
        break;
    case orange:
        writeln("orange");
        break;
    case yellow:
        writeln("yellow");
        break;
    case green:
        writeln("green");
        break;
    case blue:
        writeln("blue");
        break;
    case indigo:
        writeln("indigo");
        break;
    case violet:
        writeln("violet");
        break;
    }
}
