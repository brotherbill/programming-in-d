module my_class;

import std.stdio;
import iface;

class MyClass : Iface
{
    int[] func(int[] a, int[] b)
    in
    {
        writeln("Class.func.in");

        // This class member function loosens the ancestor's preconditions by allowing parameters with unequal lengths as long as at least one of them is empty
        assert((a.length == b.length) || (a.length == 0) || (b.length == 0));
    }
    out (result)
    {
        writeln("Class.func.out");

        // This class member function provides additional guarantees: 
        //   the result will not be empty and that the first and the last elements will be equal. */
        assert((result.length != 0) && (result[0] == result[$ - 1]));
    }
    do
    {
        writeln("Class.func.do");

        // This is just an artificial implementation to demonstrate how the 'in' and 'out' blocks are executed
        int[] result;

        if (a.length == 0)
        {
            a = b;
        }

        if (b.length == 0)
        {
            b = a;
        }

        foreach (i; 0 .. a.length)
        {
            result ~= a[i];
            result ~= b[i];
        }

        result[0] = result[$ - 1] = 42;

        return result;
    }
}
