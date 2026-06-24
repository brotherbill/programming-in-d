import std.stdio;

void main()
{
	info(1, "abc", 2.3);
}

void info(T...)(T args)
{
	// 'args' is being used like a tuple:
	foreach (i, arg; args)
	{
		writefln("%s: %s %s argument %s", i, typeof(arg).stringof, T[i].stringof, arg);
	}
}
