import std.stdio;
import std.string;

void main()
{
	// Reads the entire input, not only the name!
	auto name = getResponse!string("What is your name?");
	writeln("name: ", name);
}

// The general definition of the function template (same as before)
T getResponse(T)(string question)
{
	writef("%s (%s): ", question, T.stringof);

	T response;
	readf(" %s", &response);

	return response;
}
