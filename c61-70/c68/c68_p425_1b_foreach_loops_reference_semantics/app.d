import std.stdio;

void main()
{
    int[] numbers = [1, 11, 111];
    writeln("Before the loop, numbers : ", numbers);

    foreach (ref number; numbers)
    {
        writeln("ref number: ", number, ", numbers: ", numbers);

        number = 0; // ← the copy changes, not the element
    }

    writeln("After the loop, numbers : ", numbers);
}
