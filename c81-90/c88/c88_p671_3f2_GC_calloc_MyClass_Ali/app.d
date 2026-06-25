import std.stdio     : writeln, writefln;
import std.string    : format;
import core.memory   : GC;
import core.lifetime : emplace;

void main()
{
	enum elementCount = 10; 

    // Allocate room for 10 MyClass objects
    immutable size_t myClassActualSize = __traits(classInstanceSize, MyClass);
    writeln("myClassActualSize: ", myClassActualSize);

    // ensure myClassSize is divisible by 8, to allow for padding
    immutable padding = 8;
    immutable size_t myPaddedClassSize =
        (myClassActualSize % padding == 0) 
			? myClassActualSize 
			: (myClassActualSize + padding) / padding * padding;
    writeln("myPaddedClassSize: ", myPaddedClassSize);

    immutable bytesNeeded = myPaddedClassSize * elementCount;
    writeln("bytesNeeded: ", bytesNeeded);

    void* myClassObjects = GC.calloc(bytesNeeded);
    writeln("myClasses address: ", myClassObjects);

    // [Ali] Note the type of the array: 
	//       MyClass is a reference to object; no pointer needed
    MyClass[] myClasses;

    foreach (i; 0 .. elementCount) {
        void * address = myClassObjects + (i * myPaddedClassSize);

        // The first parameter guides emplace() of slice to instantiate MyClass instance.
        myClasses ~= emplace!MyClass(address[0 .. myPaddedClassSize], i, "Sally", 'D');
    }
	writeln;

	foreach (i; 0 .. elementCount) {
		writefln("%s: %s, &myClasses[i]: %s, &myClasses[i].a: %s", 
				  i, myClasses[i], &myClasses[i], &myClasses[i].a);
	}
}

class MyClass
{
    int a;
    string name;
    char c;

    this(int a, string name, char c) {
        this.a = a;
		this.name = name;
		this.c = c;
    }

	override string toString() const {
		return format("{a: %s, name: %s, c: %s}", a, name, c);
	}
}