import std.stdio;

void main()
{
	int width       = 40_000;
	int length      = 60_000;
	int areaPerTree =  1_000;

	int treesNeeded = width * length / areaPerTree; // multiply, then divide
	writeln("Number of trees needed: (width * length / areaPerTree) = ", treesNeeded);
	writeln();

	treesNeeded = width * (length / areaPerTree); 	// divide, then multiply
	writeln("Number of trees needed: (width * (length / areaPerTree)) = ", treesNeeded);
}
