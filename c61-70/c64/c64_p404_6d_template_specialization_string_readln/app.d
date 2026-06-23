import std.stdio;
import std.string;

void main()
{
	// Reads the entire input, not only the name!
	auto name = getResponse!string("What is your name?");
	writeln("name: ", name);
}

T getResponse(T)(string question)
{
	writef("%s (%s): ", question, T.stringof);

	T response;
	readf(" %s", &response);
	return response;
}

T getResponse(T : string)(string question)
{
	writef("%s (string): ", question);
	// Read and ignore whitespace characters which have presumably been left over from the previous user input
	string response;

	do
	{
		response = strip(readln());
	}
	while (response.length == 0);

	return response;
}
