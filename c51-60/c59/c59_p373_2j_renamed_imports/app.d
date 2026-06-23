void main()
{
    import carnivore = animal.jaguar;
    import vehicle   = car.jaguar;

    auto myAnimal = new carnivore.Jaguar("Scarface");   // ← compiles
    auto myCar    = new vehicle.Jaguar("E-Type");       // ← compiles
}
