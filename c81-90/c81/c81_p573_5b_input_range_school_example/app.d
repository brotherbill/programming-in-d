import std.stdio;
import std.string;

void main()
{
	auto school = School([
		Student("Ebru",  1),
		Student("Derya", 2),
		Student("Damla", 3)
	]);
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

struct School
{
	Student[] students;
}
