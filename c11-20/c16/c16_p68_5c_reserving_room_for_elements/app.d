import std.stdio;

void main()
{
	int[] slice;
	writeln("initial slice.capacity: ", slice.capacity);

	slice.reserve(20);
	writeln("after reserve(20), slice.capacity: ", slice.capacity);

	foreach (element; 0 .. 17)
	{
		slice ~= element; // ← these elements will not be moved
	}

	writeln("slice", slice, ", length: ", slice.length, ", capacity: ", slice.capacity, ", slice.ptr: ", slice.ptr);
	writeln();

	writeln("slice.reserve(10); // this is ignored.  Use length instead");
	slice.reserve(10);
	writeln("slice", slice, ", length: ", slice.length, ", capacity: ", slice.capacity, ", slice.ptr: ", slice.ptr);
	writeln();

	writeln("slice.reserve(30); // This will reallocate the array");
	slice.reserve(30);
	writeln("slice", slice, ", length: ", slice.length, ", capacity: ", slice.capacity, ", slice.ptr: ", slice.ptr);
	writeln();

	writeln("int[] other = slice[0 .. $]; // create another slice to the same array");
	writeln("WARNING:  This happens to work, but it's not guaranteed.  Use a baseArray instead, and increase the capacity and length of the baseArray");
	writeln("WARNING:  See lesson 5b4 on slices in this chapter for more information about this.  This may not always work as expected.");
	int[] other = slice[0 .. $]; // create another slice to the same array
	other ~= 17;          
	other ~= 18;          
	other ~= [19, 20];               
	writeln("slice", slice, ",                 length: ", slice.length, ", capacity:  ", slice.capacity, ", slice.ptr: ", slice.ptr);
	writeln("other", other, ", length: ", other.length, ", capacity: ", other.capacity, ", other.ptr: ", other.ptr);
}
