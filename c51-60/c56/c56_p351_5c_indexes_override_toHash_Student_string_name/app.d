import std.stdio     : writeln;
import std.exception : enforce;
import std.algorithm : cmp;

void main()
{
	auto bob1 = new Student("Bob");
	auto bob2 = new Student("Bob");

	string[Student] students;
	students[bob1] = "Student Bob";

	assert(bob1 in students);
	assert(bob2 in students);

	writeln("students[bob1] : ", students[bob1]);
	writeln("students[bob2] : ", students[bob2]);
	writeln("students.length: ", students.length);
}

class Student
{
	string name;

	this(string name)
	{
		this.name = name;
	}

	override int opCmp(Object o) const
	{
		auto rhs = cast(Student) o;
		enforce(rhs);

		return cmp(name, rhs.name);
	}

	override size_t toHash() const
	{
		auto t_name    = typeid(name);
		auto t_string  = typeid(string);
		auto h_name    = typeid(name).getHash(&name);
		auto h_string  = typeid(string).getHash(&name);
		auto hs_string = typeid(typeof(name)).getHash(&name);
		return typeid(name).getHash(&name);
	}

	override bool opEquals(Object o) const
	{
		auto rhs = cast(const Student) o;

		bool result = rhs && (name == rhs.name);
		return result;
	}
}
