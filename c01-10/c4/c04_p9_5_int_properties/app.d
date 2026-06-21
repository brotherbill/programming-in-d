import std.stdio;

void main()
{
	int meaning = 42;
	writeln("meaning. Type           : ", meaning.stringof);
	writeln("meaning. Length in bytes: ", meaning.sizeof);
	writeln("meaning. Minimum value  : ", meaning.min);
	writeln("meaning. Maximum value  : ", meaning.max);
	writeln("meaning. Initial value  : ", meaning.init);
	writeln();

	writeln("int. Type           : ", int.stringof);
	writeln("int. Length in bytes: ", int.sizeof);
	writeln("int. Minimum value  : ", int.min);
	writeln("int. Maximum value  : ", int.max);
	writeln("int. Initial value  : ", int.init);
}
