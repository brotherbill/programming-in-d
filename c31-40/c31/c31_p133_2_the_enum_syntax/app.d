import std.stdio : writeln;

void main()
{
	bool bool_heads = HeadsOrTails.heads;
	bool bool_tails = HeadsOrTails.tails;
	int  int_heads  = HeadsOrTails.heads;
	int  int_tails  = HeadsOrTails.tails;

	// Can take address of bool variable that is copied from manifest constant
	writeln("&bool_heads is ", &bool_heads);
	// Can take address of int variable that is copied from manifest constant
	writeln("&int_heads  is ", &int_heads);
	
	// Can not take address of enum directly!  It is same as taking address of int 1, also not allowed.
	// writeln("&HeadsOrTails.heads is ", &HeadsOrTails.heads);  // Won't compile, cannot take address of manifest constant.
	// writeln("&1 is ", &1);

	writeln("heads: ", bool_heads, ", tails: ", bool_tails);
	writeln("heads: ", int_heads, ",  tails: ", int_tails);
	writeln;

	bool coinFlip = HeadsOrTails.heads;
	final switch (coinFlip)
	{
	case HeadsOrTails.heads:
		writeln("Heads I Win!");
		break;
	case HeadsOrTails.tails:
		writeln("Tails You Lose!");
		break;
	}
	writeln;

	int suit = Suit.diamonds;
	int fare = Fare.senior;

	writeln("suit: ", suit, ", name of suit: ", cast(Suit) suit);
	writeln("fare: ", fare, ", name of fare: ", cast(Fare) fare);
}

enum HeadsOrTails : bool
{
	heads,
	tails,
}

enum Suit
{
	spades = 1,
	hearts,
	diamonds,
	clubs
}

enum Fare
{
	regular,
	child,
	student,
	senior
}
