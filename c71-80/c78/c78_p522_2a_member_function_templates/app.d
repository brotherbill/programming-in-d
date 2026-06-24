import std.stdio;

void main()
{
	Sink sink = new Sink("a string");
	sink.put(42);

	writeln("sink.content: ", sink.content);
}

class Sink
{
	string content;

	void put(T)(auto ref const T value)
	{
		import std.conv;

		content ~= value.to!string;
	}

	this(string content)
	{
		this.content = content;
	}
}
