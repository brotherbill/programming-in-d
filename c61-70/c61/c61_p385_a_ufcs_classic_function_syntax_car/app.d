import std.stdio;
import car;

void main()
{
	auto car = new Car(5);

	auto remainingFuel = car.fuel(); // Member function syntax

	if (canTravel(car, 100))		 // Regular function syntax
	{ 
		// ...
	}
}
