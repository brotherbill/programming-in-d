void main()
{
	// referencesAnObject is a reference to an object of type MyClass
	MyClass referencesAnObject = new MyClass;
	assert(referencesAnObject !is null);

	MyClass variable;
	// does not reference an object
	assert(variable is null);
}

class MyClass
{
	int id;
}
