import std.stdio : File, stdout;
import std.string : format;
import std.datetime : Clock;

void main()
{
	auto logger = Logger(stdout);

	logger.log("Working inside main");
	logger.log("Calling foo");
	foo(logger);
	logger.log("Back to main");
}

struct Logger
{
	File file;

	this(File file)
	{
		this.file = file;
		log("Started");
	}

	~this()
	{
		log(format("%s Finishing", __LINE__)); // ← Intended to be the last message
	}

	void log(string message)
	{
		file.writefln("%s %s", Clock.currTime(), message);
	}
}

// logger uses copy constructor, as it is copied or passed by value.
// At line 40, it will call the destructor of the copy, which will log "Finishing" before the intended last message "Finishing" at line 28. This is because the copy goes out of scope at the end of foo, triggering its destructor.
void foo(Logger logger)
{
	logger.log(format("%s Working inside foo", __LINE__));
}
