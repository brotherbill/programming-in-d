import std.stdio : writeln;
import std.format : format;
import std.exception : enforce, assertThrown;
import core.exception : AssertError;

void main()
{
	auto slice = [1, 2, 3, 4, 5];
	writeln("untrustedMiddle([1, 2, 3, 4, 5], 3): ", untrustedMiddle(slice, 3));

	try 
	{
		writeln("untrustedMiddle([1, 2, 3, 4, 5], 100): ", untrustedMiddle(slice, 100));
	}
	catch (Exception e)
	{
		writeln("Caught exception: ", e.msg);
	}
}

// Trusted function: In development, we ensure that the precondition is always met before calling this function.  
//                   In Production,  we skip the precondition checks for performance.
inout(int)[] trustedMiddle(inout(int)[] originalSlice, size_t width)
in (width <= originalSlice.length, "width fits within originalSlice")
out (result)
{
	assert(result.length == width);
}
do
{
	immutable start = (originalSlice.length - width) / 2;
	immutable end = start + width;
	return originalSlice[start .. end];
}

// Untrusted function: Always checks the precondition before calling the trusted function.
inout(int)[] untrustedMiddle(inout(int)[] originalSlice, size_t width)
{
	// Enforce that width does not exceed the length of originalSlice.  Works in both debug and release modes.
	enforce(width <= originalSlice.length, format("width (%s) must not exceed the length (%s) of originalSlice", width, originalSlice.length));

	// Now that we've enforced the precondition, we can safely call the trusted function.
	return trustedMiddle(originalSlice, width);
}

unittest
{
	auto slice = [1, 2, 3, 4, 5];

	assert(trustedMiddle(slice, 3) == [2, 3, 4]);
	assert(trustedMiddle(slice, 2) == [2, 3]);
	assert(trustedMiddle(slice, 5) == slice);

	assertThrown!AssertError(trustedMiddle(slice, 6));
}
