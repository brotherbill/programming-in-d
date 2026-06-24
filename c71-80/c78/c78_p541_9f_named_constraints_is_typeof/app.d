import std.stdio;

void main()
{
}

void use(T)(T object)
		if (is(typeof(object.prepare())) &&
		is(typeof(object.fly(1))) &&
		is(typeof(object.land())))
{
	// ...
	object.prepare();
	// ...
	object.fly(42);
	// ...
	object.land();
	// ...
}
