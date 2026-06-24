import std.stdio;

void main()
{
	auto object = new Sub;
	object.foo(); 			// Calls Sub's foo with no args
	object.foo(42); 		// Calls Super's foo with int arg via alias
	object.superFoo(999);	// Calls Super's foo directly via alias
}

class Super
{
	void foo(int x)
	{
		writeln("Super foo: ", x);
	}
}

class Sub : Super
{
	void foo()
	{
		writeln("Sub foo with no args");
	}

	alias foo      = Super.foo; // Bring Super's foo(int x) into scope, with function overloading
	alias superFoo = Super.foo; // Create an alias to call Super's foo directly
}
