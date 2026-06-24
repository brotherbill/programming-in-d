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
			delegate string() { 						// (3)
			return format("Failure. The connection state is '%s'.", getConnectionState());
		}
		);
	}
}

void log(Level level, string delegate() lazyMessage)	// (1)
{ 
	if (level >= interestedLevel)
	{
		writefln("%s", lazyMessage()); 					// (2)
	}
}
// 1. The lazy parameter is not a string, but a delegate that returns a string.
// 2. The delegate is called to get its return value.  Parentheses are required.
// 3. The entire expression is wrapped inside a delegate and returned from it.

string getConnectionState()
{
	return "Disconnected, please try again later.";
}
