import std.stdio  : writeln, writefln;
import std.string : format;
import std.conv   : to;

struct DoubleEndedQueue // Also known as Deque, pronounced "deck"
{
private:
	// The elements are represented as the chaining of the two member slices. 
	// However, 'head' is indexed in reverse so that the first element of the entire collection is head[$-1], 
	// the second one is head[$-2], etc.:
    //
 	// head[$-1], head[$-2], ... head[0], tail[0], ... tail[$-1]
	int[] head; // the first group of elements
	int[] tail; // the second group of elements

	// Determines the actual slice that the specified element resides in and returns it as a reference.
	ref inout(int) elementAt(size_t index) inout
	{
		return ((index < head.length) ? head[$ - 1 - index] : tail[index - head.length]);
	}

public:
	string toString() const
	{
		string result;

		foreach_reverse (element; head)
		{
			result ~= format("%s ", to!string(element));
		}

		foreach (element; tail)
		{
			result ~= format("%s ", to!string(element));
		}
		return result;
	}

	// Note: As we will see in the next chapter, the following is a simpler and more efficient implementation of toString(): 
	// version(none) does the following:
	//   1. Ensures block is syntactically valid.  That is, it can be parsed and be valid syntactically.
	//   2. Excludes block from compilation.
	//   For more information, see:  https://p0nce.github.com/d-idioms/#/+-+/-nestable-comments-and-version(none)
	version (none)
	{
		void toString(void delegate(const(char)[]) sink) const
		{
			import std.format : formattedWrite;
			import std.range  : chain;

			formattedWrite(sink, "%(%s %)", chain(head.retro, tail));
		}
	}

	// Adds a new element to the head of the collection.
	void insertAtHead(int value)
	{
		head ~= value;
	}

	// Adds a new element to the tail of the collection.
 	//
 	// Sample: deque ~= value
	ref DoubleEndedQueue opOpAssign(string op)(int value) if (op == "~")
	{
		tail ~= value;
		return this;
	}

	// Returns the specified element.
 	//
 	// Sample: deque[index]
	inout(int) opIndex(size_t index) inout
	{
		return elementAt(index);
	}

	// Applies a unary operation to the specified element.
 	//
 	// Sample: ++deque[index]
	int opIndexUnary(string op)(size_t index)
	{
		mixin("return " ~ op ~ "elementAt(index);");
	}

	// Assigns a value to the specified element.
	//
 	// Sample: deque[index] = value
	int opIndexAssign(int value, size_t index)
	{
		return elementAt(index) = value;
	}

	// Uses the specified element and a value in a binary
 	// operation and assigns the result back to the same element.
 	//
 	// Sample: deque[index] += values
	int opIndexOpAssign(string op)(int value, size_t index)
	{
		mixin("return elementAt(index) " ~ op ~ "= value;");
	}

	// Defines the $ character, which is the length of the collection.
 	//
 	// Sample: deque[$ - 1]
	size_t opDollar() const
	{
		return head.length + tail.length;
	}
}

void main()
{
	auto deque = DoubleEndedQueue();

	foreach (i; 0 .. 10)
	{
		if (i % 2)
		{
			deque.insertAtHead(i);
		}
		else
		{
			deque ~= i;
		}
	}

	writefln("Element at index 3: %s", deque[3]); 	// accessing an element
	++deque[4]; 									// incrementing an element
	deque[5] = 55; 									// assigning to an element
	deque[6] += 66; 								// adding to an element
	(deque ~= 100) ~= 200;							// adding to the tail twice, first 100, then 200
	writeln(deque);
}
