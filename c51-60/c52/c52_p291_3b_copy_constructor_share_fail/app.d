import std.stdio;

void main()
{
	auto student1 = Student(1, [70, 90, 85]);

	auto student2 = student1; // copy construction
	student2.number = 2;

	student1.grades[0] += 5; // this changes the grade of the second student as well

	assert(student1.grades[0] == 75);
	assert(student2.grades[0] == 75);
}

struct Student
{
	int   number; 	// value type
	int[] grades; 	// reference type
}
