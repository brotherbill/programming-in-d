import std.stdio : writeln;

void main()
{
	int[string] colorCodes = ["blue": 10, "red": 20, "green": 30];

	if ("purple" in colorCodes)
	{
		// key "purple" exists in the table
		writeln("purple key exists in colorCodes");
	}
	else
	{
		// key "purple" does not exist in the table
		writeln("purple key doesn't exist in colorCodes");
	}

	writeln("Get purple color code, default: -1");
	int purpleColor = colorCodes.get("purple", -1);
	int blueColor = colorCodes.get("blue", 50);

	writeln("Purple color: ", purpleColor);
	writeln("Blue color: ",   blueColor);
}
