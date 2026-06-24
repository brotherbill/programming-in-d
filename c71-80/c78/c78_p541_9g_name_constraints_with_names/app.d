import std.stdio;

void main()
{
	use(new ModelAirplane); // ← compiles
	// use(new Pigeon);			// ← compilation ERROR
}

void use(T)(T object) if (canFlyAndLand!T)
{
	// ...
	object.prepare();
	// ...
	object.fly(42);
	// ...
	object.land();
	// ...
}

template canFlyAndLand(T)
{
	enum canFlyAndLand = is(typeof(
	{
		T object;
		object.prepare(); // should be preparable for flight
		object.fly(1); // should be flyable for a certain distance
		object.land(); // should be landable
	}()));
}

// A type that does match the template's operations
class ModelAirplane
{
	void prepare()
	{
		writeln("ModelAirplane preparing for flight.");
	}

	void fly(int distance)
	{
		writeln("Model Airplane flying ", distance, " miles.");
	}

	void land()
	{
		writeln("ModelAirplane landing.");
	}
}

// A type that does not match the template's operations
class Pigeon
{
	void fly(int distance)
	{
		writeln("Pigeon flying ", distance, " miles.");
	}
}
