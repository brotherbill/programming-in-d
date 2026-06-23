void main()
{
	auto variable1 = new MyClass(1);
	auto variable2 = new MyClass(2);

	// variable2 disassociates from new MyClass(2), where GC (garbage collector) can reclaim its memory.
	// now both variable1 and variable2 are both referencing new MyClass(2).
	variable1 = variable2;

	assert(variable1 is variable2);
}

class MyClass
{
	int id;

	this(in int id)
	{
		this.id = id;
	}
}
