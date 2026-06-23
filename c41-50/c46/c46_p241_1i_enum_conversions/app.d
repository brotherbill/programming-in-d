import std.stdio : writeln;

enum Suit
{
	spades,
	hearts,
	diamonds,
	clubs
}

void main()
{
	// enums automatically convert to integers
	int result = 10 + Suit.hearts;
	assert(result == 11);

	// integers do not automatically convert to enums
	Suit suit = 2;		 				// ← compilation ERROR.  Implicit conversion not allowed
	Suit suitCast = cast(Suit)2; 		// ← works fine.         Explicit conversion allowed
	writeln(__LINE__, " suitCast: ", suitCast); 	// Output: suitCast: diamonds

	Suit outOfRangeSuit = cast(Suit)10; 	// ← compiles fine, but be careful!
	writeln(__LINE__, " outOfRangeSuit: ", outOfRangeSuit); // Output: outOfRangeSuit: cast(Suit)10
}
