import std.stdio : writeln, write, readln, stderr, File;
import std.exception : ErrnoException;
import std.string : strip;

void useTheFile(string fileName)
{
	auto file = File(fileName, "r");
	writeln(" 8 --- useTheFile function has opened the file successfully ---");
	// ...
}

string read_string(string prompt)
{
	write(prompt, ": ");
	return readln.strip;
}

void main()
{
	bool is_fileUsed = false;

	while (!is_fileUsed)
	{
		try
		{
			useTheFile(read_string("Please enter a file name"));
			// If we are at this line, it means that useTheFile() function has been completed successfully. 
			// This indicates that the file name was valid.
 			//
 			// We can now set the value of the loop flag to terminate the while loop.
			is_fileUsed = true;
			writeln("32 The file has been used successfully");
		}
		catch (ErrnoException exc)
		{
			stderr.writeln("34 This file could not be opened\n");
		}
	}
}
