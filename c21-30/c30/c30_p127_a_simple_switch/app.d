import std.stdio : write, writeln;

void main()
{
	test_integer;
	test_character;
	test_boolean;
	test_string;
}

void test_integer() 
{
	write("Test integer   switch: ");
	int day = 3;

	switch (day)
	{
		case 1:
			writeln("Moon day");
			break;
		case 2:
			writeln("Taco two's day");
			break;
		case 3:
			writeln("Hump day");
			break;
		case 4:
			writeln("Thor's day");
			break;
		case 5:
			writeln("Fry day");
			break;
		case 6:
		case 7:
			writeln("Weekend!");
			break;
		default:
			writeln("Beatles: 8 days a week");
			// break; is optional here
	}
}

void test_character() 
{
	write("Test character switch: ");

	char grade = 'B';

	switch (grade)
	{
		case 'A':
			writeln("Excellent!");
			break;
		case 'B':
			writeln("Well done");
			break;
		case 'C':
			writeln("Good");
			break;
		case 'D':
			writeln("You passed");
			break;
		case 'F':
			writeln("Better try again");
			break;
		default:
			writeln("Invalid grade");
	}
}

void test_boolean() 
{
	write("Test boolean   switch: ");

	bool isRaining = true;

	final switch (isRaining)
	{
		case true:
			writeln("Take an umbrella.");
			break;
		case false:
			writeln("Enjoy the sunshine!");
			break;
	}
}	

void test_string() 
{
	write("Test string    switch: ");

	string fruit = "Apple";

	switch (fruit)
	{
		case "Apple":
			writeln("An apple a day keeps the doctor away.");
			break;
		case "Banana":
			writeln("Bananas are high in potassium.");
			break;
		case "Durian":
			writeln("Durians are the king of fruits.");
			break;
		case "Orange":
			writeln("Oranges are a good source of vitamin C.");
			break;
		default:
			writeln("Unknown fruit.");
	}
}
