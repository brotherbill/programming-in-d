import std.stdio;

void main()
{
	// Variable on the left, object on the right
	ClassType variable = new ClassType;

	// Applied to the variable but accesses the member of the object
	variable.member = 42;
}

class ClassType
{
	int member;
}
