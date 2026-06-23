import std.stdio : writefln;

void main()
{
	int first;
	int second;

	distribute(123, /* out */ first, /* out */ second);
	writefln("sum: %s, first: %s, second: %s", 123, first, second);
}

// Distributes the sum between two variables.
//
// Distributes min(sum, 7) to the first variable. 
// The rest of the sum is distributed to the second variable. 
void distribute(int sum, out int first, out int second)
in
{
	assert(0 <= sum, "sum must be zero or greater");
}
out
{
	assert(0 <= first  && first  <= 7, "first must be between 0 and 7");
	assert(0 <= second && second <= sum, "second must be zero or greater and be no larger than sum");
	assert(sum == (first + second));
	assert((sum <= 7).implies(first == sum && second == 0), "if sum is less than or equal to 7, first is sum and second must be 0");
	assert((8 <= sum).implies(first == 7 && 0 < second && second == sum - first), "if sum is 8 or more, first must be 7 and second is positive and second must be sum - first");
}
do
{
	first = (7 <= sum) ? 7 : sum;
	second = sum - first;
}

bool implies(bool a, bool b)
{
	return !a || b;
}

unittest
{
	int first;
	int second;

	// Both must be 0 if the sum is 0
	distribute(0, first, second);

	assert(first  == 0, "first must be 0 when sum is 0");
	assert(second == 0, "second must be 0 when sum is 0");

	// If the sum is less than 7, then all of it must be given to first
	distribute(3, first, second);
	assert(first  == 3, "first must be equal to sum when sum is less than 7");
	assert(second == 0, "second must be 0 when sum is less than 7");

	// Testing a boundary condition
	distribute(7, first, second);
	assert(first  == 7, "first must be equal to sum when sum is 7");
	assert(second == 0, "second must be 0 when sum is 7");

	// If the sum is more than 7, then the first must get 7 and the rest must be given to second
	distribute(8, first, second);
	assert(first  == 7, "first must be 7 when sum is more than 7");
	assert(second == 1, "second must be sum - 7 when sum is more than 7");

	// A random large value
	distribute(1_000_007, first, second);
	assert(first  == 7, "first must be 7 when sum is more than 7");
	assert(second == 1_000_000, "second must be sum - 7 when sum is more than 7");
}
