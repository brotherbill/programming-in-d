import std.stdio;

void main()
{
	auto object = new Sub;
	writeln("object.city: ", object.city);

	object.cityCode = 42;
	writeln("object.cityCode: ", object.cityCode);
}

class Super
{
	int city;
}

class Sub : Super
{
	alias cityCode = Super.city;

	string city() const
	{
		return "Kayseri";
	}
}
