module rectangle;

import std.math;

struct Rectangle
{
private:

    double width_;
    double height_;

public:
    // getter
    double area() const
    {
        return width * height;
    }

    // explicit setter, with assignment syntax
    void area(double newArea)
    {
        auto scale = sqrt(newArea / area);
        width_ *= scale;
        height_ *= scale;
    }

    // getter
    double width() const
    {
        return width_;
    }

    // getter
    double height() const
    {
        return height_;
    }
}
