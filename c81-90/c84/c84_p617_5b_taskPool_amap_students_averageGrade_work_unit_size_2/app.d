import std.stdio;
import std.algorithm;
import core.thread;
import std.parallelism;
import std.datetime.timezone : LocalTime;
import std.datetime : Clock;

struct Student
{
    int number;
    int[] grades;

    double averageGrade()
    {
        writefln("%s Started working on student %s", Clock.currTime, number);
        Thread.sleep(1.seconds);

        const average = grades.sum / grades.length;
        writefln("%s Finished working on student %s", Clock.currTime, number);

        return average;
    }
}

double averageGrade(Student student)
{
    auto avgGrade = student.averageGrade;
    writeln(avgGrade);
    return avgGrade;
}

void main()
{
    Student[] students;
    foreach (i; 0 .. 10)
    {
        // Two grades for each student
        students ~= Student(i, [80 + i, 90 + i]);
    }

    auto results = taskPool.amap!averageGrade(students, 2);
    writeln("results: ", results);
}
