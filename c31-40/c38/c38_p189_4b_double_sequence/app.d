import std.stdio : write, writeln;
import std.conv  : to;

void main(string[] args) {
	// The default count is 10
	size_t count = 10;

	if (args.length > 1) {
		// There is an argument
		count = to!size_t(args[1]);
	}

	foreach (i; 0 .. count) {
		write(i * 2, ' ');
	}
	
	writeln();
}
