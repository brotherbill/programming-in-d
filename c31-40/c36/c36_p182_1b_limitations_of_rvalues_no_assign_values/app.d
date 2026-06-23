void main()
{
	int a = 100;
	int b = 20;

	incrementByTen(a); 		// ← compiles
	incrementByTen(a + b); 	// ← compilation ERROR. Cannot pass rvalue to ref parameter.
}

void incrementByTen(ref int value)
{
	value += 10;
}
