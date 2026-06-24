import std.stdio;

void main() {
	int[] slice = [10, 20, 30];

	writeln("foo(slice, 1): ", foo(slice, 1));
	writeln("foo(slice, 3): ", foo(slice, 3));	// RangeError
}

int foo(int[] arr, size_t i) nothrow {
	return 10 * arr[i];
}
