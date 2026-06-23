import std.stdio : write, writeln, writef, writefln, File, stderr;

void main() {
	auto file = File("a_file.txt", "w");  // No checking for errors to keep code small

    info(stderr, 1.2);
    writeln;
    info(stderr, 3);
    writeln;
    info(stderr, "hello");
    writeln;
    writeln;

    auto breakfastTime = TimeOfDay(7, 0);
    info(stderr, breakfastTime);
    writeln;

    auto bikeRideMeeting = Meeting("Bike Ride", 3, TimeOfDay(9, 0), TimeOfDay(9, 10));
    info(file, bikeRideMeeting);
    writeln;
}

void info(File file, double number) {
    file.write("Floating point: ", number);
}

void info(File file, int number) {
    file.write("Integer       : ", number);
}

void info(File file, string str) {
    file.write("String        : ", str);
}

void info(File file, TimeOfDay time) {
    file.writef("TimeOfDay     : %02s:%02s", time.hour, time.minute);
}

void info(File file, Meeting meeting) {
    file.info(meeting.start);
    file.write('-');
    info(file, meeting.end);
    file.writefln(" \"%s\" meeting with %s attendees",
        meeting.topic,
        meeting.attendanceCount);
}

struct TimeOfDay {
    int hour;
    int minute;
}

struct Meeting {
    string topic;
    size_t attendanceCount;
    TimeOfDay start;
    TimeOfDay end;
}
