import std.stdio;

void main() {

}

struct Test {
	// ← compilation ERROR, because default parameter-less constructor is not allowed for structs
	this() 
	{ 
		writeln("A Test object is being constructed.");
	}
}
