import std.stdio : writeln;

void main() {
	// "abcçd" is a UTF-8 string
	foreach (i, code; "abcçd") {
		writeln(i, ": ", code);
	}
}
