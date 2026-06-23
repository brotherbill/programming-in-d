import std.stdio : writeln;

void main()
{
	applyCommand("dance");
	applyCommand("sing");
	applyCommand("write D code");
}

void applyCommand(string command)
{
	if (command == "sing")
	{
		robotSing();
	}
	else if (command == "dance")
	{
		robotDance();
	}
	else
	{
		assert(false, "Robot only knows how to sing and dance.  Robot doesn't know how to " ~ command ~ '.');
	}
}

void robotSing()
{
	writeln("Robot sings : beep beep beep");
}

void robotDance()
{
	writeln("Robot dances: squeak, squeak, squeak");
}
