import std.stdio : writeln, writefln;

void main()
{
	// Initialize variables, using type inference of initialized values
	auto      duration = 42;
	auto      distance = 1.2;
	auto      greeting = "Hello";
	const     vehicle1 = BeautifulBicycle("blue");
	immutable vehicle2 = BeautifulBicycle("blue");

	writefln("Duration: %d seconds       type: %s", duration, typeof(duration).stringof);
	writefln("Distance: %.2f kilometers  type: %s", distance, typeof(distance).stringof);
	writefln("Greeting: %s            type: %s", greeting, typeof(greeting).stringof);
	writefln("Vehicle1:                  type: %s", typeof(vehicle1).stringof);
	writefln("Vehicle2:                  type: %s", typeof(vehicle2).stringof);
	writeln;

	// This takes up memory space, as compared to an enum, which does not
	immutable i = 42;
	writeln("Immutable integer: ", i, ",     type: ", typeof(i).stringof);

	// This won't compile because the variable is immutable and can't be changed
	// i = 86;
	
	// shorter than  BeautifulBicycle myBicycle = BeautifulBicycle("red");
	auto myBicycle = BeautifulBicycle("red");

	// shorter than  Antidisestablishmentarianism noStateChurch = Antidisestablishmentarianism(28, "Opposition to the disestablishment of the Church of England");
	auto noStateChurch = Antidisestablishmentarianism(28, "Opposition to the disestablishment of the Church of England");

	// This won't work.  This is not C# or Haskell
	// auto value4;
	// value4 = 3.14;

	// If we change pi to be a double or real, tau will also become a double or real respectively
	float pi = 3.14159265359;
	typeof(pi) tau = 2 * pi;	// tau has type float  (Sneak peak of next lesson: typeof)
	writeln("Tau: ", tau, ",              type: ", typeof(tau).stringof);
}

struct BeautifulBicycle
{
	string color;

	this(string color)
	{
		this.color = color;
	}
}

struct Antidisestablishmentarianism 
{
	int length;
	string definition;
}
