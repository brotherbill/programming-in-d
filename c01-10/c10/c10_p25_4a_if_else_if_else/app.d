import std.stdio : writeln;

void main()
{
	bool existsCoffee  = false;
	bool existsBicycle = false;

	// note heavy use of braces
	if (existsCoffee)
	{
		writeln("Drink coffee at home");
	}
	else
	{
		if (existsBicycle)
		{
			writeln("Ride to the good place");
		}
		else
		{
			writeln("Walk to the bad place");
		}
	}
}
