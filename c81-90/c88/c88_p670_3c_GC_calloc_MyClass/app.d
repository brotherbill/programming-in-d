import std.stdio     : writeln, writefln;
import core.memory   : GC;
import core.lifetime : emplace;

void main()
{
    // Allocate room for 10 MyClass objects
    immutable size_t myClassActualSize = __traits(classInstanceSize, MyClass);
    writeln("myClassActualSize: ", myClassActualSize);

    // ensure myClassSize is divisible by 8, to allow for padding
    immutable padding = 8;
    immutable size_t myPaddedClassSize =
        (myClassActualSize % padding == 0) ? myClassActualSize : (myClassActualSize + padding) / padding * padding;

    writeln("myPaddedClassSize: ", myPaddedClassSize);

    immutable bytesNeeded = myPaddedClassSize * 10;
    writeln("bytesNeeded: ", bytesNeeded);
    MyClass* myClasses = cast(MyClass *) GC.calloc(bytesNeeded);
    writeln("myClasses address: ", myClasses);

	alias MyClassPtr = MyClass *;
	MyClassPtr[10] myClassPtrs;

	foreach (i; 0 .. 9) {
		myClassPtrs[i] = myClasses + i * myPaddedClassSize / padding;
		writefln("myClassPtrs[%s]: %s ", i, myClassPtrs[i]);
		auto buffer = cast(MyClass *) emplace(myClassPtrs[i]);
		writefln("i: %s, buffer: %s", i, buffer);
		writeln("i: %s, a: %s", i, myClassPtrs[i].a);		// Compiles. Run time hangs/exception
	}
}

class MyClass
{
    int a;
    string name;
    char c;
}
