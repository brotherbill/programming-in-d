import std.stdio : writeln;

void main()
{
	string a = "hello"; 		// immutable characters
	char[] mightyMutator = a;	// ← compilation ERROR.  mightyMutator would be able to modify the characters of string a.
	string c = mightyMutator;	// ← compilation ERROR.  mightyMutator would be able to modify the characters of string c.

	immutable aa = 10;
	int bb = aa; 				// compiles (value type)
	bb *= 2;

	writeln("aa: ", aa, ", bb: ", bb);
}
