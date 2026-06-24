debug import std.stdio;

void main() {
	myFunction("deneme.txt", [10, 4, 100]);
}

void myFunction(string fileName, int[] values) {
	// Obsolete debug levels are not used
	debug(1) writeln("entered myFunction");

	// Obsolete debug levels are not used
	debug(2) {
		writeln("the arguments:");
		writeln("  file name: ", fileName);
		
		foreach (i, value; values) {
			writefln("  %4s: %s", i, value);
		}
	}

	// ... the implementation of the function ...
}
