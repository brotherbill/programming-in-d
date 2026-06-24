module a;

import std.string; // ← wrong place, should be in A(T)

mixin template A(T)
{
    string a()
    {
        T[] array;
        // ...
        return format("%(%s, %)", array);
    }
}
