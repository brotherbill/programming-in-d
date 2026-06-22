import std.stdio : writeln;

void main()
{
	writeln("In main()");

	const fruits = ["apple", "pear"];

	// fruits2 will not mutate value, but makeFruits may allow others to mutate via reference.
	const fruits2 = makeFruits;

	// immutable fruits2i = makeFruits;  // Won't compile.  Cannot implicitly convert string[] to immutable(string[])
	immutable fruits2i = makeFruits.idup;

	const fruits3 = 
	{   // IIFE Immediately Invoked Function Expression		
		// Exactly the same code as 'makeFruits()'.
		auto result = ["apple", "pear"];
		bool addCitrus = false;
		addCitrus = !addCitrus;

		if (addCitrus)
		{
			result ~= ["orange"];
		}

		return result;
	}();

	bool addCitrus = true;

	if (addCitrus)
	{
		// fruits ~= ["orange"];	// ← compilation ERROR. fruits is const.  Can't append.
	}

	writeln("fruits  : ", fruits);
	writeln("fruits2 : ", fruits2);
	writeln("fruits2i: ", fruits2i);
	writeln("fruits3 : ", fruits3);
}

// Function that builds and returns a mutable array of strings.
// result is: ["apple", "pear", "orange"]
string[] makeFruits()
{
	auto result = ["apple", "pear"];
	bool addCitrus = false;
	addCitrus = !addCitrus;

	if (addCitrus)
	{
		result ~= ["orange"];
	}

	return result;
}
