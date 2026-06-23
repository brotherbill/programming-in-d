import std.stdio : writeln;

void main()
{
	boolActsAsSingleBit;
	onlyZeroAndOneAutoConvertToBool;
	otherLiteralValuesCantAutoConvertToBool;
	logicalExpressionsAreLooseyGoosey;
}

void boolActsAsSingleBit()
{
	int a = false;
	assert(a == 0);

	int b = true;
	assert(b == 1);
}

void onlyZeroAndOneAutoConvertToBool()
{
	bool a = 0;
	assert(!a); // false

	bool b = 1;
	assert(b); // true
}

void otherLiteralValuesCantAutoConvertToBool()
{
	bool b = 2;				//  ← compilation ERROR
	bool c = cast(bool)2; 	// ← works fine with explicit cast
	assert(c == true);
}

void logicalExpressionsAreLooseyGoosey()
{
	int i = 2;

	if (i)
	{
		writeln("2 is truthy because it's non-zero");
	}
	else
	{
		writeln("2 is not truthy because it's zero");
	}

	int[] a;

	if (a)
	{
		writeln("a is truthy because it's not null");
	}
	else
	{
		writeln("a is falsey because it's empty");
	}
}
