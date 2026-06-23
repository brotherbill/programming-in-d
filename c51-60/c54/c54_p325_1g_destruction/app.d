void main()
{
	auto c = new MyClass(3);
}

class MyClass
{
	int id;

	this(int id)
	{
		this.id = id;
	}

	~this()
	{
		auto c = new MyClass(666);  	// ← WRONG: Allocates explicitly in a class destructor.  May crash at run time.
		auto slice = [ 1 ];				// ← WRONG: Allocates explicitly in a class destructor.  May crash at run time.
	}
}
