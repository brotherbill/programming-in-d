import std.stdio;

void main()
{
	func(42);
	writeln;
	func2(42);
}

void func2(int parameter,
	string functionName = __FUNCTION__,
	string file = __FILE__,
	int line = __LINE__)
{
	writefln("Called from function %s at file %s, line %s.", functionName, file, line);
	writeln;
	writeln;
}

void func(int parameter)
{
	writefln("Inside function %s at file %s, line %s.",
		__FUNCTION__, __FILE__, __LINE__);
	writeln;
	writeln("__MODULE__         : ", __MODULE__);
	writeln("__FILE__           : ", __FILE__);
	writeln("__FILE_FULL_PATH__ : ", __FILE_FULL_PATH__);
	writeln("__LINE__           : ", __LINE__);
	writeln("__FUNCTION__       : ", __FUNCTION__);
	writeln("__PRETTY_FUNCTION__: ", __PRETTY_FUNCTION__);
	writeln;

	writeln("__DATE__     : ", __DATE__);
	writeln("__TIME__     : ", __TIME__);
	writeln("__TIMESTAMP__: ", __TIMESTAMP__);
	writeln("__VENDOR__   : ", __VENDOR__);
	writeln("__VERSION__  : ", __VERSION__);
}
