import std.stdio;

void main()
{
    MyClass variable = new MyClass;
    MyClass variable2 = new MyClass;
    int age = 21;
    int[] sliceA = [10, 20, 30, 40, 50];
    int[] sliceB = sliceA[1 .. $];

    if (variable !is null)
    {
        writeln(__LINE__, " variable is not null.");
    }

    // This always evaluates to true since variable and variable2 reference different objects.
    // The is operator cannot be overloaded, so it always checks for reference equality.
    if (variable !is variable2)
    {
        writeln(__LINE__, " variable and variable2 reference different objects.");
    }
    else
    {
        writeln(__LINE__, " variable and variable2 reference the same object.");
    }

    // This is not the correct way to check for reference inequality as != may be overloaded to check for value inequality.
    // As operator != has not been overloaded in this case, it behaves the same as '!is'.
    if (variable != variable2)
    {
        writeln(__LINE__, " variable and variable2 reference different objects.");
    }
    else
    {
        writeln(__LINE__, " variable and variable2 reference the same object.");
    }

    // This works for value types, but it is better to use '!=' for clarity.
    if (age !is 30)
    {
        writeln(__LINE__, " age is not 30");
    }

    // Better to use '!=' for value types
    if (age != 30)
    {
        writeln(__LINE__, " age is not 30 (using !=)");
    }

    if (sliceA !is sliceB)
    {
        writeln(__LINE__, " sliceA and sliceB reference different slices");
    }
}

class MyClass
{
    int member;
}
