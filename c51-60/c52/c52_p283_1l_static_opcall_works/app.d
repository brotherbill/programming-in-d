import std.stdio : writeln;

void main()
{
	auto test = Test();

	// A struct that lives on the heap.  
	// Does not use the default constructor, but instead uses the default initializer, 
	//  which initializes all members to their default values (0 for integers, empty string for strings, etc.).  
	// This is because structs in D do not have constructors in the traditional sense.  
	// Instead, they have a default initializer that initializes all members to their default values.
	auto test2 = new Test();  // Creates a: 0, b: 0, name: "".

	writeln("test: ", test);	
	writeln("test2: ", typeof(test2).stringof);
	writeln("test2: ", *test2);
	writeln;

	test = Test.make;
	writeln("test: ", test);

	// auto test3 = new Test.make;  // Can't use Factory constructor with new, as it is not a constructor.  
									// It is a static method that returns an instance of Test.
}

struct Test
{
	int    a;
	int    b;
	// immutable int c; 	// Won't compile.  This workaround doesn't work for immutable members.
	string name;

	// Best practice is to choose this way, as it is direct with no shenanigans
	static Test make()
	{
		writeln("A Test object is being constructed by static Test.make()");
		Test test;			// Uses default constructor

		test.a    = 30;
		test.b    = 70;
		// test.c    = 86;	// Won't compile.  This workaround doesn't work for immutable members.
		test.name = "Bob";

		// auto infiniteLoop = Test.make;
		return test;
	}

	// Avoid this, as there are shenanigans in the weeds.  You have been warned.
	static Test opCall()
	{
		writeln("A Test object is being constructed by static Test opCall()");

		Test test;
		test.a    = 30; 	// emulate run time value
		test.b    = 70; 	// emulate run time value
		// test.c    = 86;	// Won't compile.  This workaround doesn't work for immutable members.
		test.name = "Bob"; 	// emulate run time value

		// auto infiniteLoop = Test();

		return test;
	}
}
