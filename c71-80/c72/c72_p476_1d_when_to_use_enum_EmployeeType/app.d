import std.stdio;

void main()
{
	EmployeeType empType = EmployeeType.fullTime;
	final switch (empType)
	{
	case EmployeeType.fullTime:
		fullTimeEmployeeWages;
		break;
	case EmployeeType.hourly:
		hourlyEmployeeWages;
		break;
	}
}

enum EmployeeType
{
	fullTime,
	hourly,
}

void fullTimeEmployeeWages()
{
	writeln("Calculating full-time employee wages.");
}

void hourlyEmployeeWages()
{
	writeln("Calculating hourly employee wages.");
}
