import std.stdio;

void main() {
	int twiceInt = twice(42);
	writeln("twiceInt: ", twiceInt);

	double twiceDouble = twice!double(3.14);
	writeln("twiceDouble: ", twiceDouble);
}

T twice(T)(T value) {
	return 2 * value;
}

class Fraction(T) {
	T numerator;
	T denominator;
	// ...
}
