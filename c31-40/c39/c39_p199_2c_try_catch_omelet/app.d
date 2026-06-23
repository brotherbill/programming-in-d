import std.stdio : write, writeln;
import std.format : format;

void main()
{
	entering("main", 0);

	try
	{
		makeOmelet(-8);
		eatOmelet();
	}
	catch (Exception exc)
	{
		write("Failed to eat omelet: ");
		writeln('"', exc.msg, '"');
		writeln("Will eat at neighbor's...");
	}

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

void makeOmelet(int eggCount)
{
	entering("makeOmelet", 1);
	prepareAll(eggCount);
	cookEggs();
	cleanAll();
	exiting("makeOmelet", 1);
}

void eatOmelet()
{
	entering("eatOmelet", 1);
	exiting("eatOmelet", 1);
}

void prepareAll(int eggCount)
{
	entering("prepareAll", 2);
	prepareEggs(eggCount);
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

void prepareEggs(int count)
{
	entering("prepareEggs", 3);

	if (count < 1)
	{
		throw new Exception(format("Cannot take %s eggs from the fridge", count));
	}

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
