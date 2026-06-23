module school.student;

import std.string;
import std.conv;

enum Gender
{
    female,
    male
}

struct Student
{
    package string name;
    package Gender gender;

    string toString() const
    {
        return format("%s is a %s student.", name, to!string(gender));
    }
}
