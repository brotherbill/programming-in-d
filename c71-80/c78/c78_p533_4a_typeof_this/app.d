import std.stdio;

void main()
{
	auto myList = List!string();
	writeln(typeof(myList).stringof);
}

struct List(T)
{
	// The type of 'next' is List!int when T is int
	typeof(this)* next;
	// ...
}
