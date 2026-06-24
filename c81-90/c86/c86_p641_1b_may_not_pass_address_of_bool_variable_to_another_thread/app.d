import std.concurrency;

void main()
{
	bool isDone = false;	// local variable belonging to main thread

	// Can't pass isDone's address to worker
	spawn(&worker, &isDone); // ← compilation ERROR
	// ...
	// Hoping to signal the worker to terminate:
	isDone = true;
	// ...
}

void worker(bool* isDone)
{
	while (!(*isDone))
	{
		// ...
	}
}
