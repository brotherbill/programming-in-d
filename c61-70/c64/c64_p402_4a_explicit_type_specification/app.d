import std.stdio;

void main()
{
	// What type should response be?
	auto response = getResponse("What is your age?");
}

T getResponse(T)(string question)
{
	writef("%s (%s): ", question, T.stringof);

	T response;
	readf(" %s", &response);
	return response;
}
