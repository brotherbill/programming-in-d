import std.stdio;

void main() {
	maskAndLower8Bits;
	maskAndUpper8Bits;
	maskAndUpper8BitsShiftedRight24Bits;
}

void maskAndLower8Bits() {
	uint value = 123456789;
	uint mask = 0x000000ff;

	writeln("Extract lower 8 bits using AND operation:");
	write("value :");
	print(value);
	write("mask  :");
	print(mask);
	write("result:");
	print(value & mask);
	writeln;
}

void maskAndUpper8Bits() {
	uint value = 0xc0a80102; // Example IP:
	uint mask = 0xff000000;

	writeln("Extract upper 8 bits using AND operation:");
	write("value :");
	print(value);
	write("mask  :");
	print(mask);
	write("result:");
	print(value & mask);
	writeln;
}	

void maskAndUpper8BitsShiftedRight24Bits() {
	uint value = 0xc0a80102; // Example IP:
	uint mask = 0xff000000;

	writeln("Extract upper 8 bits and shift right by 24 bits:");
	write("value :");
	print(value);
	write("mask  :");
	print(mask);
	write("result:");
	print((value & mask) >> 24);
	writeln;
}

void print(uint number) {
    writefln("  %032b %08x %10s", number, number, number);
}
