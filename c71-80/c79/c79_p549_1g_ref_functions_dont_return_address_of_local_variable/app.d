import std.stdio;

void main()
{
	string* ptrSum = &parenthesized("2 + 3");

	writefln("sum: %s", *ptrSum);
}

ref string parenthesized(string phrase)
{
	string result = '(' ~ phrase ~ ')';
	return result; 						// ← compilation ERROR
}
