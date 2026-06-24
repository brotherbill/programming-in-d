import std.stdio;
import std.string;

void main()
{
	auto school = School([
		Student("Ebru",  1),
		Student("Derya", 2),
		Student("Damla", 3)
	]);

	print(StudentRange(school));

	// The actual array is now preserved:
	assert(school.students.length == 3);
}

struct School
{
	Student[] students;
}

struct Student
{
	string name;
	int    number;

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
