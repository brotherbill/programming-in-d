import std.stdio : writef;

void main()
{
	int a = 10;
	int b = 20;

	int sum = a + b;
	writef("Sum: %d\n", &sum);

	writef("&a is: %s\n", &a); 			 // ← compiles
	writef("&(a + b) is: %s", &(a + b)); // ← compilation ERROR
}
