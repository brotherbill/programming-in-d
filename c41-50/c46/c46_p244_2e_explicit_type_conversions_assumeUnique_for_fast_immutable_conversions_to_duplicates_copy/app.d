import std.conv : to;

void main() {
	int[] numbers;
	numbers ~= 10;
	// ... various other modifications ...
	numbers[0] = 42;

	auto immutableNumbers = to!(immutable int[])(numbers);	// makes duplicate copy
	calculate_immutable(immutableNumbers); 					// ← now compiles

	assert(&(numbers[0]) !is &(immutableNumbers[0]));
	assert(  numbers.ptr !is   immutableNumbers.ptr);
}

void calculate_immutable(immutable int[] coordinates) {
	// ...
}
