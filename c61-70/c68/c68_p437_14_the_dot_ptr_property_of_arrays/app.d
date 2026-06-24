import std.stdio;

void main()
{
	int[] numbers = [7, 12];

	int* addressOfFirstElement = numbers.ptr;
	writeln("Address of the first element: ", addressOfFirstElement);
}
