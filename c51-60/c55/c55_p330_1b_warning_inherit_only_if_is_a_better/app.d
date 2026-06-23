import std.stdio : writefln;

void main()
{
	// auto deskClock = new Clock(3, 15, 59);   // Won't compile without on explicit constructor that takes 3 int parameters
	auto deskClock = new Clock; // Default constructor
	deskClock.adjust(3, 15, 59); // Manually set member values

	writefln("%02s:%02s:%02s", deskClock.hour, deskClock.minute, deskClock.second);
}

class Clock
{ 
	int     hour;
	int     minute;
	int     second;
	Battery battery;

	void adjust(int hour, int minute, int second = 0)
	{
		this.hour = hour;
		this.minute = minute;
		this.second = second;

		if (this.battery is null) 			// Check if battery is not initialized
		{
			this.battery = new Battery; 	 // Initialize the battery member
			this.battery.adjustVoltage(3.7); // Set the battery voltage
		}
	}
}

class Battery
{
	double voltage;

	void adjustVoltage(double voltage)
	{
		this.voltage = voltage;
	}	
}
