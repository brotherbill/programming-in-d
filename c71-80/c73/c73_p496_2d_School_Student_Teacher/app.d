import std.stdio;

void main()
{
	auto school = new School;

	school.addStudent("Bob");
	school.addStudent("Carol");
	school.addStudent("Ted");
	school.addStudent("Alice");

	school.addTeacher("Mr. Smith");
	school.addTeacher("Dr. Kildare");
	school.addTeacher("Albert Einstein");

	writeln("STUDENTS");
	foreach (const Student student; school)
	{
		writeln(student.name);
	}
	writeln;

	writeln("TEACHERS");
	foreach (const Teacher teacher; school)
	{
		writeln(teacher.name);
	}
}

class School
{
	Student[] students;
	Teacher[] teachers;

	int opApply(int delegate(ref const Student) dg) const
	{
		int result = 0;

		for (int i = 0; i < students.length; ++i)
		{
			const Student student = students[i];
			result = dg(student);
			if (result)
				break;
		}

		return result;
	}

	int opApply(int delegate(const ref Teacher) dg) const
	{
		int result = 0;

		for (int i = 0; i < teachers.length; ++i)
		{
			const Teacher teacher = teachers[i];
			result = dg(teacher);
			if (result)
				break;
		}
		return result;
	}

	void addStudent(string studentName)
	{
		students ~= new Student(studentName);
	}

	void addTeacher(string teacherName)
	{
		teachers ~= new Teacher(teacherName);
	}
}

class Student
{
	string name;

	this(string name)
	{
		this.name = name;
	}
}

class Teacher
{
	string name;

	this(string name)
	{
		this.name = name;
	}
}
