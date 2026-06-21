import std.stdio;

void main()
{
    // Works on happy path only.  Invalid input throws an exception.
    bool amAuthorized;

    write("Are you authorized? (true/false) "); stdout.flush;
    // Using readf to read a boolean value
    // Note: This assumes the input is either "true" or "false", case ignorant
    readf(" %s", &amAuthorized);

    write("How many students are there? "); stdout.flush;
    int studentCount;
    readf(" %s", &studentCount);

    write("How many teachers are there? "); stdout.flush;
    int teacherCount;
    readf(" %s", &teacherCount);

    writeln("You are authorized: ", amAuthorized);
    writeln("Got it: There are ", studentCount, " students", " and ", teacherCount, " teachers.");
}
