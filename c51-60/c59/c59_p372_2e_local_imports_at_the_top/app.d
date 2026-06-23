import std.stdio; 	// ← at the top
import std.string; 	// ← at the top

void main()
{
	interactWithUser;
}

string makeGreeting(string name)
{
	string greeting = format("Greetings %s", name);
	return greeting;
}

void interactWithUser()
{
	write("Please enter your name: ");
	string name = readln();
	writeln(makeGreeting(name));
}
