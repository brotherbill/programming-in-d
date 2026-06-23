import std.stdio;
import point;

void main() {
	Point point = { x: 10, y: 20 };
	// point.x = 20;				// Won't compile. Point is in another module, with x private.
	point.y = 30;

	writeln("point is: ", point);

	Circle circle = { radius: 1.0 };
	circle.radius = 3.14;			// private acts like 'public' within same module!

	writeln("circle is: ", circle);

	bar();
	// 	point.pointBar;				// Won't compile. Point is in another module, with pointBar() private.

}

struct Circle {
	private double radius;
}

private int foo;

private void bar() {
	writeln("app.bar() was called");
}