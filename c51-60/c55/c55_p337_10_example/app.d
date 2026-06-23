import std.stdio     : writeln, writefln;
import std.exception : enforce;

void main() 
{
	auto locomotive = new Locomotive;
	auto train      = new Train(locomotive);

	train.addCar(new PassengerCar, new FreightCar);
	
	train.departStation("Ankara");
	train.advance(500);
	train.arriveStation("Haydarpaşa");
}

abstract class RailwayVehicle 
{
	void advance(size_t kilometers) 
	{
		writefln("The vehicle is advancing %s kilometers", kilometers);
	}
}

class Locomotive : RailwayVehicle 
{
}

abstract class RailwayCar : RailwayVehicle 
{
	abstract void load();		// No implementation, subclasses must provide one
	abstract void unload();		// No implementation, subclasses must provide one
}

class PassengerCar : RailwayCar 
{
	override void load() 
	{
		writeln("The passengers are getting on");
	}

	override void unload() 
	{
		writeln("The passengers are getting off");
	}
}

class FreightCar : RailwayCar 
{
	override void load() 
	{
		writeln("The crates are being loaded");
	}

	override void unload() 
	{
		writeln("The crates are being unloaded");
	}
}

class Train : RailwayVehicle 
{
	Locomotive locomotive; 	// A Train "has-a" locomotive  (Some trains have more than one locomotive, but not in this model)
	RailwayCar[] cars; 		// and zero or more cars
	// ...
	this(Locomotive locomotive) 
	{
		enforce(locomotive !is null, "Locomotive cannot be null");
		this.locomotive = locomotive;
	}

	void addCar(RailwayCar[] cars...) 
	{
		this.cars ~= cars;
	}
	// ...

	void departStation(string station) 
	{
		foreach (car; cars) 
		{
			car.load();
		}

		writefln("Departing from %s station", station);
	}

	void arriveStation(string station) 
	{
		writefln("Arriving at %s station", station);

		foreach (car; cars) {
			car.unload();
		}
	}
}
