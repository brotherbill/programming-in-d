import std.stdio : writeln, writefln;

void main()
{
	char[] greeting;
	writefln("greeting: [%s] length: %s", greeting, greeting.length);

	greeting ~= "Greetings world!";

	greeting.parenthesized.writeln;		// Fluent syntax
	writefln("greeting: [%s] length: %s", greeting, greeting.length);
}

char[] parenthesized(const char[] text)
{
	return "{" ~ text ~ "}";
}
