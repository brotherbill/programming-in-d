import std.stdio;

void main()
{
	//           1048576 4096 1
	//                 ↓  ↓  ↓
	uint number = 0x_0030_a00f;
	writeln("uint number: ", number);

	// hexadecimal:     0    0    3    0    a    0    0    f
	uint binary = 0b_0000_0000_0011_0000_1010_0000_0000_1111;
	writeln("binary     : ", binary);

	// binary:           0100 0000 0000 0000 0000 0000 0000 0101
	uint hexadecimal = 0x___4____0____0____0____0____0____0____5;
	writeln("hexadecimal: ", hexadecimal);
}
