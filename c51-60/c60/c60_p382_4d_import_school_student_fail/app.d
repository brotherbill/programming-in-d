import std.stdio;
import school.school;

void main()
{
    auto student = Student("Tim", Gender.male);
    writefln("%s is a %s student.", student.name, student.gender);
}
