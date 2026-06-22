import std.stdio : stdout, write, writeln, writefln;

void main()
{
	auto spelled = [1: "one", 10: "ten", 100: "hundred"];

	writefln("No hyphen shows double quotes around the value strings:");
	write("[%(%s (%s)%|, %)] pattern: "); stdout.flush;
	writefln("[%(%s (%s)%|, %)]", spelled);
	writeln;

	writefln("Adding hyphen suppressed double quotes around the value strings:");
	write("[%-(%s (%s)%|, %)] pattern: "); stdout.flush;
	writefln("[%-(%s (%s)%|, %)]", spelled);
	write(   "  ^");
	writeln;
}
