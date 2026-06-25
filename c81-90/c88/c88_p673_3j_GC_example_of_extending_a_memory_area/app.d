import std.stdio     : writeln, writefln;
import core.memory   : GC;
import std.exception : enforce;

void main()
{
	auto myArray = Array!int();
	writeln("myArray: ", myArray);
}

struct Array(T)
{
	T*     buffer; 		// Memory area that holds the elements
	size_t capacity; 	// The element capacity of the buffer
	size_t length; 		// The number of actual elements

	// Returns the specified element
	T element(size_t index)
	{
		import std.string;

		enforce(index < length,
			format("Invalid index %s", index));
		return *(buffer + index);
	}

	// Appends the element to the end 
	void append(T element)
	{
		writefln("Appending element %s", length);
		if (length == capacity)
		{
			// There is no room for the new element; must increase capacity.
			size_t newCapacity = capacity + (capacity / 2) + 1;
			increaseCapacity(newCapacity);
		}

		// Place the element at the end
		*(buffer + length) = element;
		++length;
	}

	void increaseCapacity(size_t newCapacity)
	{
		writefln("Increasing capacity from %s to %s", capacity, newCapacity);
		size_t oldBufferSize = capacity * T.sizeof;
		size_t newBufferSize = newCapacity * T.sizeof;

		// Also specify that this memory block should not be scanned for pointers.
		buffer = cast(T*) reallocCleared(
			buffer, oldBufferSize, newBufferSize,
			GC.BlkAttr.NO_SCAN);
		capacity = newCapacity;
	}
}

// Works like GC.realloc but clears the extra bytes if memory is extended.
void* reallocCleared(
    void*  buffer,
    size_t oldLength,
    size_t newLength,
    GC.BlkAttr blockAttributes = GC.BlkAttr.NONE,
    const TypeInfo typeInfo = null)
{
    // Dispatch the actual work to GC.realloc
    buffer = GC.realloc(buffer, newLength, blockAttributes, typeInfo);

    // Clear the extra bytes if extended
    if (newLength > oldLength)
    {
        import core.stdc.string;

        auto extendedPart = buffer + oldLength;
        const extendedLength = newLength - oldLength;

        memset(extendedPart, 0, extendedLength);
    }

    return buffer;
}
