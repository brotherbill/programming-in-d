module fibonacci_series;

struct FibonacciSeries
{
    int current = 0;
    int next = 1;

    enum empty = false; // ← infinite range

    int front() const => current;

    // Generate next element of Fibbonacci series
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