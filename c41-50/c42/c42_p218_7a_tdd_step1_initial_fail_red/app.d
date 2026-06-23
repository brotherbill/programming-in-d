void main()
{
}

string ordinal(size_t number)
{
	return ""; 	// ← intentionally wrong.  Our goal is to get this to compile as a starting point.
}

unittest
{
	assert(ordinal(1)  == "1st");
	assert(ordinal(2)  == "2nd");
	assert(ordinal(3)  == "3rd");
	assert(ordinal(10) == "10th");
}
