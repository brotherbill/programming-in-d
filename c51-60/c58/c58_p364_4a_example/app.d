import std.stdio;
import std.array;
import std.conv;

// import std.random;

void main()
{
    immutable courses = XmlElement("courses", 0);

    foreach (courseId; 0 .. 2)
    {
        immutable courseTag = "course" ~ to!string(courseId);
        immutable courseElement = XmlElement(courseTag, 1);

        foreach (i; 0 .. 3)
        {
            immutable gradeElement = XmlElement("grade", 2);
            immutable randomGrade = 90;

            writeln(indentationString(3), randomGrade);
        }
    }
}

struct XmlElement
{
    string name;
    string indentation;

    this(string name, int level)
    {
        this.name = name;
        this.indentation = indentationString(level);

        writeln(indentation, '<', name, '>');
    }

    ~this()
    {
        writeln(indentation, "</", name, '>');
    }
}

string indentationString(int level)
{
    return replicate(" ", level * 2);
}
