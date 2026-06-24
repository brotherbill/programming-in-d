import std.stdio;

void main()
{
    // mixin EdgeArrayFeature!(Point, 5);
    alias T = Point;
    immutable size_t count = 5;

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

    // -----------------------------------

    setEdge(3, Point(3, 3));
    printEdges();
}

struct Point
{
    int x;
    int y;
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
