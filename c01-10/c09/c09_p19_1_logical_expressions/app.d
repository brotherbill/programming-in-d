import std.stdio;

void main()
{
	// false means "no", true means "yes"

	int daysInWeek   =  7;
	int monthsInYear = 12;

	writeln("daysInWeek   == 7  is ", daysInWeek == 7);
	writeln("monthsInYear == 11 is ", monthsInYear == 11);

	writeln("daysInWeek   != 7  is ", daysInWeek != 7);
	writeln("monthsInYear != 11 is ", monthsInYear != 11);

	bool existsCoffee = false;
 	bool existsTea    = true;
	writeln("There is warm drink: ",  existsCoffee || existsTea);

	writeln();

	bool jimShowedUp   = true;
	bool bobShowedUp   = false;
	int  theirScore    = 3;
	int  ourScore      = 9;
	bool existsBicycle = false;

	writeln("I will play chess:  ", jimShowedUp && bobShowedUp);
	writeln("We beat:            ", theirScore < ourScore);
	writeln("They beat:          ", theirScore > ourScore);
	writeln("We were not beaten: ", theirScore <= ourScore);
	writeln("We did not beat:    ", theirScore >= ourScore);

	writeln("I will walk:        ", !existsBicycle);
}
