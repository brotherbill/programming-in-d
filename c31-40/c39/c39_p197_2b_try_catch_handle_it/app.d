import std.stdio : writeln, File;
import std.exception : ErrnoException;

void main()
{
	immutable int die = tryReadingFromFile();
	writeln("Die value: ", die);
}

int tryReadingFromFile()
{
	int die;

	try
	{
		writeln("Attempting to read die value from file...");
		die = readDieFromFile();
		writeln("Imagine that, I just read a value from a file that doesn't exist!");
		die *= 10;
		die /= 2;
		die /= 5;
	}
	catch (ErrnoException exc)
	{
		writeln("(Could not read from file; assuming 1)");
		die = 1;


		// Unable to recover, rethrow the exception
		// throw new ErrnoException("Failed to read die value from file");
	}

	return die;
}

int readDieFromFile()
{
	auto file = File("the_file_that_contains_the_value", "r");
	int die;
	file.readf(" %s", &die);
	return die;
}
