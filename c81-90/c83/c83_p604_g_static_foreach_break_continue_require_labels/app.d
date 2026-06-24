import std.stdio;

void main(string[] args)
{
	writeln("args: ", args);
	
	theSwitchStatement:
		switch (args.length)
		{
			static foreach (i; 1 .. 3)
			{
				case i:
					writeln(i);
					break theSwitchStatement;
			}

			default:
				writeln("default case");
				break;  // This may also be:  break theSwitchStatement;
		}
}
