void main()
{
	import std.stdio : writeln;

	int[] slice = [10, 20, 30, 40]; // 1
	writeln("Original slice: ", slice);

	halve(slice);
	writeln("halve(slice)  : ", slice);
	writeln;

	const(int[]) slice2 = [10, 20, 30, 40];
	writeln("const    (int[]) slice2: ", slice2);

	immutable(int[]) slice3 = [10, 20, 30, 40];
	writeln("immutable(int[]) slice3: ", slice3);

	// halve(slice2);	// ← compilation ERROR  
	// 					// cannot pass argument `slice2` of type `const(int[])` to parameter `int[] numbers`
	//                  // the reason is that halve will mutate each number in numbers, where changing const values is not permitted

	// halve(slice3);	// ← compilation ERROR, same as line 18
}

void halve(int[] numbers)	// 2
{
	foreach (ref number; numbers)
	{
		number /= 2;
	}
}
