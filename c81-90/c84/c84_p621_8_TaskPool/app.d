import std.stdio;
import std.parallelism;

void main()
{
	auto workers = new TaskPool(2);
	
	foreach (i; workers.parallel([1, 2, 3, 4]))
	{
		writefln("Working on %s", i);
	}

	workers.finish();
}
