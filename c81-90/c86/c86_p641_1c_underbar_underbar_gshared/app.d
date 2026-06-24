import std.stdio       : writefln;
import std.concurrency : spawn;
import core.thread     : thread_joinAll;

__gshared int variable;          // System (global) level, initialized to 0
__gshared char anotherVar = 'A'; // System (global) level, initialized to 'A'   

void printInfo(string message)
{
    writefln("%s: %2.0s (@%s)", message, variable, &variable);
}

void worker()
{
    variable = 42;
    printInfo("worker() Before the worker is terminated");
}

void main()
{
    printInfo("main() Before the worker is started     ");
    spawn(&worker);
    thread_joinAll();
    printInfo("main() After the worker is terminated   ");
}
