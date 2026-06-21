import std.stdio;

void main()
{
	bool   existsCoffee = true;
	int    one          = 1;
	int    zero         = 0;
	double dOne         = 1.0;
	double dZero        = 0.0;
	double nan          = double.nan;
	double inf          = double.infinity;
	char   space        = ' ';
	char   x            = 'x';
	char   nulChar      = '\0';
	char   charInit     = char.init;
	string nullStr;
	string emptyStr     = "";
	string nonEmptyStr  = "greetings";

	if (existsCoffee)
	{
		writeln("Drink coffee");
		writeln("Wash the cup");
	}

	if (one)
	{
		writeln("one         is true");
	}

	if (zero)
	{
		writeln("zero        is true");
	}
	else
	{
		writeln("zero        is false");
	}

	if (dOne)
	{
		writeln("dOne        is true");
	}

	if (dZero)
	{
		writeln("dZero       is true");
	}
	else
	{
		writeln("dZero       is false");
	}

	if (nan)
	{
		writeln("nan         is true");
	}
	else
	{
		writeln("nan         is false");
	}

	if (inf)
	{
		writeln("inf         is true");
	}

	if (space)
	{
		writeln("space       is true");
	}
	 
	if (x)
	{
		writeln("x           is true");
	}

	if (nulChar)
	{
		writeln("nulChar     is true");
	}
	else
	{
		writeln("nulChar     is false");
	}

	if (charInit)
	{
		writeln("charInit    is true");
		writeln("charInit    to int: ", cast(int)charInit);
	}
	else
	{
		writeln("charInit    is false");
	}

	if (nullStr)
	{
		writeln("nullStr     is true");
	}
	else
	{
		writeln("nullStr     is false");
	}
	
	if (emptyStr)
	{
		writeln("emptyStr    is true");
	}
	else
	{
		writeln("emptyStr    is false");
	}

	if (nonEmptyStr)
	{
		writeln("nonEmptyStr is true");
	}
}
