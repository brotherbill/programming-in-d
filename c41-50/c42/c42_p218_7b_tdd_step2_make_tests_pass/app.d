import std.string : format;

void main()
{
}

string ordinal(size_t number)
{
	string suffix;
	
	switch (number)
	{
	case 1:
		suffix = "st";
		break;
	case 2:
		suffix = "nd";
		break;
	case 3:
		suffix = "rd";
		break;
	default:
		suffix = "th";
		break;
	}

	return format("%s%s", number, suffix);
}

unittest
{
	assert(ordinal(1)  == "1st");
	assert(ordinal(2)  == "2nd");
	assert(ordinal(3)  == "3rd");
	assert(ordinal(10) == "10th");
}
