import std.stdio : writeln;

// Module (file level) scope is not supported in D
{		// has compiler error
	int module_level_variable;
}

void main()
{
	writeln("module_level_variable: ", module_level_variable);
}
