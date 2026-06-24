import std.stdio;
import std.range;
import std.math : pow;
// import std.random;  // uniform not working on Windows for 2.111.0

void main()
{
	auto dieThrower = generate!(() => Die.next);
	writeln(dieThrower.take(10));
}

// Easy random number generator.  Not secure.
struct Die {
	static ulong seed;

	enum ulong a = 1_664_525;  		// Multiplier
	enum ulong c = 1_013_894_223;	// Increment
	enum ulong m = 4_294_967_296;	// Modulus 2 ** 32

	static int next() {
		seed = (a * seed + c) % m;
		return cast(int)(seed % 6 + 1);		// 1 .. 6
	}
}