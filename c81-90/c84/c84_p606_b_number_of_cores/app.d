import std.stdio;
import std.parallelism;

void main()
{
	writefln("There are %s cores on this system.", totalCPUs);
}
