import std.stdio;

void main()
{
	auto student = Student("Tim", Gender.male);
	writefln("%s is a %s student.", student.name, student.gender);

	// Mistake, directly mutating student name
	student.name = "Anna";
	writefln("%s is a %s student.", student.name, student.gender);
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
