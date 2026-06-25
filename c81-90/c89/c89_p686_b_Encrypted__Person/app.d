import std.stdio : writeln;

void main()
{
	foreach (attr; __traits(getAttributes, Person.name))
	{
		writeln(attr.stringof);
	}
}

struct Person
{
	@Encrypted @Colored(Color.blue) string name;
	string lastName;
	@Colored(Color.red) string address;
}

struct Encrypted
{
}

enum Color
{
	black,
	blue,
	red
}

struct Colored
{
	Color color;
}
