import std.stdio;

void main()
{

}

int add(int lhs, int rhs) nothrow
{
	writeln("adding"); // ← compilation ERROR, may throw exception
	return lhs + rhs;
}
