void main()
{
	char[] fileName;
	fileName ~= "student_grades";

	auto student = Student(fileName);

	// ...

	// Assume the fileName variable is modified later on  perhaps unintentionally (all of its characters are being set to 'A' here):
	// Before: "student_grades"
	// After : "AAAAAAAAAAAAAA"
	fileName[] = 'A';	// Change each character to 'A'

	// ...

	// The grades would be written to the wrong file: 
	student.save();
}

struct Student
{
	import std.stdio : File;
	
	const char[] fileName;
	      int [] grades;

	this(const char[] fileName)
	{
		this.fileName = fileName;
		grades ~= [70, 86, 100];
	}

	void save()
	{
		auto file = File(fileName.idup, "w");
		file.writeln("The grades of the student:");
		file.writeln(grades);
	}
	// ...
}
