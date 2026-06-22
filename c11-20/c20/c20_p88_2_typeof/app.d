import std.stdio;

void main()
{
	// Type inference.  value1 is an int
	auto           value1 = 100;

	// value2 has the same type as value1 (int)
	typeof(value1) value2 = 200; 

	// value3 has the same type as 100 (int)
	typeof(100)    value3;

	// shorter using auto  
	BeautifulBicycle myBicycle2 = BeautifulBicycle(21, 26.5, "red");
	auto             myBicycle  = BeautifulBicycle(21, 26.5, "red");

	// shorter using auto
	Antidisestablishmentarianism noStateChurch2 = Antidisestablishmentarianism(28, "Opposition to the disestablishment of the Church of England");
	const                        noStateChurch3 = Antidisestablishmentarianism(28, "Opposition to the disestablishment of the Church of England");
	immutable                    noStateChurch4 = Antidisestablishmentarianism(28, "Opposition to the disestablishment of the Church of England");

	// stringof returns the name of the type as a string, similar to nameof in C#
	writeln("value1        : ", value1,         ", type: ",            typeof(value1).stringof);
	writeln("value2        : ", value2,         ", type: ",            typeof(value2).stringof);
	writeln("value3        : ", value3,         ",   type: ",          typeof(value3).stringof);
	writeln("myBicycle     : ", myBicycle,      ", type: ",            typeof(myBicycle).stringof);
	writeln("noStateChurch2: ", noStateChurch2, ",            type: ", typeof(noStateChurch2).stringof);
	writeln("noStateChurch3: ", noStateChurch3, ",     type: ",        typeof(noStateChurch3).stringof);
	writeln("noStateChurch4: ", noStateChurch4, ", type: ",            typeof(noStateChurch4).stringof);
}

struct BeautifulBicycle 
{
	int    gears;
	float  wheelSize;
	string color;
}

struct Antidisestablishmentarianism 
{
	int    length;
	string definition;
}
