import std.stdio   : writeln;
import core.memory : GC;

void main()
{
	ubyte * buffer = cast(ubyte *)GC.calloc(10_000);

	// use buffer 
	writeln("buffer after calloc: ", buffer);

	// May not execute all the destructors of variables living on this buffer
	// May explicitly call destroy() for each variable
	// free() will call destructors for new MyClass()
	// Confirm that all destructors of variables living on this buffer are called once each
	GC.free(buffer);

	// buffer is freed, and it is undefined if you read or write to buffer.
	// Also, don't call GC.free(buffer) again.  That also results in Undefined Behavior.

	// buffer is a dangling pointer now
	writeln("buffer after free  : ", buffer);

	buffer = null;	// Make it obvious that buffer is not an active pointer

	writeln("buffer after = null: ", buffer);
}
