// WARNING: Your system may become unresponsive when this program is running.
import std.stdio       : writeln;
import std.concurrency : send, receive, spawn, thisTid, ownerTid, setMaxMailboxSize, OnCrowding;
import core.thread     : Thread;
import std.datetime    : seconds;

void main()
{
	enum mailboxSize = 10;
	setMaxMailboxSize(thisTid, mailboxSize, OnCrowding.block);

    spawn(&workerFunc);

    while (true)
    {
        receive(
            (int message) {
            // Spends time for each message
            Thread.sleep(1.seconds);
            writeln("main(): ", message);
        });
    }
}

void workerFunc()
{
	int i = 0;

    while (true)
    {
        ownerTid.send(42);  // ← Produces messages continuously
		writeln("workerFunc(): message ", ++i);
    }
}
