import std.stdio;

void main()
{
	auto sink = new SpecialSink();
	fillSink(cast(Sink) sink);
	fillSink(sink);
	import std.stdio;

	writeln(sink.content);
}

class Sink
{
	string content;
	void put(T)(auto ref const T value)
	{
		import std.conv;

		content ~= value.to!string ~ ' ';
	}
}

class SpecialSink : Sink
{
	// The following template definition does not override the template instances of the superclass; it hides those names
	void put(T)(auto ref const T value)
	{
		import std.string;

		super.put(format("{%s}", value));
	}
}

void fillSink(Sink sink)
{
	// The following function calls are not virtual. 
	// Because parameter 'sink' is of type 'Sink', the calls will always be dispatched to Sink's 'put' template instances
	sink.put(42);
	sink.put("hello");
}

void fillSink(SpecialSink specialSink)
{
	// The following function calls are not virtual. 
	// Because parameter 'sink' is of type 'Sink', the calls will always be dispatched to Sink's 'put' template instances
	specialSink.put(42);
	specialSink.put("hello");
}
