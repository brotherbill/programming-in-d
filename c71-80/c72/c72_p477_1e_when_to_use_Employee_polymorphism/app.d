import std.stdio;

void main()
{
	// Using polymorphism to handle different employee types
	auto fullTimeEmployee = new FullTimeEmployee();
	writeln("Full-time employee wages: ", fullTimeEmployee.wages());

	auto hourlyEmployee = new HourlyEmployee();
	writeln("Hourly employee wages: ", hourlyEmployee.wages());
}

interface Employee
{
	double wages();
}

class FullTimeEmployee : Employee
{
	double wages()
	{
		double result = 63.20 * 40;
		// ...
		return result;
	}
}

class HourlyEmployee : Employee
{
	double wages()
	{
		double result = 7.25 * 20;
		// ...
		return result;
	}
}
