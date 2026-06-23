import std.stdio : writefln;
import std.process : executeShell;

void main()
{
	immutable        result     = executeShell("ls -l app.d");
	immutable int    returnCode = result[0];
	immutable string output     = result[1];

	writefln("typeof result: %s\n", typeof(result).stringof);
	writefln("ls returned %s.\n", returnCode);
	writefln("Its output:\n%s", output);
}
