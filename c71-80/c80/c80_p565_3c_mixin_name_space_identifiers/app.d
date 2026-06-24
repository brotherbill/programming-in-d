import std.stdio;

void main()
{
    mixin Templ A; // Defines A.i
    mixin Templ B; // Defines B.i

    A.i = 42; // ← not ambiguous anymore
}

template Templ()
{
    int i;
}
