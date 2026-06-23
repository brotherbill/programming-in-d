void main()
{
	char[] fileName;
	fileName ~= "student_grades";

	// let's first attempt casting filename to string.
	// This makes the compiler happy, but ... (We are telling the compiler to trust the developer)
	auto student = Student(cast(string)fileName);

	// ...

	// Assume the fileName variable is modified later on  perhaps unintentionally (all of its characters are being set to 'A' here):
	// Before: "student_grades"
	// After : "AAAAAAAAAAAAAA"
	fileName[] = 'A';	// Oops!  This still changes filename!  (Developer make a mistake!)

	// ...

	// The grades would be written to the wrong file: 
	student.save();
}

struct Student
{
	string fileName;
	int[] grades;

	this(in string fileName)
	{
		this.fileName = fileName;
		grades ~= [70, 86, 100];
	}

	void save()
	{
		import std.stdio : File;
		
		auto file = File(fileName.idup, "w");
		file.writeln("The grades of the student:");
		file.writeln(grades);
	}
	// ...
}
