module car;

class Car
{
    enum economy = 12.5; // kilometers per liter (average)
    private double fuelAmount; // liters

    this(double fuelAmount)
    {
        this.fuelAmount = fuelAmount;
    }

    double fuel() const
    {
        return fuelAmount;
    }
    // ...
}

bool canTravel(Car car, double distance)
{
    return (car.fuel() * car.economy) >= distance;
}
