import std.stdio;
import std.math;

void main()
{
    auto garden  = Rectangle(10, 20);
    auto garden2 = Rectangle(10, 20);
    writeln("The area of the garden: ", garden.area());

    garden.area(50);
    garden2.area = 50;
    writefln("garden.setArea(50)  : %s x %s = %s", garden.width,  garden.height,  garden.area());
    writefln("garden2.setArea = 50: %s x %s = %s", garden2.width, garden2.height, garden2.area);
}

struct Rectangle
{
    double width;
    double height;

    // getter
    double area() const
    {
        return width * height;
    }

    // explicit setter, with assignment syntax
    void area(double newArea)
    {
        auto scale = sqrt(newArea / area);
        width *= scale;
        height *= scale;
    }
}
