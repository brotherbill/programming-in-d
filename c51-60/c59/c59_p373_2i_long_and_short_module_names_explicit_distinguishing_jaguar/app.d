void main()
{
	import animal.jaguar;
	import car.jaguar;

	auto myAnimal = new animal.jaguar.Jaguar("Scarface"); 	// ← compiles
	auto myCar    = new car.jaguar.Jaguar("E-Type"); 		// ← compiles
}
