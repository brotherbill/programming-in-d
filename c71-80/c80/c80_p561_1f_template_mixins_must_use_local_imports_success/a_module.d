module a_module; // Avoid name collision with a()

mixin template A(T)
{
    public string a()
    {
        import std.string : format; // ← right place

        T[] array;
        array ~= [10, 20, 30];

        return format("%(%s, %)", array);
    }
}
