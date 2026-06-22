import std.stdio;

void main()
{
	print42ManyWays; 
	writeln;

	printStudentsEnglishOnly;
	writeln;

	printStudentsEnglishOrTurkishWrong("en");
	printStudentsEnglishOrTurkishWrong("tr");
	writeln;

	printStudentsEnglishOrTurkishRight("en");
	printStudentsEnglishOrTurkishRight("tr");
	writeln;
}

void print42ManyWays()
{
	writefln("print42ManyWays:                    Dec: %1$d, Hex: %1$x, Oct: %1$o, Bin: %1$b", 42);
}

void printStudentsEnglishOnly()
{
	int count = 30;
	string room = "5G";

	writefln("printStudentsEnglishOnly:           There are %s students in room %s.", count, room);
}

void printStudentsEnglishOrTurkishWrong(string language)
{
	int count = 20;
	string room = "1A";

	auto format = (language == "en" ? "printStudentsEnglishOrTurkishWrong: There are %s students in room %s."
			: "printStudentsEnglishOrTurkishWrong: %s sınıfında %s öğrenci var.");
	writefln(format, count, room);
}

void printStudentsEnglishOrTurkishRight(string language)
{
	int count = 20;
	string room = "1A";

	auto format = (language == "en" ? "printStudentsEnglishOrTurkishRight: There are %1$s students in room %2$s."
			: "printStudentsEnglishOrTurkishRight: %2$s sınıfında %1$s öğrenci var.");
	writefln(format, count, room);
}
