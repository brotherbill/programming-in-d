import std.stdio : writeln;
import std.conv : to;

enum Suit
{
	club,
	diamonds,
	spades,
	hearts
}

void main()
{
	Suit suit = to!Suit(7); // ← throws exception as implicit conversion is only permitted if parameter is a named enum.
	bool b    = to!bool(2); 	// ← throws exception as implicit conversion to bool is only permitted for 0 and 1.
	suitsTester;
	boolTester;
	funWithPointers;
}

void suitsTester()
{
	Suit spades = cast(Suit) 2;
	Suit other  = cast(Suit) 7;

	writeln("spades: ", spades);
	writeln("other : ", other);
}

void boolTester()
{
	bool b = cast(bool) 2;
	assert(b is true);
}

void funWithPointers()
{
	// You have full power, just like in C language to coerse one pointer type to another.
	// Needless to say, you better know what you are doing.
	// Side effects include crashing, messing with Garbage Collector, hiding pointers and other shenanigans.
	// D language gives you a loaded gun if you like to play on the dark side.
	// On the other hand, the full power of the processor is yours to mold as you see fit.
	void*  v;
	// ...
	int*   p                 = cast(int*) v;

	size_t savedPointerValue = cast(size_t) p;
	// ...
	int*   p2                = cast(int*) savedPointerValue;
}
