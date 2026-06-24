import std.stdio;

void main()
{
	outerFunc(42);

	auto a = NestedStruct(); 			// ← compilation ERROR
	auto b = outerFunc.NestedStruct(); 	// ← compilation ERROR
}

void outerFunc(int parameter)
{
	int local;

	void nestedFunc()
	{
		writeln("nestedFunc local before: ", local, ", &local: ", &local);
		local = parameter * 2;
		writeln("nestedFunc local after : ", local, ", &local: ", &local);
	}

	struct NestedStruct
	{
		void memberFunc()
		{
			writeln("NestedStruct.memberFunc local before: ", local, ", &local: ", &local);
			local /= parameter;
			writeln("NestedStruct.memberFunc local after : ", local, ", &local: ", &local);
		}
	}

	class NestedClass
	{
		void memberFunc()
		{
			writeln("NestedClass.memberFunc local before: ", local, ", &local: ", &local);
			local += parameter;
			writeln("NestedClass.memberFunc local after: ", local, ", &local: ", &local);
		}
	}

	// Using the nested definitions inside this scope:
	nestedFunc();

	auto s = NestedStruct();
	s.memberFunc();

	auto c = new NestedClass();
	c.memberFunc();

	writeln("Finally, local: ", local, ", &local: ", &local);
}
