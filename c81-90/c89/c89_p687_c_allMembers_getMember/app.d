import std.stdio : writeln, writef;

void main()
{
	foreach (memberName; __traits(allMembers, Person))
	{
		writef("The attributes of %-8s:", memberName);

		foreach (attr; __traits(getAttributes, __traits(getMember, Person, memberName)))
		{
			writef(" %s", attr.stringof);
		}
		
		writeln();
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
