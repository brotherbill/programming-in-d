import std.stdio : writeln, stderr;

int main(string[] args)
{
	if (args.length != 3)
	{
		stderr.writefln("ERROR! Correct usage:\n" ~ "  %s word1 word2", args[0]);
		return 1;
	}

	writeln(args[2], ' ', args[1]);

	return 0;
}
