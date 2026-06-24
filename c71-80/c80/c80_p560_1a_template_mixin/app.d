import std.stdio;

void main()
{
	auto line = Line();
	line.setEdge(0, 100);
	line.setEdge(1, 200);
	line.printEdges();
}

// mixin template.  Not expanded here.
mixin template EdgeArrayFeature(T, size_t count)
{
	T[count] edges;

	void setEdge(size_t index, T edge)
	{
		edges[index] = edge;
	}

	void printEdges()
	{
		writeln("The edges:");

		foreach (i, edge; edges)
		{
			writef("%s:%s ", i, edge);
		}

		writeln();
	}
}

struct Line
{
	// Expand template here
	mixin EdgeArrayFeature!(int, 2);
}
