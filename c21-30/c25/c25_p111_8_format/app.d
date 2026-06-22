import std.stdio : readln, write, writeln;
import std.string : format, strip;

void main()
{
	write("What is your name? ");

	auto name = strip(readln);
	auto result  = format("Greetings %s!", name);  // Run time (ok). Faster compile time.
	auto result2 = format!"Greetings 2 %s!"(name); // Compile time expansion (ok).  Slows compile time.  Improves runtime performance.

	writeln(result);
	writeln(result2);
	writeln;

	checkedFormatString;
}

void checkedFormatString()
{
	writeln("Checked format string slows compile time");

	// writefln!"%s %s"(1);			// ← compilation ERROR (extra %s)
	// writefln!"%s"(1, 2);			// ← compilation ERROR (extra 2)
	// writefln!"%s %d"(1, 2.5);	// ← compilation ERROR (mismatched %d and 2.5)
}
