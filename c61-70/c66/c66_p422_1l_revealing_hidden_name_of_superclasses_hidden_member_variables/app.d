import std.stdio;

void main()
{
	auto object = new Sub;
	object.city = 42; 	// ← compilation ERROR
}

class Super
{
	int city;
}

class Sub : Super
{
	string city() const
	{
		return "Kayseri";
	}
}
