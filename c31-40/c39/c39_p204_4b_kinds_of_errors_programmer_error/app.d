void main()
{
	// Sleepy programmer made a mistake here
	processMenuSelection(-1);
}

void processMenuSelection(int selection)
{
	// Ensure selection is valid.  This is called a "guard clause".
	assert(selection >= 0);
	// ...
}
