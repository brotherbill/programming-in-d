import std.stdio : writeln;

void main()
{
	auto variable1 = new MyClass;
	auto variable2 = variable1;
	auto variable3 = new MyClass;

	writeln("&variable1: ", &variable1); // variable1 and variable2 are different variables
	writeln("&variable2: ", &variable2);

	// Use is and !is to check reference identity.  
	// Don't use == to compare references, because that will compare the values of the objects, not their identities.
	assert(variable1 !is null);
	assert(variable2 !is null);
	assert(variable3 !is null);
	assert(variable1 is variable2); 	// variable1 and variable2 are referencing the same MyClass object
	assert(variable1 !is variable3);	// variable3 is referencing a different MyClass object
	assert(variable2 !is variable3);	// variable3 is referencing a different MyClass object
	assert(variable2 != variable3);		// by default, class instances compare their references rather than their contents.

	// variable1 and variable2 are referencing the same MyClass object, so changes to one will affect the other
	variable2.id = 999;
	assert(variable1.id == 999);		
	assert(variable2.id == 999);		
}

class MyClass
{
	int id;
}
