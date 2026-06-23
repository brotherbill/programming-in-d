void main()
{
    interactWithUser;
}

string makeGreeting(string name)
{
    import std.string : format;

    string greeting = format("Greetings %s", name);
    return greeting;
}

void interactWithUser()
{
    import std.stdio : readln, write, writeln;

    write("Please enter your name: ");
    string name = readln();
    writeln(makeGreeting(name));
}
