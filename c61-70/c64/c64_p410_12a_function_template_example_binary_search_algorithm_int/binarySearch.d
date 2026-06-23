// This function returns the index of the value if it exists in the array, size_t.max otherwise
size_t binarySearch(const int[] values, int value)
{
    // The value is not in the array if the array is empty.
    if (values.length == 0)
    {
        return size_t.max;
    }

    immutable midPoint = values.length / 2;
    if (value == values[midPoint])
    {
        // Found.
        return midPoint;
    }
    else if (value < values[midPoint])
    {
        // The value can only be in the left-hand side; let's search in a slice that represents that half
        return binarySearch(values[0 .. midPoint], value);
    }
    else
    {
        // The value can only be in the right-hand side; let's search in the right-hand side
        auto index = binarySearch(values[midPoint + 1 .. $], value);
        if (index != size_t.max)
        {
            // Adjust the index; it is 0-based in the right-hand side slice
            index += midPoint + 1;
        }
        return index;
    }

    assert(false, "We should have never gotten to this line");
}

unittest
{
    auto array = [1, 2, 3, 5];
    assert(binarySearch(array, 0) == size_t.max);
    assert(binarySearch(array, 1) == 0);
    assert(binarySearch(array, 4) == size_t.max);
    assert(binarySearch(array, 5) == 3);
    assert(binarySearch(array, 6) == size_t.max);
}
