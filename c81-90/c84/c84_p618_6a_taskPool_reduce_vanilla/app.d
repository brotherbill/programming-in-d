import std.stdio     : writeln;
import std.algorithm : reduce;

void main()
{
	writeln(reduce!((a, b) => a + b * b)(0, [5, 10]));
	writeln(reduce!((a, b) => a + b * b)(0, cast(int[])[]));
}
