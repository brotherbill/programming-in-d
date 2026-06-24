import std.stdio;

void main()
{
	moduleFunc();
}

struct ModuleStruct
{
	int i;

	void memberFunc()
	{
		writeln("ModuleStruct.memberFunc");
	}
}

void moduleFunc()
{
	struct NestedStruct
	{
		int i;

		void memberFunc()
		{
			writeln("NestedStruct.memberFunc");
		}
	}

	writefln("ModuleStruct: %s bytes, NestedStruct: %s bytes.", ModuleStruct.sizeof, NestedStruct
			.sizeof);
}
