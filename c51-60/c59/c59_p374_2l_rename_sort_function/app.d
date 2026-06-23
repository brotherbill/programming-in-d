void main()
{
	import std.stdio;
	import std.algorithm : algSort = sort;

	auto arr = [2, 10, 1, 5];

	arr.algSort;

	writeln(arr);
}
