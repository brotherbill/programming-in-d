import std.stdio : writeln;

void main()
{
	import std.conv : to;

	salute("Jane");		 // ← compilation ERROR.  "Jane" is a string, not a Student

	salute(     Student("Jane"));
	salute(  to!Student("Jean"));
	salute(cast(Student) "Jim");
}

struct Student
{
	string name;

	this(string name)
	{
		this.name = name;
	}
}

void salute(Student student)
{
	writeln("Greetings ", student.name);
}
