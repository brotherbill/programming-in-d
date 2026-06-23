import std.stdio;
import school.school;

void main()
{
	auto student = Student("Tim", Gender.male);
	writeln(student);

	auto school = new School;

	school.add(Student("Lindsey", Gender.female));
	school.add(Student("Mark",    Gender.male));
	school.add(Student("Nancy",   Gender.female));

	writeln(school);
}
