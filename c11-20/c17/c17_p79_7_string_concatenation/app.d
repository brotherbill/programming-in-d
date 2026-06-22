import std.stdio  : readln, write, writeln;
import std.string : strip;

void main()
{
	write("What is your name? ");
	string name = readln().strip(); // Remove trailing newline

	// Concatenate:
	string greeting = "Greetings " ~ name;
	// greeting[0] = 'X';  // This won't compile because `greeting` is immutable.
	writeln(greeting.ptr, " greeting: ", greeting);

	// Append may maintain the same reference:
	greeting ~= "! Welcome...";
	writeln(greeting.ptr, " greeting: ", greeting); // immutable strings may be extended!

	// Assignment moves the reference:
	greeting = greeting ~ " to the D programming language.";
	writeln(greeting.ptr, " greeting: ", greeting); // immutable strings may be extended!
}
