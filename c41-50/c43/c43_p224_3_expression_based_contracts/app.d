import std.stdio  : writeln;
import std.format : format;

void main()
{
	int verbose = funcVerbose(20, 5);
	writeln("verbose(20, 5): ", verbose);

	int terse = funcTerse(20, 5);
	writeln("terse  (20, 5): ", terse);

	// int verboseViolator = funcVerbose(6, 6);
	// writeln("verboseViolator (6, 6): ", verboseViolator);

	// int terseViolator = funcTerse(6, 6);
	// writeln("terseViolator (6, 6): ", terseViolator);
}

int funcVerbose(int a, int b)															// No open brace
in
{
	assert(a >= 7, format("a of %s cannot be less than 7", a));
	assert(b < 10);
}
out (result)
{
	assert(result > 1000);
}
do
{
	if (b <= 0)	return 1000 + a;
	else		return 1000 + a + b;
}

int funcTerse(int a, int b)																// No open brace
in (a >= 7, format("a of %s cannot be less than 7", a)) 								// No semicolon.  Has custom message.
in (b < 10) 																			// No semicolon.  message is omitted.
out (result; result > 1000, format("result of %d must be greater than 1,000", result))	// No semicolon.  Has custom message.  If void, still needs initial semicolor.
{
	if (b <= 0)	return 1000 + a;
	else		return 1000 + a + b;
}
