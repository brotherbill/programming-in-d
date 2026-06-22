import std.stdio;

void main()
{
	real value = real.max;
	writeln("Before         : ", value);

	// Multiplying by 1.1 is the same as adding 10%
	value *= 1.1;
	writeln("Added 10%      : ", value);

	// Let's try to reduce its value by dividing in half
	value /= 2;
	writeln("Divided in half: ", value);
}
