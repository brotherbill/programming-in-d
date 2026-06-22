import std.stdio : writeln;

void main()
{
	printMenu("Exit");
	writeln;

	printMenu("Return");
	writeln;

	char[] anEntry;
	anEntry ~= "Take square root";
	// printMenu(anEntry);				// ← compilation ERROR.  anEntry is char[], not const(char)[]

	// This is the correct D way to get this to work
	auto anEntry_idup = anEntry.idup;	// idup returns a copy of vanilla string "Take square root".  This is equivalent to idup(anEntry)
	 									// IMHO, this looks nicer and tighter.  This is how typical D programmers write this code.
										// It also has the 'feel' of functional programming.

	// anEntry_idup = idup(anEntry);	// This shows function call syntax.
	anEntry_idup.printMenu;				// This compiles and runs, with function call syntax using UFCS.  Same as printMenu(anEntry_idup);
}

void printMenu(string firstEntry)
{
	writeln(" 0 ", firstEntry);
	writeln(" 1 Add");
	writeln(" 2 Subtract");
	writeln(" 3 Multiply");
	writeln(" 4 Divide");
}
