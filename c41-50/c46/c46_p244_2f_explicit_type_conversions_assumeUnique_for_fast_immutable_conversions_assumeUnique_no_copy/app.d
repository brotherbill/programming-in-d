import std.stdio : writeln;
import std.exception : assumeUnique;

void main()
{
    int[] numbers;
    numbers ~= 10;
    // ... various other modifications ...
    numbers[0] = 42;

    // Mischief!  creates a mischief_slice referencing numbers, which is mutable, sharing access with immutableNumbers.
    // This allows modification of immutableNumbers through mischief_slice, violating immutability.
    // File this under: The compiler trusts you to not have any active aliases to the data when you call assumeUnique.
    // We have violated that trust here.
    // Use 'assumeUnique' with care.  In a code review, code with assumeUnique needs "certainty" that no backdoor aliases to numbers exist.
    int[] mischief = numbers[0 .. $];  
    mischief[0] = 86;
    writeln(__LINE__, " mischief         slice first element: ", mischief[0]); // outputs 86

    immutable(int []) immutableNumbers = assumeUnique(numbers); // no duplicates, numbers is null'ed out
    writeln(__LINE__, " immutableNumbers slice first element: ", immutableNumbers[0]); // outputs 86
    assert(numbers is null);
    assert(immutableNumbers.length == 1);
    assert(immutableNumbers[0] == 86);
    calculate(immutableNumbers); // ← now compiles
    writeln;

    // Next two lines demonstrate mischief.  Comment these out as well as lines 16 and 17 to remove mischief.
    mischief[0] = 99;                         // mutating an immutable slice!
    writeln(__LINE__, " mischief         slice first element: ", mischief[0]); // outputs 86

    assert(immutableNumbers[0] == 99);        // Immunity guarantee is broken!
    writeln(__LINE__, " immutableNumbers slice first element: ", immutableNumbers[0]); // outputs 99
}

void calculate(immutable(int[]) coordinates)
{
    // ...
}
