void main()
{
	immutable array = makeNumbers();
}

int[] makeNumbers() pure
{
	int[] result;
	result ~= 42;
	return result;
}
