import std.stdio     : writeln;
import std.string    : format;
import std.exception : enforce;

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

	writeln(__LINE__, " ", deque);

	deque[] *= 10;
	writeln(__LINE__, " ", deque);

	writeln(__LINE__, " ", deque[0..5]);
	writeln(__LINE__, " ", deque[5..$]);
	writeln(__LINE__, " ", deque[1..3]);
	writeln(__LINE__, " ", deque[6..9]);
	writeln(__LINE__, " ", deque[3..8]);
	
	deque[3 .. 8] = -1;
	writeln(__LINE__, " ", deque);
}

struct DoubleEndedQueue
{
	int[] head;
	int[] tail;

	void insertAtHead(int i) {
		head = i ~ head;
	}

	DoubleEndedQueue opBinary(string op: "~")(int other) const {
		this.tail ~= other;
		return DoubleEndedQueue(head, tail);
	}

	/* Defines the $ character, which is the length of the  collection.
	 *
	 * Sample: deque[$ - 1]
	 */
	size_t opDollar() const {
		return head.length + tail.length;
	}	

	ref DoubleEndedQueue opOpAssign(string op)(auto ref const int rhs) if (op == "~")
	{
		tail ~= rhs;
		return this;
	}

	// Returns a range that represents all of the elements.
 	// ('Range' struct is defined below.)
 	//
 	// Sample: deque[]
 	inout(Range) opSlice() inout
	{
		return inout(Range) (head[], tail[]);
	}

	// Returns a range that represents some of the elements.
 	//
 	// Sample: deque[begin .. end]
	inout(Range) opSlice(size_t begin, size_t end) inout
	{
		enforce(end <= opDollar);
		enforce(begin <= end);

		// Determine what parts of 'head' and 'tail' correspond to the specified range: 
		if (begin < head.length)
		{
			if (end < head.length)
			{
				// The range is completely inside 'head'. 
				return inout(Range)(
					head[$ - end .. $ - begin]);
			}
			else
			{
				// Some part of the range is inside 'head' and the rest is inside 'tail'. 
				return inout(Range)(
					head[0 .. $ - begin],
					tail[0 .. end - head.length]);
			}
		}
		else
		{
			// The range is completely inside 'tail'. 
			return inout(Range)(
				tail[begin - head.length .. end - head.length]);
		}
	}

	string toString() 
	{
		string result = "[";

		foreach_reverse(item; head) 
		{
			result ~= format("%d, ", item);
		}

		foreach(item; tail) 
		{
			result ~= format("%d, ", item);
		}

		// strip trailing comma and space, if any
		if (result.length > 1)
		{
			result = result[0 .. $ - 2];
		}

		result ~= "]";
		return result;
	}

	// Represents a range of elements of the collection. 
	// This struct is responsible for defining the opUnary, opAssign, and opOpAssign operators.
	struct Range
	{
		int[] headRange; // elements that are in 'head'
		int[] tailRange; // elements that are in 'tail'

		// Applies the unary operation to the elements of the range. 
		Range opUnary(string op)()
		{
			mixin(op ~ "headRange[];");
			mixin(op ~ "tailRange[];");
			return this;
		}

		// Assigns the specified value to each element of the range.
		Range opAssign(int value)
		{
			headRange[] = value;
			tailRange[] = value;
			return this;
		}

		// Uses each element and a value in a binary operation
 		// and assigns the result back to that element. 
		Range opOpAssign(string op)(int value)
		{
			mixin("headRange[] " ~ op ~ "= value;");
			mixin("tailRange[] " ~ op ~ "= value;");
			return this;
		}
	}
}
