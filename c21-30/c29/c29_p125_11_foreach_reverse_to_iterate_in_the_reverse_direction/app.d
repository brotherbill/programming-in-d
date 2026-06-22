import std.stdio : writeln, writefln;

void main() {
	auto container = [1, 2, 3];
	foreach_reverse (element; container) {
		writefln("%s ", element);
	}
	writeln;

	container = [1, 2, 3];
	foreach_reverse (i, element; container) {
		writefln("%s: %s ", i, element);
	}
}
