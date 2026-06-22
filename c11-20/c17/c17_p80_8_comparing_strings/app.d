import std.stdio  : writeln;
import std.string : toLower;

void main()
{
	string s1 = "Brother Bill";
	string s2 = "Brother bill";

	if (s1 == s2)
	{
		writeln("They are the same!");
	}
	else
	{
		string former;
		string latter;

		if (s1 < s2)
		{
			former = s1;
			latter = s2;
		}
		else
		{
			former = s2;
			latter = s1;
		}
		writeln("'", former, "' comes before '", latter, "'.");
	}
	writeln();

	test_e_accent();
}

void test_e_accent() 
{
	dchar e = 0x65;
	dchar eAcute = '\u00E9';
	dchar f = 0x66;

	writeln("e: ", e);
	writeln("eAcute: ", eAcute);
	writeln("f: ", f);

	if ('e' < eAcute && eAcute < 'f') 
	{
		writeln("The order is correct lexicographically.");
	}
	else 
    {
		writeln("The order is based on Unicode code points.");
	}
}
