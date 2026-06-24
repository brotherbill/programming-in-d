import std.stdio;

void main()
{
	foreach (element; NumberRange(3, 7))
	{
		write(element, ' ');
	}
	writeln;
}

struct NumberRange
{
	int begin;
	int end;

	//    					   (2)       (1)
	int opApply(int delegate(ref int) operations) const
	{
		int result = 0;

		for (int number = begin; number != end; ++number)			// (4)
		{ 
			// writeln("number: ", number);
			// This is where we pass back the item using (ref int)
			result = operations(number); 							// (1)
			// writeln("result: ", result);

			if (result)
			{
				break; 												// (3)
			}
		}

		// writeln("final result: ", result);
		return result; 												// (5)
	}
	// 1. The body of the foreach loop becomes the body of the delegate.
	//    opApply must call this delegate for each iteration.
	// 2. The loop variables become the parameters of the delegate.
	//    opApply must define these parameters as ref.
	// 3. The return type of the delegate is int.  0 means continue, non-zero means terminate loop
	// 4. The actual iteration happens inside opApply().
	// 5. opApply() must return the same value that is returned by the delegate
}
