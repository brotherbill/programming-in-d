import std.stdio;

void main()
{
    auto garden = Rectangle(10, 20);
    writeln("The area of the garden: ", garden.area);
}

struct Rectangle
{
    double width;
    double height;

    double area() const
    {
        return width * height;
    }
}
