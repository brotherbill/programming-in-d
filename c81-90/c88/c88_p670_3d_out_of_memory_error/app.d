import std.stdio;
import core.memory;

void main()
{
	void * buffer = GC.calloc(150_000_000_000);
}
