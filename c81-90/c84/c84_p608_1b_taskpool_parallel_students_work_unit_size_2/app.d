 import std.stdio;
 import core.thread;
 import std.datetime.timezone : LocalTime;
 import std.datetime          : Clock;
 import std.parallelism       : parallel;

struct Student
{
    int number;

    void aSlowOperation()
    {
        writefln("The work on student %s has begun at %s", number, Clock.currTime);

        // Wait for a while to simulate a long-lasting operation
        Thread.sleep(1.seconds);

        writefln("The work on student %s has ended at %s", number, Clock.currTime);
    }
}

void main()
{
    auto students = [Student(1), Student(2), Student(3), Student(4)];

	//                         range     work_unit_size
    foreach (student; parallel(students, 2))
    {
        student.aSlowOperation();
    }
   
    writeln("End of program");
}
