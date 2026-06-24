import std.stdio;
import std.string;

// Portions Copyleft (ɔ) 2009-2022 Ali Çehreli
// Portions Copyleft (ɔ) 2025 William Steinberg  www.dcheatsheet.com

void main()
{
    auto school = School([
        Student("Ebru",  1),
        Student("Derya", 2),
        Student("Damla", 3),
    ]);

    print(school);

    // This displays all students, as structs have copy semantics, so print(school) makes a copy of school
    writeln("school.students: ", school.students);

	import std.array;
	auto copiesOfStudents = school.array;	// Note: Also taking advantage of UFCS
	writeln("students array: ", copiesOfStudents);
	writeln("copiesOfStudents: ", typeof(copiesOfStudents).stringof);
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

struct School
{
    Student[] students;

    bool empty() const => students.length == 0;

    ref Student front() => students[0];

    void popFront()
    {
        students = students[1 .. $];
        debug writeln("students::", students);
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
