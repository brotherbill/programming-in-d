import std.stdio : File, stdout;
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
	// @disable this(this); 								// disable Postblit
	// @disable this(ref const(typeof(this))); 				// disable copy constructor
	// @disable Logger opAssign(ref const(typeof(this))); 	// disable assignment constructor

	File file;

	this(File file)
	{
		this.file = file;
		log("Started");
	}

	~this()
	{
		log("Finishing"); // ← Intended to be the last message
	}

	void log(const string message)
	{
		file.writefln("%s %s", Clock.currTime(), message);
	}
}

// can't use copy constructor.  ref doesn't copy.
void foo(ref Logger logger)		
{ 
	logger.log("Working inside foo");
}
