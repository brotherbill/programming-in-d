module fibonacci_series;

struct FibonacciSeries
{
    int current = 0;
    int next = 1;
    enum empty = false;
    int front() const
    {
        return current;
    }

    void popFront()
    {
        const nextNext = current + next;
        current = next;
        next = nextNext;
    }

    FibonacciSeries save() const
    {
        return this;
    }
}
