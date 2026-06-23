import std.stdio;

void main()
{
	const int die = readDieFromFile();

	writeln("Die value: ", die);
}

int readDieFromFile()
{
	auto file = File("the_file_that_contains_the_value", "r");

	int die;
	file.readf(" %s", &die);

	return die;
}
