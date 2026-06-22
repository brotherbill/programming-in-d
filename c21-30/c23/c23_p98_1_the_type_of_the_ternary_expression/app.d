import std.stdio;

void main()
{
	int i;
	double d;
	bool someCondition = true;
	auto result = someCondition ? i : d;

	writeln(typeof(result).stringof, ": ", result);

	int count = 12;
	// string and count do not have a common type
	// writeln((count == 12) ? "A dozen" : count, // ←	compilation ERROR" 
	// 		"items will be shipped.");

	// Convert count to string, then it compiles as both are strings
	import std.conv;
	writeln((count == 12) ? "A dozen" : to!string(count),
		" items will be shipped.");
}
