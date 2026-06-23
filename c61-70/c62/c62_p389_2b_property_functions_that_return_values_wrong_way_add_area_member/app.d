import std.stdio;

void main() {
    auto garden = Rectangle(10, 20, 1111);  // Oops, wrong area
    writeln("garden.area: ", garden.area);
}

struct Rectangle {
    double width;
    double height;
	double area;
}
