import std.stdio : stdout, write, writeln, writefln;

void main()
{
	auto numbers = [1, 2, 3];

	writeln("No Pipes. Last item has no tail.");
	write("[%(^HEAD^%s, vTAILv%)] pattern:   "); stdout.flush;
	writefln("[%(^HEAD^%s, vTAILv%)]",   numbers);
	writeln;

	writeln("Pipe in fromt of tail format.  Same as no pipe.  Last item has no tail.");
	write("[%(^HEAD^%s%|, vTAILv%)] pattern: "); stdout.flush;
	writefln("[%(^HEAD^%s%|, vTAILv%)]", numbers);
	writeln( "           ^^");
	writeln;
	
	writeln("Pipe in middle of tail format.  Last item has tail cut off at pipe.");
	write("[%(^HEAD^%s, vTA%|ILv%)] pattern: "); stdout.flush;
	writefln("[%(^HEAD^%s, vTA%|ILv%)]", numbers);
	writeln( "                ^^");
	writeln;

	writeln("Pipe in back   of tail format.  Last item has full tail.");
	write("[%(^HEAD^%s, vTAILv%|%)] pattern: "); stdout.flush;
	writefln("[%(^HEAD^%s, vTAILv%|%)]", numbers);
	writeln( "                   ^^");
	writeln;
}
