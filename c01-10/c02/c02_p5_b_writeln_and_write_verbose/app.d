void main()
{
	import std.stdio : write, writeln, stderr, stdout;

	// Let's first print what we have available:
	stderr.write("Hello,");

	// ... let's assume more operations at this point ...
	stderr.write("World!");

	// ... and finally this completes the writing to the console with a newline
	stderr.writeln();

	// This writes: "Greetings, " to the stdout cache.
	write("Greetings, ");
	// This flushes the stdout cache, so the console displays: Greetings,
	stdout.flush();

	// This writes: "World!" to the stdout cache.
	write("World!");
	// This flushes the stdout cache, so the console displays: Greetings, World!
	writeln();

	write("I'm hiding! ");
	write("Why don't you see me on the console!");
	writeln;  // Violates D Style Guidelines as this is a Command, which should always have parentheses
}
