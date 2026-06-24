import std.stdio;
import std.string;

void main()
{
	writeln(structDefinition!("Student",
			string, "name",
			int,    "id",
			int[],  "grades")());
}

string structDefinition(string name, Members...)()
{
	// Ensure that members are specified as pairs: first the type then the name
	static assert((Members.length % 2) == 0,
		"Members must be specified as pairs.");

	// The first part of the struct definition
	string result = "struct " ~ name ~ "\n{\n";

	foreach (i, arg; Members)
	{
		static if (i % 2)
		{
			// The odd numbered arguments should be the names of members. 
			// Instead of dealing with the names here, we use them as Members[i+1] in the 'else' clause below.
			//
			// Let's at least ensure that the member name is specified as a string
			static assert(is(typeof(arg) == string),
				"Member name " ~ arg.stringof ~ " is not a string.");
		}
		else
		{
			// In this case 'arg' is the type of the member. Ensure that it is indeed a type
			static assert(is(arg), arg.stringof ~ " is not a type.");
			// Produce the member definition from its type and its name
			//
			// Note: We could have written 'arg' below instead of Members[i]
			result ~= format("    %s %s;\n", Members[i].stringof, Members[i + 1]);
		}
	}

	// The closing bracket of the struct definition
	result ~= "}";
	return result;
}
