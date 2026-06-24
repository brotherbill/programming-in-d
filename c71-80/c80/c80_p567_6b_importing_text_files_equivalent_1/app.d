void main()
{
	string s = `Hello`;

	mixin(`s ~= ", World!";
 		import std.stdio : writeln;
 		writeln(s);`
	);
}
