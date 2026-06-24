void main()
{
	mixin("int i;");
	mixin("int i;"); // ← compilation ERROR
	i = 42;
}
