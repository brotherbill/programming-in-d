import std.stdio : stdout, write, writeln, writefln;

void main()
{
	auto vegetables = ["spinach", "asparagus", "artichoke"];

	writefln("Vegetables wrapped in double quotes by default:");
	write("[%(%s, %)] pattern: "); stdout.flush;
	writefln("[%(%s, %)]", vegetables);
	writeln;

	writefln("Vegetables can be naked without default double quotes:");
	write("[%-(%s, %)] pattern: "); stdout.flush;
	writefln("[%-(%s, %)]", vegetables);
	writeln( "  ^");
	writeln;
}
