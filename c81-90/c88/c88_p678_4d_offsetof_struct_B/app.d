import std.stdio : writefln;

void main()
{
    printObjectLayout!B();
}

struct B
{
    int   i; // Moved up inside the struct definition
    byte  b;
    ubyte u;
}

static assert(B.sizeof == 8); // 4 + 1 + 1

void printObjectLayout(T)() if (is(T == struct) || is(T == union))
{
    import std.stdio;
    import std.string;

    writefln("=== Memory layout of '%s'" ~
            " (.sizeof: %s, .alignof: %s) ===",
            T.stringof, T.sizeof, T.alignof);

    // Prints a single line of layout information.
    void printLine(size_t offset, string info)
    {
        writefln("%4s: %s", offset, info);
    }

    // Prints padding information if padding is actually observed.
    void maybePrintPaddingInfo(size_t expectedOffset,
        size_t actualOffset)
    {
        if (expectedOffset < actualOffset)
        {
            // There is some padding because the actual offset is beyond the expected one.
            const paddingSize = actualOffset - expectedOffset;
            printLine(expectedOffset,
                format("... %s-byte PADDING",
                    paddingSize));
        }
    }

    // This is the expected offset of the next member if there were no padding bytes before that member.
    size_t noPaddingOffset = 0;

    // Note: __traits(allMembers) is a 'string' collection of names of the members of a type.
    foreach (memberName; __traits(allMembers, T))
    {
        mixin(format("alias member = %s.%s;", T.stringof, memberName));
        const offset = member.offsetof;

        maybePrintPaddingInfo(noPaddingOffset, offset);

        const typeName = typeof(member).stringof;

        printLine(offset, format("%s %s", typeName, memberName));
        noPaddingOffset = offset + member.sizeof;
    }

    maybePrintPaddingInfo(noPaddingOffset, T.sizeof);
}
