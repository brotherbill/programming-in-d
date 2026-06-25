import std.stdio     : writeln, writefln;
import std.string    : format;
import core.memory   : GC;
import core.lifetime : emplace;
import std.conv      : to;
import mem_util      : sizeWithPadding, nextAlignedAddress;

void main()
{
	// Some information about this type. 
	writefln("Student.sizeof: %#x (%s) bytes", Student.sizeof, Student.sizeof);
	writefln("Student.alignof: %#x (%s) bytes",	Student.alignof, Student.alignof);

	string[] names = ["Amy", "Tim", "Joe"];

	const totalSize = sizeWithPadding!Student() * names.length;
	// Reserve room for all Student objects.

	// Warning! The objects that are accessible through this slice are not constructe yet;
  	// they should not be accessed until after they are properly constructed. 
	Student[] students = (cast(Student*) GC.calloc(totalSize))[0 .. names.length];

	foreach (i, name; names)
	{
		Student* candidateAddr = students.ptr + i;
		Student* objectAddr = nextAlignedAddress(candidateAddr);
		writefln("address of object %s: %s", i, objectAddr);

		const id = 100 + i.to!int;
		emplace(objectAddr, name, id);
	}

	// All of the objects are constructed and can be used.
	writeln(students);
}

struct Student
{
	string name;
	int    id;

	string toString() const
	{
		return format("%s(%s)", name, id);
	}
}
