import std.stdio;

void main()
{
	auto garden = Rectangle(10, 20);
	writeln("garden.area: ", garden.area);
}

struct Rectangle
{
	double width;
	double height;

	// To get it to compile, created area function
	double area()
	{
		return width * height;
	}
}
