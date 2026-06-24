import std.stdio;

void main()
{
	auto pen = new Pen;
	auto otherPen = pen; // ← Now both variables provide access to the same object

	writefln("Before: %s %s", pen.ink, otherPen.ink);

	pen.use(1); // ← the same object is used
	writefln("After pen.use(1) : %s %s", pen.ink, otherPen.ink);

	otherPen.use(2); // ← the same object is used

	writefln("After pen.use(2) : %s %s", pen.ink, otherPen.ink);
}

class Pen
{
	double ink;

	this()
	{
		ink = 15;
	}

	void use(double amount)
	{
		ink -= amount;
	}
}
