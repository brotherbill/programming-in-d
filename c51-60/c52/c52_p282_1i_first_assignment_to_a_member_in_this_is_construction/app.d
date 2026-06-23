void main()
{
    import std.stdio : writeln;

    auto s = S(1, 2, 3);
    writeln("s.m = ", s.m);
    writeln("s.i = ", s.i);
    writeln("s.j = ", s.j);
    writeln;

    auto s2 = S.make(1, 2, 3);
    writeln("s2.m = ", s2.m);
    writeln("s2.i = ", s2.i);
    writeln("s2.j = ", s2.j);
}

struct S 
{
              int m;
    immutable int i;
    immutable int j;

    // Assigning values to immutable members is only allowed during construction initialization, not after the object has been fully constructed.
    this(in int m, in int i, in int j) 
    {
        this.m = m;     // ← construction initialization
        this.m = 42;    // ← assignment (possible for mutable member)


        this.i = i;     // ← construction initialization
        // this.i = 86; // ← compilation ERROR


        this.j = j;     // ← construction initialization
        // this.j = 99; // ← compilation ERROR
    }

    static S make(in int m, in int i, in int j) 
    {
        S s = S(m, i, j);       // ← construction initialization based on line 23
        // S s2 = {m, i, j};    // When explicit constructor is defined, aggregate initialization, using braces, is not allowed (compilation ERROR)


        s.m = 42;       // ← assignment (possible for mutable member)
        // s.i = i;     // ← compilation ERROR
        // s.j = j;     // ← compilation ERROR
        return s;
    }
}
