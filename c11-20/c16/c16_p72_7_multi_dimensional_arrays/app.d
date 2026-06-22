import std.stdio;

void main()
{
	int[][] array2 = [
		[1, 2, 3],
		[4, 5, 6],
		[7, 8, 9],
		[10, 11, 12]
	];

	writeln("Original array: ", array2);

	array2 ~= [13, 14];
	writeln("Array after appending [13, 14]: ", array2);

	array2[0] ~= 13;
	writeln("Array after appending 13 to the first sub-array: ", array2);

	writeln("array2[1][2] = ", array2[1][2]);
	writeln();

	int[][] s = new int[][](2, 3);
	writeln("s[1][2] = ", s[1][2]);	// s allocated memory for 2 sub-arrays, each with 3 elements. The elements are initialized to 0 by default.
	s[0] = [1, 2, 3];
	s[1] = [4, 5, 6];
	writeln("Newly created array s: ", s);
}
