void main()
{
	auto bob   = new Student("Bob");
	auto cathy = new Student("Cathy");

	assert(bob < cathy);
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
		import std.exception : enforce;

		auto rhs = cast(Student) o;
		enforce(rhs !is null, "Can only compare with another Student");

		     if (name < rhs.name) return -1;
		else if (name > rhs.name) return  1;
		else                      return  0;
	}
	// ...
}
