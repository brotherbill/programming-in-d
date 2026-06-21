import std.stdio;

void main()
{
    bool existsCoffee   = false;
    bool existsBicycle  = false;
    bool neighborIsHome = false;

    if (existsCoffee)
    {
        writeln("Drink coffee at home");
    }
    else
    {
        if (existsBicycle)
        {
            writeln("Ride to the good place");
        }
        else if (neighborIsHome)
        {
            writeln("Have coffee at neighbor's");
        }
        else
        {
            writeln("Walk to the bad place");
        }
    }
}
