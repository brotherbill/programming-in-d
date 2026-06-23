import std.stdio;

void main()
{
	assert(42.half() == 21);

	int result1, result2, result3;
	int value = 7;
	result1 = half(value); 	// 3
	result2 = value.half(); // 3
	result3 = value.half; 	// 3

	writefln("half of 7 is: %s %s %s", result1, result2, result3);
}

int half(int value)
{
	return value / 2;
}
