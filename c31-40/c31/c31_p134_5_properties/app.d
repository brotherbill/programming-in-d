import std.stdio : writeln, writefln;
import std.traits : EnumMembers;

void main()
{
	writeln("--- for ---");
	for (auto suit = Suit.min; suit <= Suit.max; ++suit)
	{
		writefln("%s: %d", suit, suit);
	}
	writeln;

	writeln("--- foreach (suit; Suit.min .. Suit.max) ---");
	foreach (suit; Suit.min .. Suit.max)
	{
		writefln("%s: %d", suit, suit);
	}
	writeln;

	writeln("--- foreach (suit; EnumMembers!Suit) ---");
	// Debugger has issue here, so we will use F5 to run to completion
	foreach (suit; EnumMembers!Suit)
	{
		writefln("%s: %d", suit, suit);
	}
}

enum Suit
{
	spades,
	hearts,
	diamonds,
	clubs
}
