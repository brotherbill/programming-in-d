void main()
{
	mixin Templatize!("int i;") A; // Defines A.i
	mixin Templatize!("int i;") B; // Defines B.i

	A.i = 42; // ← not ambiguous anymore
}

template Templatize(string str)
{
	mixin(str);
}
