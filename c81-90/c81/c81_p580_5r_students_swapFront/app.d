import std.stdio;
import std.string;
import std.range;
import std.algorithm : swapFront;

void main()
{
	auto turkishSchool = School(
		[
			Student("Ebru",  1),
			Student("Derya", 2),
			Student("Damla", 3)
		]);

	auto americanSchool = School(
		[
			Student("Mary", 10), 
			Student("Jane", 20)
		]);

	// swapFront not in std.algorithm 2.111.0
	swapFront(turkishSchool.studentsOf, americanSchool.studentsOf);		// Won't compile

	print(turkishSchool.studentsOf);
	print(americanSchool.studentsOf);
}

StudentRange studentsOf(ref School school)
{
	return StudentRange(school);
}

struct School
{
	Student[] students;
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
