import std.stdio : writeln;

void main() {
	Device device = new Device;
	device.manufacturer = "Calvin and Hobbes, Inc.";

	Clock clock = new Clock;
	clock.manufacturer = 84;	// 84 Lumber Company

	AlarmClock alarmClock = new AlarmClock;
	alarmClock.manufacturer = 'M';

	writeln("device    : ", device.manufacturer);
	writeln("clock     : ", clock.manufacturer);
	writeln("alarmClock: ", alarmClock.manufacturer);
	writeln;

	alarmClock.foo();
}

class Device {
	string manufacturer;
}

class Clock : Device {
	int manufacturer; 	// shadows Device.manufacturer
}

class AlarmClock : Clock {
	char manufacturer; 	// shadows Clock.manufacturer, but not Device.manufacturer

	void foo() {
		writeln("foo manufacturer before changes");
		writeln("       manufacturer: ", manufacturer);
		writeln("Device.manufacturer: ", Device.manufacturer);
		writeln(" Clock.manufacturer: ", Clock.manufacturer);
		writeln;

		manufacturer        = 'D';
		Device.manufacturer = "Lockheed Martin";
		Clock.manufacturer  = 8086;

		writeln("foo manufacturer after changes");
		writeln("       manufacturer: ", manufacturer);
		writeln("Device.manufacturer: ", Device.manufacturer);
		writeln(" Clock.manufacturer: ", Clock.manufacturer);
	}
}
