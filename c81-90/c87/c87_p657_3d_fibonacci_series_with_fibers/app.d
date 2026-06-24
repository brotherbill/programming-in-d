import std.stdio   : writef;
import core.thread : Fiber;

void main()
{
	int current; // (1)
	
	Fiber fiber = new Fiber(() => fibonacciSeries(current));	// (4)

	foreach (_; 0 .. 10)
	{
		fiber.call(); 									// (5)
		
		import std.stdio;
		writef("%s ", current);
	}
}

// This is the fiber function that generates each element and
// then sets the 'ref' parameter to that element. 
void fibonacciSeries(ref int current)					// (1)
{ 
	current = 0; 	// Note that 'current' is the parameter
	int next = 1;
	while (true)
	{
		Fiber.yield(); 									// (2)

		// Next call() will continue from this point 	// (3)
		const nextNext = current + next;
		current = next;
		next = nextNext;
	}
}

// 1. The fiber function above takes a reference to an int.
//    It uses this parameter to communicate the current element to its caller.
//    (The parameter could be qualified as out instead of ref as well)
// 2. When the current element is ready for use, the fiber pauses itself by calling Fiber.yield().
// 3. A later call() will resume the function right after the fiber's last Fiber.yield() call.
//    (The first call() starts the function)
// 4. Because fiber functions do not take parameters, fibonacciSeries() cannot
//    be used directly as a fiber function. 
//    Instead, a parameter-less delegate (page 475) is used as an adaptor to be passed to the Fiber constructor.
// 5. The caller starts and resumes the fiber by its call() member function.