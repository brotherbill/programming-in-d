import std.stdio;

void main()
{
	auto outerObject = new OuterClass(10);
	writeln("outerObject.outerMember is ", outerObject.outerMember);

	// A member function of an outer class is returning a nested object:
	// We cannot replace auto with NestedClass.  Voldemort issue.
	auto nestedObject = outerObject.algorithm();

	// The nested object gets used in the program: 
	int twenty = nestedObject.func();
	writeln("nestedObject.func is ", twenty);

	// Naturally, the context of nestedObject is the same as outerObject:
	assert(nestedObject.context() is outerObject);
	writeln("nestedObject.context.outerMember: ", nestedObject.context.outerMember);
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
