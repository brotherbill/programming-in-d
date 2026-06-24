import std.stdio;

void main()
{
    auto line = Line();
    line.setEdge(0, 100);
    line.setEdge(1, 200);
    line.printEdges();
}

struct Line
{
    // mixin EdgeArrayFeature!(int, 2);
    alias T = int;
    immutable size_t count = 2;

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

/+
mixin template EdgeArrayFeature(T, size_t count) {
    T[count] edges;

    void setEdge(size_t index, T edge) {
        edges[index] = edge;
    }

    void printEdges() {
        writeln("The edges:");

        foreach (i, edge; edges) {
            writef("%s:%s ", i, edge);
        }

        writeln();
    }
}
+/
