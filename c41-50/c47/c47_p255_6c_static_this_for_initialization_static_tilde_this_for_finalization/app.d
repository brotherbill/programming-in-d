import std.stdio : File, writeln;
import std.file : exists;

void main()
{
    auto top    = makePoint(7, 0);
    auto middle = makePoint(8, 0);
    auto bottom = makePoint(9, 0);

    writeln(__LINE__, ": ", top.id);
    writeln(__LINE__, ": ", middle.id);
    writeln(__LINE__, ": ", bottom.id);
}

Point makePoint(int line, int column)
{
    size_t id = ++Point.lastId;

    return Point(id, line, column);
}

struct Point
{
    // The identifier of each object
    size_t id;
    int    line;
    int    column;

    // The shared id of the last object to construct
    static size_t lastId; // = 1000;	// initialization here overrides static this()

    enum lastIdFile = "Point_last_id_file.txt";

    // This runs at the start of each thread
    static this()
    {
        if (exists(lastIdFile))
        {
            auto file = File(lastIdFile, "r");
            scope(exit) file.close;
            file.readf(" %s", &lastId);
        }
    }

    // This runs at the end of each thread
    static ~this()
    {
        auto file = File(lastIdFile, "w");
        scope(exit) file.close;        
        file.writeln(lastId);
    }
}
