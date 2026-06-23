import std.stdio;
import std.string;

void main()
{
	auto school = new School;

	school.add(Student("Lindsey", Gender.female));
	school.add(Student("Mark", Gender.male));

	writeln(school);
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

class School
{
	Student[] students;
	size_t femaleCount;
	size_t maleCount;

	void add(Student student)
	{
		students ~= student;

		final switch (student.gender)
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
		return format("%s female, %s male; total %s students", femaleCount, maleCount, students
				.length);
	}
}
