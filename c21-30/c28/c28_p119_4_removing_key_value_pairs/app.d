import std.stdio : writeln;

void main()
{
    // value[key]
    int[string] dayNumbers =
         //   key   : value
        [
            "Monday": 0, "Tuesday": 1, "Wednesday": 2, "Thursday": 3, "Friday": 4,
            "Saturday": 5, "Sunday": 6
        ];

    dayNumbers.remove("Tuesday");
    dayNumbers.remove("Tuesday");  // Removing a non-existing key does nothing
    // writeln(dayNumbers["Tuesday"]);		// ← run-time ERROR

    dayNumbers.clear;                       // Remove all elements

    // Best to check length to see if associative array is empty, rather than comparing to null.
    // Checking to see if an associative array is null only tells you if it has been allocated memory.

    // dayNumbers has no elements
    writeln("dayNumbers == null? ", dayNumbers == null);    // true, has no elements
    
    // dayNumbers has allocated memory, although no elements
    writeln("dayNumbers is null? ", dayNumbers is null);    // false, has allocated memory


    writeln("dayNumbers.length: ", dayNumbers.length);      // 0
    writeln;

    int[string] aNonInitializedDictionary;
    writeln("aNonInitializedDictionary is null? ", aNonInitializedDictionary is null); // true
    writeln("aNonInitializedDictionary == null? ", aNonInitializedDictionary == null); // true
    writeln("aNonInitializedDictionary.length: ",  aNonInitializedDictionary.length);  // 0
    writeln;

    int[string] aPopulatedDictionary;
    aPopulatedDictionary["Alpha"] = 1;
    writeln("aPopulatedDictionary is null? ", aPopulatedDictionary is null); // false
    writeln("aPopulatedDictionary == null? ", aPopulatedDictionary == null); // false
    writeln("aPopulatedDictionary.length: ",  aPopulatedDictionary.length);  // 0
    writeln;

    aPopulatedDictionary = null;
    writeln("aPopulatedDictionary = null;");
    writeln("aPopulatedDictionary is null? ", aPopulatedDictionary is null); // true
    writeln("aPopulatedDictionary == null? ", aPopulatedDictionary == null); // true
    writeln("aPopulatedDictionary.length: ",  aPopulatedDictionary.length);  // 0
}
