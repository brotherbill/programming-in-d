import std.stdio;

void main()
{
	immutable(string) fileName = "student_grades";

	// let's first attempt casting filename to string.
	// This makes the compiler happy, but ... (We are telling the compiler to trust the developer)
	auto student = Student(fileName);

	// ...

	// The grades would be written to the wrong file: 
	student.save();
}

struct Student
{
	immutable(string) fileName;
	int[] grades;

	this(immutable(string) fileName)
	{
		this.fileName = fileName;
		grades ~= [70, 86, 100];
	}

	void save()
	{
		writeln("Saving grades to file: ", fileName);
		auto file = File(fileName, "w");

		file.writeln("The grades of the student:");
		file.writeln(grades);
	}
	// ...
}
