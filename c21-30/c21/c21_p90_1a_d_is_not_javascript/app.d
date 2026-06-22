import std.stdio : writeln;

void main()
{
	// number is not known yet
	writeln(number); // ← compilation ERROR

	// var number = 42;  // This works in JavaScript. (Hoisting a variable declaration works in JavaScript, not in D.)
	int number = 42;

	writeln("App completed");
}
