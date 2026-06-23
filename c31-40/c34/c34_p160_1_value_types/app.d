import std.stdio : writeln;

void main()
{
	int speed    = 123;
	int newSpeed = speed;

	writeln("speed   : ", speed,    " address: ", &speed);
	writeln("newSpeed: ", newSpeed, " address: ", &newSpeed);
	writeln;

	assert(speed == newSpeed);
	speed = 200;
	assert(speed != newSpeed);

	writeln("speed   : ", speed,    " address: ", &speed);
	writeln("newSpeed: ", newSpeed, " address: ", &newSpeed);
}
