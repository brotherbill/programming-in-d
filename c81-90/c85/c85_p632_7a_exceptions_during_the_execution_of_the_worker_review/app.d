import std.stdio : writeln, writefln;
import std.parallelism : task;
import core.thread : Thread;
import std.datetime : seconds;

void mayThrow()
{
    writeln("mayThrow() is started");
    Thread.sleep(1.seconds);
    writeln("mayThrow() is throwing an exception");
    throw new Exception("My error message");
}

void main()
{
    auto theTask = task!mayThrow();
    theTask.executeInNewThread();

    writeln("main is continuing");
    Thread.sleep(3.seconds);

    writeln("main is waiting for the task");

    try {
        theTask.yieldForce();
    } catch (Exception exc) {
        writefln("Detected an error in the task: '%s'", exc.msg);
    }
}
