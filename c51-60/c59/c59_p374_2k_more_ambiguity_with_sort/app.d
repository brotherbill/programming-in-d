void main()
{
	import std.stdio : writeln;
	import std.algorithm;

	auto arr = [2, 10, 1, 5];
	arr.sort; // ← compilation WARNING.  No, it works.
	writeln(arr);
}
