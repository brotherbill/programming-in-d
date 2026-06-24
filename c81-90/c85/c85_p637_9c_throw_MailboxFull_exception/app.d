import std.stdio       : writeln;
import std.concurrency : thisTid, ownerTid, spawn, send, receive, setMaxMailboxSize, MailboxFull, OnCrowding;
import core.thread     : Thread;
import std.datetime    : seconds, msecs;

void main()
{
	enum mailboxSize = 10;
	setMaxMailboxSize(thisTid, mailboxSize, OnCrowding.throwException);
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
		try
		{
			ownerTid.send(42);
			writeln("workerFunc(): message ", ++i);
		}
		catch (MailboxFull exc)
		{
			// Failed to send; will try again later. 
			Thread.sleep(250.msecs);
			writeln("workerFunc() sleep 250 ms");
		}
	}
}
