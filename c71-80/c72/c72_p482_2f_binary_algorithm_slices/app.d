import std.stdio;
import std.exception;

void main()
{
	writeln(binaryAlgorithm((a, b) => (a * 10) + b, [1, 2, 3], [4, 5, 6]));
}

int[] binaryAlgorithm(int function(int, int) func, const int[] slice1, const int[] slice2)
{
	enforce(slice1.length == slice2.length);

	int[] results;

	foreach (i; 0 .. slice1.length)
	{
		results ~= func(slice1[i], slice2[i]);
	}

	return results;
}
