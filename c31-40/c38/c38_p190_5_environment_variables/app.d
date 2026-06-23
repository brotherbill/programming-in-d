import std.stdio   : writeln;
import std.process : environment;
import std.string  : replace;

void main()
{
	string[string] envVars = environment.toAA;

	writeln("Environment Variables:");
	foreach (key, value; envVars)
	{
		writeln(key, " = ", value);
	}
	writeln;

	writeln("HOME: ", environment["HOME"]);
}
