import std.stdio;
import std.array;

// import std.random;
import std.conv;

void main()
{
    const courses = new XmlElement("courses", 0);
    scope (exit)
        destroy(courses); // Note how close destroy() is to constructor

    foreach (courseId; 0 .. 2)
    {
        const courseTag = "course" ~ to!string(courseId);
        const courseElement = new XmlElement(courseTag, 1);
        scope (exit)
        { // may be a block
            destroy(courseElement);
        }

        foreach (i; 0 .. 3)
        {
            const gradeElement = new XmlElement("grade", 2);
            scope (exit)
                destroy(gradeElement); // or just a single statement

            const randomGrade = 90; // uniform(50, 101);
            writeln(indentationString(3), randomGrade);
        }
    }
}

string indentationString(int level)
{
    return replicate(" ", level * 2);
}

class XmlElement
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
