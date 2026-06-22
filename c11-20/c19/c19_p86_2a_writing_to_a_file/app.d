import std.stdio : File, writeln;

void main()
{
	// w means write mode (creates a new file or first clears an existing file)
	File file = File("student_records.txt", "w");

	file.writeln("Name  : ", "Zafer");
	file.writeln("Number: ", 123);
	file.writeln("Class : ", "1A");

	file.close();

	writeln("File written successfully!");
}
