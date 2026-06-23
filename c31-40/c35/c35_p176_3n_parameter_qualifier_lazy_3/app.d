import std.stdio : writeln;
import std.format : format;

const int interestedLevel = Level.high;

void main()
{
    bool failedToConnect = true;

    if (failedToConnect)
    {
        log(Level.medium, format("Failure. The connection state is '%s'.", getConnectionState()));
    }
}

enum Level
{
    low,
    medium,
    high
}

void log(Level level, lazy string message)
{
	writeln("Logging message BEGIN ...");
	if (level >= interestedLevel)
	{
		writeln(message);
	}
	writeln("Logging message END ...");
}

string getConnectionState()
{
    writeln("getConnectionState() called");
    return "connected";
}
