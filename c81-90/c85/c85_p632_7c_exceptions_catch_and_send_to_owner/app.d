import std.stdio       : writeln, writef, writefln;
import std.concurrency : spawn, send, receive, Tid, ownerTid;
import std.conv        : to;

struct CalculationFailure
{
	string reason;
}

struct Exit
{
}

void calculate()
{
	bool isDone = false;

	while (!isDone)
	{
		receive((string message) {
			try
			{
				ownerTid.send(to!double(message) + 0.5);
			}
			catch (Exception exc)
			{
				ownerTid.send(CalculationFailure(exc.msg));
			}
		},
			(Exit message) { isDone = true; });
	}
}

void main()
{
	Tid calculator = spawn(&calculate);
	calculator.send("1.2");
	calculator.send("hello"); // ← incorrect input
	calculator.send("3.4");
	calculator.send(Exit());

	foreach (i; 0 .. 3)
	{
		writef("result %s: ", i);
		receive(
			(double message) { writeln(message); },

			(CalculationFailure message) {
			writefln("ERROR! '%s'", message.reason);
		});
	}
}
