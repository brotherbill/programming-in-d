import std.stdio : readf, writeln;

void main()
{
	int number_d;
	int number_o;
	int number_x;
	int number_b;

	readf(" %d %o %x %b", &number_d, &number_o, &number_x, &number_b);

										 // Input: 100 100 100 100
	writeln("Read with %d: ", number_d); // 1 * 10^^2 = 100
	writeln("Read with %o: ", number_o); // 1 *  8^^2 =  64
	writeln("Read with %x: ", number_x); // 1 * 16^^2 = 256
	writeln("Read with %b: ", number_b); // 1 *  2^^2 =   4
}
