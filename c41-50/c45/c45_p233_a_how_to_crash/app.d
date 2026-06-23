import std.stdio : writeln;

void main()
{
	MyClass referencesAnObject = new MyClass;
	referencesAnObject.member = 42;
	referencesAnObject.use;
	writeln("main() referencesAnObject: ", referencesAnObject);

	MyClass nullVariable;  	// ← variable is not initialized
	assert(referencesAnObject !is nullVariable);
	assert(referencesAnObject !=  nullVariable);

	writeln("main() nullVariable: ", nullVariable);
	use(nullVariable);		// nullVariable is null
}

void use(MyClass variable)
// in (variable !is null)
{
	writeln("use() variable.member: ", variable.member);

	try
	{
		writeln("use: ", variable.member); // ← BUG
	}
	catch (Exception ex)
	{
		writeln("Exception: ", ex);
	}
}

class MyClass
{
	int member;
}
