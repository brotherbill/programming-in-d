module iface;

import std.stdio;

interface Iface {
    int[] func(int[] a, int[] b)
    in {
        writeln("Iface.func.in");

        // This interface member function requires that the lengths of the two parameters are equal
        assert(a.length == b.length);
    }
    out (result) {
        writeln("Iface.func.out");

        // This interface member function guarantees that the result will have even number of elements
        // (Note that an empty slice is considered to have even number of elements) 
        assert((result.length % 2) == 0);
    }
}
