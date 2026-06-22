import std.stdio : writeln;

void main()
{
	// dedicated to Cookie Monster on Sesame Street
	bool existsCookie = true;

	// test at top
	while (existsCookie)
	{
		writeln("Take cookie");
		writeln("Eat  cookie");
		existsCookie = false;
	}

	// test at bottom.  Runs at least once.
	do 
	{
		writeln("Take cookie 2");
		writeln("Eat  cookie 2");	
	} while (existsCookie);

	existsCookie = true;

	// VSCode debugger on Windows and Linux has a bug where Control-C does not interrupt here.
	// So we limit the number of iterations to 3.
	int i = 0;
	while (existsCookie && i < 3)
	{
		writeln("Take cookie 3");
		writeln("Eat  cookie 3");	
		i = i + 1;
	}

	// infinite loop
	// Run this in terminal and use Control-C to interrupt.
	// In debugger, use Shift-F5 to close program.
	while (existsCookie)
	{
		writeln("Take cookie 4");
		writeln("Eat  cookie 4");	
	}
}
