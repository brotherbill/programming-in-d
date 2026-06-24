import std.stdio : writeln;
import std.array : empty;
import std.range : front;

void main()
{
	assert(sum([1, 2, 3]) == 6);
}

int sum(int[] arr, int currentSum = 0)
{
	if (arr.empty)
	{
		// No element to add. The result is what has been calculated so far. 
		return currentSum;
	}

	// Add the front element to the current sum and call self with the remaining elements.
	return sum(arr[1 .. $], currentSum + arr.front);
}
