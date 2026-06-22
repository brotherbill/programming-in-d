import std.stdio : writeln, File;
import std.string : strip;

void main()
{
	File file = File("student_records.txt", "r");
	if (file.error)
	{
		writeln("Error opening file: ", file.name);
		return;
	}

	writeln("File opened successfully: ", file.name);
	while (!file.eof)
	{
		string line = strip(file.readln);
		writeln("read line -> |", line, '|');
	}

	file.close();
}
