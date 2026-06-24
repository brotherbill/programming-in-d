import std.stdio;

void main()
{
	Class c = new Class();
	c.foo();
	c.bar();
}

class Class
{
	void foo()
	{
		synchronized (this)
		{
			writeln("In foo");
		}
	}

	void bar()
	{
		synchronized (this)
		{
			writeln("In bar");
		}
	}
}
