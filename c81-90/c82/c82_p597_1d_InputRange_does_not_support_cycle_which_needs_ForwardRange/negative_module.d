module negative_module;  // Can't have same same as negative(T) below

import std.range : empty, front, popFront, isInputRange;

struct Negative(T) if (isInputRange!T)
{
    T range;
    bool empty()
    {
        return range.empty;
    }

    auto front()
    {
        return -range.front;
    }

    void popFront()
    {
        range.popFront();
    }

}

Negative!T negative(T)(T range)
{
    return Negative!T(range);
}
