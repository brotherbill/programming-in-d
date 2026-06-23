import std.stdio;
import std.math;

void main()
{
    auto garden  = Rectangle(10, 20);
    auto garden2 = Rectangle(10, 20);

    writeln("The area of garden: ", garden.area);

    // standard functional syntax
    garden2.area(50);
    writefln("garden2.area(50): %s x %s = %s", garden2.width, garden2.height, garden2.area);

    // assignment syntax, calling property setter
    garden.area = 50;
    writefln("garden.area = 50: %s x %s = %s", garden.width, garden.height, garden.area);
}

struct Rectangle
{
    double width;
    double height;

    // property getter
    double area() const
    {
        return width * height;
    }

    // property setter, including assignment syntax
    void area(double newArea)
    {
        auto scale = sqrt(newArea / area);
        width *= scale;
        height *= scale;
    }
}
