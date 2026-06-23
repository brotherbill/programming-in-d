import std.stdio;

void main()
{
    auto age = getResponse!(int)("What is your age?");
    writeln("age: ", age);
    writeln;

    auto pi = getResponse!double("What is Pi?");
    writeln("pi : ", pi);
}

T getResponse(T)(string question)
{
    writef("%s (%s): ", question, T.stringof);

    T response;
    readf(" %s", &response);
    return response;
}
