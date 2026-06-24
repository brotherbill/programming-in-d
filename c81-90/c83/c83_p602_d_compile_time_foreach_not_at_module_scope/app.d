import std.stdio;
import std.meta;

// Attempting to define function overloads at module scope:
foreach (T; AliasSeq!(int, double)) 	// ← compilation ERROR
{ 
	T twoTimes(T arg)
	{
		return arg * 2;
	}
}

void main()
{

}
