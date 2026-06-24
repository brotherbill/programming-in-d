import std.stdio;
import std.range;

void main()
{
    foreach (i, element; NumberRange(42, 47).enumerate)
    {
        writefln("%s: %s", i, element);
    }
}

// Uses range, not opApply
struct NumberRange
{
    int begin;
    int end;

    invariant ()
    {
        // There is a bug if begin is greater than end
        assert(begin <= end);
    }

    bool empty() const
    {
        // The range is consumed when begin equals end
        return begin == end;
    }

    void popFront()
    in
    {
        assert(!empty, "not empty");
    }
    do
    {
        // Skipping the first element is achieved by incrementing the beginning of the range
        ++begin;
    }

    int front() const
    in
    {
        assert(!empty, "not empty");
    }
    do
    {
        // The front element is the one at the beginning
        return begin;
    }
}
