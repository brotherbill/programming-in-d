import std.stdio : writefln;
import std.algorithm : map, sum;
import core.thread : Thread;
import std.datetime.timezone : LocalTime;
import std.datetime : Clock, seconds;

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

void main()
{
	Student[] students;
	foreach (i; 0 .. 10)
	{
		// Two grades for each student
		students ~= Student(i, [80 + i, 90 + i]);
	}

	auto results = map!(a => a.averageGrade)(students);
	foreach (result; results)
	{
		writefln("%s", result);
	}
}
