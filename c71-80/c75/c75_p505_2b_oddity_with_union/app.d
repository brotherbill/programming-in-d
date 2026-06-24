import std.stdio;

void main()
{
    auto u1 = U(42);
    writefln("u1.i: %s, u1.d: %s", u1.i, u1.d);

    U u2 = {i: 42};
    writefln("u2.i: %s, u2.d: %s", u2.i, u2.d);

    U u3 = {d: 3.14};
    writefln("u3.i: %s, u3.d: %s", u3.i, u3.d);
}

struct S
{
    int i;
    double d;
}

union U
{
    int i;
    double d;
}
