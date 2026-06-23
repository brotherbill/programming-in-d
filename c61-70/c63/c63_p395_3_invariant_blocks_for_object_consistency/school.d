module school;

import std.string;

class School
{
private:
    Student[] students;
    size_t femaleCount;
    size_t maleCount;

    invariant ()
    {
        assert(students.length == (femaleCount + maleCount));
    }

public: // 3
    void add(Student student)
    {
        students ~= student;

        final switch (student.gender)   // 4a
        { 
        case Gender.female:
            ++femaleCount;
            break;
        case Gender.male:
            ++maleCount;
            break;
        }
    }

    override string toString() const
    {
        string result = format("%s female, %s male; total %s students", femaleCount, maleCount, students
                .length);

        foreach (i, student; students)
        {
            result ~= (i == 0) ? ": " : ", ";
            result ~= student.name; // 4b
        }

        return result;
    }
}

enum Gender
{
    female,
    male
}

struct Student
{
    string name;
    Gender gender;
}
