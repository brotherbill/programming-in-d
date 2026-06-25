import std.stdio   : writeln;
import core.memory : GC;

void main()
{
	foreach (resizeBytes; [10, 20])
	{
		ubyte* oldBuffer = cast(ubyte*) GC.calloc(12);
		writeln("oldBuffer: ", oldBuffer);

		// use oldBuffer
		oldBuffer[0] = 42;
		oldBuffer[9] = 86;

		writeln("oldBuffer[0]: ", oldBuffer[0]);
		writeln("oldBuffer[9]: ", oldBuffer[9]);

		ubyte* newBuffer = cast(ubyte*) GC.realloc(oldBuffer, resizeBytes);
		writeln("newBuffer: ", newBuffer);

		if (newBuffer !is oldBuffer)
		{
			writeln("Memory for oldBuffer moved");
			oldBuffer = null;
		}

		writeln("newBuffer[0]: ", newBuffer[0]);
		writeln("newBuffer[9]: ", newBuffer[9]);
		writeln;

		GC.realloc(newBuffer, 0);	// same as: GC.free(newBuffer);
		newBuffer = null; // Make it obvious that buffer is not an active pointer
	}
}
