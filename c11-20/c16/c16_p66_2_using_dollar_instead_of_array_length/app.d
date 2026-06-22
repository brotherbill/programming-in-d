import std.stdio;

void main()
{
	int[2] monthDays = [31, 28];				// just Jan and Feb

	// $ refers to the length of the array, so monthDays[$ - 1] is the last element
	// This saves us a lot of typing
	writeln(monthDays[monthDays.length - 1]);
	writeln(monthDays[$ - 1]);
	writeln();
}
