import std.stdio : writeln;


void main()
{
	int    a = 0;
	int    b = 1;
	size_t c = 0;


	writeln(" ", __LINE__, " typeof(c): ", typeof(c).stringof);
	writeln;


	writeln(__LINE__, " a - b + c: ", a - b + c, ", typeof(a - b + c): ", typeof(a - b + c).stringof); // Surprising result
	writeln;


	auto aMinusB = (a - b);
	writeln(__LINE__, " a - b: ", a - b, ", typeof(a - b): ", typeof(aMinusB).stringof);
	writeln;


	auto aMinusBPlusC = aMinusB + c;
	writeln(__LINE__, " a - b + c: ", aMinusBPlusC, ", typeof(a - b + c): ", typeof(aMinusBPlusC).stringof);
}
