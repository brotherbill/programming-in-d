import std.stdio : writeln, writefln;

void main()
{
	auto abc = "abc"d;		
	writefln("abc type is: %s", typeof(abc).stringof);
	dchar[] str = abc.dup;

	writeln("abc before: ", abc);
	writeln("str before: ", str);
	writeln;

	makeFirstLetterDot(str);

	writeln("abc after : ", abc);
	writeln("str after : ", str);
}

// str is a reference type
void makeFirstLetterDot(dchar[] str)
in (str != null)		// Design by Contract: precondition, str must not be null
in (str.length > 0)		// Design by Contract: precondition, str must not be empty
out (; str[0] == '.')	// Design by Contract: postcondition, first char must be '.'
do
{
	// this changes first char in str, which references str on line 7
	str[0] = '.';  
}
