import std.stdio;
import std.string;
import std.range;
import std.algorithm : filter;

void main()
{
    auto school = School([
        Student("Ebru",  1),
        Student("Derya", 2),
        Student("Damla", 3)
    ]);

    print(StudentRange(school));
    writeln;

    // Note: Again, taking advantage of UFCS
    writeln("school.studentsOf.filter!(a => a.number % 2)");
    print(school.studentsOf.filter!(a => a.number % 2));
}

StudentRange studentsOf(ref School school)
{
    return StudentRange(school);
}

struct School
{
    Student[] students;
}

struct Student
{
    string name;
    int number;

    string toString() const
    {
        return format("%s(%s)", name, number);
    }
}

struct StudentRange
{
    Student[] students;
    this(School school)
    {
        this.students = school.students;
    }

    bool empty() const
    {
        return students.length == 0;
    }

    ref Student front()
    {
        return students[0];
    }

    void popFront()
    {
        students = students[1 .. $];
    }
}

void print(T)(T range)
{
    for (; !range.empty; range.popFront())
    {
        write(' ', range.front);
    }

    writeln();
}
