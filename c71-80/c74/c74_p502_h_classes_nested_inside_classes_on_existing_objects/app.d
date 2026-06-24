import std.stdio;

void main()
{
	auto var = new OuterClass(10);
	writeln("var.outerMember is ", var.outerMember);

	auto nestedObject = var.new OuterClass.NestedClass();
	writeln("nestedObject.func is ", nestedObject.func);

	auto var2 = nestedObject.outer;
	writeln("var2.outerMember is ", var2.outerMember);
}

class OuterClass
{
	int outerMember;

	this(int outerMember)
	{
		this.outerMember = outerMember;
	}

	class NestedClass
	{
		int func()
		{
			// A nested class can access members of the outer class
			return outerMember * 2;
		}

		OuterClass context()
		{
			// A nested class can access its outer object (i.e. its context) by '.outer'
			return this.outer;
		}
	}

	NestedClass algorithm()
	{
		// An outer class can construct a nested object by '.new'
		return this.new NestedClass();
	}
}
