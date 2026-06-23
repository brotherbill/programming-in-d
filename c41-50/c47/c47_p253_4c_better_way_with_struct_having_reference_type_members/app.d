import std.stdio : writeln;

void main()
{
    // Constructing the first object:
    auto student1 = Student(1, [70, 90, 85]);

    // Constructing the second student as a copy of the first one and then changing its number:
    auto student2 = Student(2, student1.grades.dup);

    // Changing the grades of the first student ...
    student1.grades[0] += 5;

    // ... does not affect the second student:
    writeln(__LINE__, " student1: ", student1);
    writeln(__LINE__, " student2: ", student2);
    writeln;
    writeln(__LINE__, " student2.grades[0]: ", student2.grades[0]);
}

struct Student
{
    int   number;
    int[] grades;
}
