import std.stdio : writefln;

void main()
{
	int a = 1;
	int b = 2;

	writefln("main() calls foo(a, b), with a: %s, b: %s", a, b);
	int c = foo(a, b);				// Calls foo, passing arguments a and b
	writefln("main() c: %s", c);
}

int foo(int x, int y)				// foo with parameters x and y
{
	writefln("foo(x, y), with x: %s, y: %s", x, y);
	writefln("foo() calls bar(x + y), with x: %s, y: %s", x, y);
	bar(x + y);		// which calls bar passing argument (x + y)
	writefln("foo() returns: %s", 42);
	return 42;						
}

void bar(int param)		// bar with parameter param
{
	writefln("bar(param), with param: %s", param);
	string[] arr;
	// ...
}
