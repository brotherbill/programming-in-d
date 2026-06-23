import std.stdio : writeln;

void main() {
	auto counter = Counter(count: 42);
	writeln("counter(42): ", counter.count);
	
	counter.incrementBy(100);
	writeln("after incrementBy(100): ", counter.count);
}

struct Counter {
	int count;
	private int oldCount;
	private int oldIncrement;

	void incrementBy(in int increment)
	in {
		assert (increment >= 0, "increment must be non-negative");
		writeln("Preconditions checked.");
	}
	out {
		assert(count == oldCount + oldIncrement, "count = old count + old increment");
		writeln("Postconditions checked.");
	}
	do {
		// Capture 'old' parameters and members
		oldIncrement = increment;
		oldCount     = count;

		// body
		count += increment;
	}
}
