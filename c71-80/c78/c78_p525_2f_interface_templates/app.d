import std.stdio;

void main()
{
	PageFrame pageFrame = new PageFrame;
	pageFrame.paint(RGB(10, 20, 30));

	Bulb bulb = new Bulb;
	bulb.paint(3.14159);
}

interface ColoredObject(ColorT)
{
	void paint(ColorT color);
}

struct RGB
{
	ubyte red;
	ubyte green;
	ubyte blue;
}

class PageFrame : ColoredObject!RGB
{
	void paint(RGB color)
	{
		writeln(color);
	}
}

alias Frequency = double;

class Bulb : ColoredObject!Frequency
{
	void paint(Frequency color)
	{
		writeln(color);
	}
}
