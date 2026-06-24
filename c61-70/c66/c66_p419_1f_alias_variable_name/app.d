import std.stdio;

void main()
{
	int variableWithALongName = 42;
	writeln("&variableWithALongName: ", &variableWithALongName);

	alias var = variableWithALongName;
	
	var = 43;
	writeln("&var: ", &var);
	writeln;

	writeln("variableWithALongName: ", variableWithALongName);
	writeln("var: ", var);
}
