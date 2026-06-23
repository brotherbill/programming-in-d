void main()
{
	foreach (i; 0 .. 10)
	{
		tester;
	}	
}

void tester() 
{
	import std.stdio : writeln;

	TypeInfo_Class m1 = typeid(foo());	// parentheses are required here
	TypeInfo_Class m2 = typeid(foo());	// parentheses are required here

	string m1Name = m1.name;
	string m2Name = m2.name;

	immutable violin = "app.Violin";
	immutable guitar = "app.Guitar";

	if (m1Name == violin && m2Name == violin)
	{
		writeln("Both are Violin");
	}
	else if (m1Name == guitar && m2Name == guitar)
	{
		writeln("Both are Guitar");
	}
	else if (m1Name == violin && m2Name == guitar)
	{
		writeln("First is Violin, second is Guitar");
	}
	else if (m1Name == guitar && m2Name == violin)
	{
		writeln("First is Guitar, second is Violin");
	}
}

MusicalInstrument foo()
{
	import std.random : uniform;
	int i = uniform(0, 2);

	return (i % 2) ? new Violin() : new Guitar();
}

class MusicalInstrument
{
}

class StringInstrument : MusicalInstrument
{
}

class Violin : StringInstrument
{
}

class Guitar : StringInstrument
{
}
