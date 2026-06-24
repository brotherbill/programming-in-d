import std.stdio       : writeln, writef;
import std.concurrency : spawn, Tid, send, receive, ownerTid;
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
                ownerTid.send(cast(shared)exc); // cast to shared to get it into the message queue.
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

            (shared Exception message) {
                writeln("calculation failed: ", message.msg);
                throw cast()message; // cast away from shared to actually throw it.
            }
        );
    }
}