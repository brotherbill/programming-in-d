import std.stdio : writeln;

void main()
{
	// Suit suit = 1;		 // ← compilation ERROR.  Cannot implicitly convert int to enum.

	auto suit = cast(Suit) 2; // now diamonds
	writeln(__LINE__, " suit: ", suit, ", type: ", typeid(suit).toString);
	writeln;

	writeln(__LINE__, " Converting an invalid value doesn't throw exception.  It just has best-can-do name.");
	auto suit2 = cast(Suit) 1000; // invalid value.  Not defined in enum.  No exception thrown.
	writeln(__LINE__, " suit2: ", suit2, ", type: ", typeid(suit2).toString);

}

enum Suit
{
	spades,
	hearts,
	diamonds,
	clubs
}
