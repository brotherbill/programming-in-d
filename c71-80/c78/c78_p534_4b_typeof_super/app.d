import std.stdio;

void main()
{
	auto listString = new List!string();
	writeln(typeof(listString).stringof);
	writeln(typeof(listString.next).stringof);
}

class ListImpl(T)
{
	// ...
}

class List(T) : ListImpl!T
{
	// The type of 'next' is ListImpl!int when T is int
	typeof(super)* next;
	// ...
}
