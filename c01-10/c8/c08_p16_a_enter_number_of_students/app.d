import std.stdio;

void main()
{
	write("How many students are there? ");

	// The definition of the variable that will be used to
    // store the information that is read from the input. 
	int studentCount;

	// Storing the input data to that variable
	readf("%s", &studentCount);

	writeln("Got it: There are ", studentCount, " students.");
}
