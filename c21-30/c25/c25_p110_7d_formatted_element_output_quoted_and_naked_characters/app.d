import std.stdio : stdout, write, writeln, writefln;

void main()
{
	auto greetings = "Greetings!";

	writefln("Each letter is a character, by default is wrapped in single quotes:");
	write("[%(%s, %)] pattern: "); stdout.flush;
	writefln("[%(%s, %)]", greetings);
	writeln;

	writefln("Each letter is a character, leading minus suppresses single quotes:");
	write("[%-(%s, %)] pattern: "); stdout.flush;
	writefln("[%-(%s, %)]", greetings);
	writeln( "  ^");
	writeln;
}
