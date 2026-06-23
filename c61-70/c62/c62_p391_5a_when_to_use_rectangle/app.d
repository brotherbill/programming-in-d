import std.stdio;
import rectangle;

void main()
{
    auto garden  = Rectangle(10, 20);
    auto garden2 = Rectangle(10, 20);

    writeln("The area of the garden: ", garden.area());

    garden.area(50);
    garden2.area = 50;

    // garden.width_ = 100;		// won't compile.  Rectangle.width_ is private
    // garden.width  = 100;		// won't compile.  Rectangle.width is not an lvalue, it is a function, and you can't assign a double to a function

    writefln("garden.setArea(50)  : %s x %s = %s", garden.width,  garden.height,  garden.area());
    writefln("garden2.setArea = 50: %s x %s = %s", garden2.width, garden2.height, garden2.area);
}
