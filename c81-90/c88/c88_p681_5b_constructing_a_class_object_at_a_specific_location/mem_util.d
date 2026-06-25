module mem_util;

T* nextAlignedAddress(T)(T* candidateAddr)
{
    import std.traits : classInstanceAlignment;

    static if (is(T == class))
    {
        const alignment = classInstanceAlignment!T;
    }
    else
    {
        const alignment = T.alignof;
    }

    const result = (cast(size_t) candidateAddr + alignment - 1) / alignment * alignment;

    return cast(T*) result;
}

void* nextAlignedAddress(T)(void* candidateAddr)
{
    return nextAlignedAddress(cast(T*) candidateAddr);
}

size_t sizeWithPadding(T)()
{
    static if (is(T == class))
    {
        const candidateAddr = __traits(classInstanceSize, T);
    }
    else
    {
        const candidateAddr = T.sizeof;
    }
   
    return cast(size_t) nextAlignedAddress(cast(T*) candidateAddr);
}
