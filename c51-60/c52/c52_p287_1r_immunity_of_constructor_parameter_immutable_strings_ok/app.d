import std.stdio;

void main()
{
	string fileName;
	fileName ~= "student_grades";

	// let's first attempt casting filename to string.
	// This makes the compiler happy, but ... (We are telling the compiler to trust the developer)
	auto student = Student(cast(immutable(string))fileName);

	// ...

	// Assume the fileName variable is modified later on  perhaps unintentionally (all of its characters are being set to 'A' here):
	// Before: "student_grades"
	// After : "AAAAAAAAAAAAAA"
	fileName[] = 'A';	// Won't compile.  Compiler detects modifying a string in place, which is prohibited.
	// fileName ~= "_ERROR";   // Another way to modify fileName.

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
		// auto file = File(fileName.idup, "w");
		auto file = File(fileName, "w");

		file.writeln("The grades of the student:");
		file.writeln(grades);
	}
	// ...
}
