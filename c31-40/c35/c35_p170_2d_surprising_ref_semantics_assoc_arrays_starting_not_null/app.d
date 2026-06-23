import std.stdio : writefln;
import std.range : empty;
    
void main()
{
    int[string] aa = emptyMapFactory;
    assert(aa !is null && aa.length == 0 && aa.empty);

    appendElement(aa);
    writefln("After appendElement() returns: %s", aa);
}

void appendElement(int[string] aa)
{
    aa["red"] = 100;
    writefln("Inside appendElement()       : %s", aa);
}

// TODO: Convert to using Templates when we get to that chapter
int[string] emptyMapFactory() 
{
    int[string] map;  // ← null to begin with
    assert(map is null && map.length == 0 && map.empty);

    map[string.init] = int.init; // Add a dummy element.  Same as map[""] = 0;
    assert(map[""] == 0);        // Verify the dummy element exists
    
    map.clear;                   // Clear all elements, now map is empty but not null
    assert(map !is null && map.length == 0 && map.empty);

    return map;       // Return the non-null empty map
}
