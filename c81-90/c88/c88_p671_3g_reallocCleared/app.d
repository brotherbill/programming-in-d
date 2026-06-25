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

        // ubyte* newBuffer = cast(ubyte*) GC.realloc(oldBuffer, resizeBytes);
        reallocCleared(oldBuffer, 12, resizeBytes);
        writeln("reallocCleared()");
        writeln("oldBuffer: ", oldBuffer);

        writeln("oldBuffer[0]: ", oldBuffer[0]);
        writeln("oldBuffer[9]: ", oldBuffer[9]);
        writeln;

        GC.realloc(oldBuffer, 0); // same as: GC.free(newBuffer);
        oldBuffer = null; // Make it obvious that buffer is not an active pointer
    }
}

// Works like GC.realloc but clears the extra bytes if memory is extended.
void* reallocCleared(
    void* buffer,
    size_t oldLength,
    size_t newLength,
    GC.BlkAttr blockAttributes = GC.BlkAttr.NONE,
    const TypeInfo typeInfo = null)
{
    // Dispatch the actual work to GC.realloc
    buffer = GC.realloc(buffer, newLength, blockAttributes, typeInfo);

    // Clear the extra bytes if extended
    if (newLength > oldLength)
    {
        import core.stdc.string;

        auto extendedPart = buffer + oldLength;
        const extendedLength = newLength - oldLength;

        memset(extendedPart, 0, extendedLength);
    }

    return buffer;
}
