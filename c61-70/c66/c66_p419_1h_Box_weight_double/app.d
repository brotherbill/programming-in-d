import std.stdio;
import box;

void main()
{
	Box box1 = new Box(10.5);
	Box box2 = new Box(20.0);
	Box box3 = new Box(15.75);

	Box[] boxes = [box1, box2, box3];

	double totalWeight = 0.0;

	foreach (box; boxes)
	{
		totalWeight += box.weight();
	}

	writeln("Total weight of all boxes: ", totalWeight);
}
