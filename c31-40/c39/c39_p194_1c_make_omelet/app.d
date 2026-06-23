import std.stdio;

void main()
{
	entering("main", 0);
	makeOmelet();
	eatOmelet();
	exiting("main", 0);
}

void indent(int level)
{
	foreach (i; 0 .. level * 2)
	{
		write(' ');
	}
}

void entering(string functionName, int level)
{
	indent(level);
	writeln("▶ ", functionName, "'s first line");
}

void exiting(string functionName, int level)
{
	indent(level);
	writeln("◁ ", functionName, "'s last line");
}

void makeOmelet()
{
	entering("makeOmelet", 1);
	prepareAll();
	cookEggs();
	cleanAll();
	exiting("makeOmelet", 1);
}

void eatOmelet()
{
	entering("eatOmelet", 1);
	exiting("eatOmelet", 1);
}

void prepareAll()
{
	entering("prepareAll", 2);
	prepareEggs();
	prepareButter();
	preparePan();
	exiting("prepareAll", 2);
}

void cookEggs()
{
	entering("cookEggs", 2);
	exiting("cookEggs", 2);
}

void cleanAll()
{
	entering("cleanAll", 2);
	exiting("cleanAll", 2);
}

void prepareEggs()
{
	entering("prepareEggs", 3);
	exiting("prepareEggs", 3);
}

void prepareButter()
{
	entering("prepareButter", 3);
	exiting("prepareButter", 3);
}

void preparePan()
{
	entering("preparePan", 3);
	exiting("preparePan", 3);
}
