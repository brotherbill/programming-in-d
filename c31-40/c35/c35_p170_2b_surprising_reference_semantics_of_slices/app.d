import std.stdio : writeln, writefln;

void main()
{
	appendZeroTester;
	appendZeroRefTester;
}

void appendZeroTester() {
	writeln("=== Testing appendZero() with copy semantics ===");

	auto originalSlice = [1, 2];
	writefln("Type of originalSlice: %s", typeof(originalSlice).stringof);
	writeln("           &originalSlice before appendZero(): ", &originalSlice);
	writeln("length   of originalSlice before appendZero(): ", originalSlice.length);
	writeln("capacity of originalSlice before appendZero(): ", originalSlice.capacity);
	writeln("ptr      of originalSlice before appendZero(): ", originalSlice.ptr);
	writeln;

	appendZero(originalSlice);
	writeln;

	writeln("--- after appendZero() returns ---");
	writeln("length   of originalSlice after: ", originalSlice.length);
	writeln("capacity of originalSlice after: ", originalSlice.capacity);
	writeln("ptr      of originalSlice after: ", originalSlice.ptr);
	writefln("            originalSlice is   : %s", originalSlice);
	writeln;
}

void appendZeroRefTester() {
	writeln("=== Testing appendZeroRef() with reference semantics ===");

	auto originalSlice = [1, 2];
	writefln("Type of originalSlice: %s", typeof(originalSlice).stringof);
	writeln("&originalSlice            before appendZeroRef(): ", &originalSlice);
	writeln("length   of originalSlice before appendZeroRef(): ", originalSlice.length);
	writeln("capacity of originalSlice before appendZeroRef(): ", originalSlice.capacity);
	writeln("ptr      of originalSlice before appendZeroRef(): ", originalSlice.ptr);
	writeln;

	appendZeroRef(/+ ref +/ originalSlice);
	writeln;

	writeln("--- after appendZeroRef() returns ---");
	writeln("length   of originalSlice after: ", originalSlice.length);
	writeln("capacity of originalSlice after: ", originalSlice.capacity);
	writeln("ptr      of originalSlice after: ", originalSlice.ptr);
	writefln("originalSlice is : %s", originalSlice);
	writeln;
}

void appendZero(int[] a_slice_copy)
{
	writeln("--- appendZero() called ---");

	// Copy semantics: a_slice_copy is a copy of the slice reference
	writeln("           &a_slice_copy before: ", &a_slice_copy);
	writeln("length   of a_slice_copy before: ", a_slice_copy.length);
	writeln("capacity of a_slice_copy before: ", a_slice_copy.capacity);
	writeln("ptr      of a_slice_copy before: ", a_slice_copy.ptr);
	writeln;

	writeln("--- appending 0 to a_slice_copy ---");
	a_slice_copy ~= 0;
	writeln("           &a_slice_copy after: ", &a_slice_copy);
	writeln("length   of a_slice_copy after: ", a_slice_copy.length);
	writeln("capacity of a_slice_copy after: ", a_slice_copy.capacity);
	writeln;

	writefln("Inside appendZero() a_slice_copy is: %s", a_slice_copy);
}

void appendZeroRef(ref int[] a_slice_ref)
{
	writeln("--- appendZeroRef() called ---");

	// Reference semantics: a_slice_ref is a reference to the original slice
	writeln("           &a_slice_ref before: ", &a_slice_ref);
	writeln("length   of a_slice_ref before: ", a_slice_ref.length);
	writeln("capacity of a_slice_ref before: ", a_slice_ref.capacity);
	writeln("ptr      of a_slice_ref before: ", a_slice_ref.ptr);
	writeln;

	writeln("--- appending 0 to a_slice_ref ---");
	a_slice_ref ~= 0;
	writeln("           &a_slice_ref after : ", &a_slice_ref);
	writeln("length   of a_slice_ref after: ", a_slice_ref.length);
	writeln("capacity of a_slice_ref after: ", a_slice_ref.capacity);
	writeln;

	writefln("Inside appendZeroRef() a_slice_ref is: %s", a_slice_ref);
}
