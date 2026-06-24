import std.stdio;
import std.string;

enum Crayon {
	Red,
	Green,
	Blue,
	Yellow,
	Purple
}

void main() {
	size_t numberOfBytes;

	print(Crayon.Yellow, null);
	print(Crayon.Purple, &numberOfBytes);
	writeln("Number of bytes printed for Purple crayon: ", numberOfBytes);
}

// Function to print the crayon and optionally return the number of bytes printed
void print(Crayon crayon, size_t* numberOfBytes) {
	immutable info = format("Crayon: %s", crayon);

	writeln(info);

	if (numberOfBytes) {
		*numberOfBytes = info.length;
	}
}
