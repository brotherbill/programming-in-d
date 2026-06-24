import std.stdio;
import std.string;

enum Level
{
	low,
	medium,
	high
}

auto interestedLevel = Level.medium;
auto failedToConnect = true;

void main()
{
	if (failedToConnect)
	{
		log(Level.medium,
			format("Failure. The connection state is '%s'.",
				getConnectionState()));
	}
}

void log(Level level, lazy string message)
{
	if (level >= interestedLevel)
	{
		writeln(message);
	}
}

string getConnectionState()
{
	return "Disconnected, please try again later.";
}
