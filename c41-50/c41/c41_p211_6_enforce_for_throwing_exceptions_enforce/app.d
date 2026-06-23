import std.exception : enforce;
import std.format : format;

void main()
{
	int count = 2;

	// Traditional way using throw
	// if (count < 3) 
	// {
	//    throw new Exception(format("count of %s must be at least 3", count));
	// }

	// Using enforce for precondition checking in both development and production
	enforce(count >= 3, format("count of %s must be at least 3", count));
}
