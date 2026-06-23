import std.stdio : writeln;

void main()
{
	int a = 1;
	int b = 2;

	int[5] array = [10, 20, 30, 40, 50];
	writeln("a: ", a, ", b: ", b);
	writeln("array before: ", array);

	// rvalue 'a + b' on the left, lvalue 'a' on the right
	array[a + b] = a;	// equivalent to array[1 + 2] = 1;

	writeln("array after : ", array);
}
