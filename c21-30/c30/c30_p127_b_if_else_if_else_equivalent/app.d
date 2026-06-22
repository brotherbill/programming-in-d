import std.stdio : writeln;

void main()
{
	int day = 3;

	if (day == 1) 
	{
		writeln("Moon day");
	} 
	else if (day == 2) 
	{
		writeln("Taco two's day");
	}
	else if (day == 3) 
	{
		writeln("Hump day");
	} 
	else if (day == 4) 
	{
		writeln("Thor's day");
	} 
	else if (day == 5) 
	{
		writeln("Fry day");
	} 
	else if (day == 6 || day == 7) 
	{
		writeln("Weekend!");
	} 
	else 
	{
		writeln("Beatles: 8 days a week");
	}
}
