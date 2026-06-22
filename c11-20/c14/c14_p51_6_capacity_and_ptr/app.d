import std.stdio : writeln, writefln;
import std.format : format;

void main()
{
	int[] goldBarIds;

	writefln("goldBarIds                  length: %2s, capacity: %2s, &goldBarIds: %s, goldBarIds.ptr: %s", 
				goldBarIds.length, goldBarIds.capacity, &goldBarIds, goldBarIds.ptr);
	writeln();

	foreach (id; 1 .. 21)	// Loop from 1 to 20 (inclusive)
	{
		goldBarIds ~= id;
		writefln("Added gold bar with ID: %2s, length: %2s, capacity: %2s, &goldBarIds: %s, &goldBarIds[0]: %s, goldBarIds.ptr: %s", 
				id, goldBarIds.length, goldBarIds.capacity, &goldBarIds, &goldBarIds[0], goldBarIds.ptr);
		assert(goldBarIds.ptr == &goldBarIds[0], format("%s: %s", id, "Pointer mismatch detected!"));
	}
}
