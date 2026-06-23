import std.stdio : write, writefln, writeln, stdout;

enum _keySeparatorDefault     = ": ";
enum _elementSeparatorDefault = ", ";

void main()
{
    // funWithRuntimeDefaultArgumentsManyTestRuns;
    testDictionary;
}

void funWithRuntimeDefaultArgumentsManyTestRuns() 
{
    funWithRuntimeDefaultArgumentsTestRun;
    funWithRuntimeDefaultArgumentsTestRun(hasArg1: true);
    funWithRuntimeDefaultArgumentsTestRun(hasArg2: true);
    funWithRuntimeDefaultArgumentsTestRun(hasArg1: true, hasArg2: true);
}

void funWithRuntimeDefaultArgumentsTestRun(bool hasArg1 = false, bool hasArg2 = false) 
{
    import std.range: iota;

    writefln("--- hasArg1(%s) hasArg2(%s) ---", hasArg1, hasArg2);
    foreach (i; iota(2)) 
	{
        if ( hasArg1 &&  hasArg2) funWithRuntimeDefaultArguments(i, arg1: 1, arg2: 2).writeln;
        if ( hasArg1 && !hasArg2) funWithRuntimeDefaultArguments(i, arg1: 1         ).writeln;
        if (!hasArg1 &&  hasArg2) funWithRuntimeDefaultArguments(i,          arg2: 2).writeln;
        if (!hasArg1 && !hasArg2) funWithRuntimeDefaultArguments(i                  ).writeln;
	}
    writeln;
}

import std.random : uniform;  // Scope is from here to the end of the file

string funWithRuntimeDefaultArguments(int testId, int arg1 = uniform(1, 100), int arg2 = uniform(1, 100))
{
    import std.string : format;

    return format("%s: arg1(%d)  arg2(%d)", testId, arg1, arg2);
}

void testDictionary() 
{
    string[string] dictionary = [ "blue": "mavi", "red": "kırmızı", "gray": "gri" ];

    printAA_with_defaultKeySeparator_and_defaultElementSeparator("Color Dictionary default keySeparator, default elementSeparator", dictionary);
    printAA("Color Dictionary default keySeparator is colon, default elementSeparator is comma", dictionary);
    writeln; 

    printAA_with_explicitKeySeparator_and_defaultElementSeparator("Color Dictionary explicit keySeparator, default elementSeparator", dictionary, "=");
    printAA("Color Dictionary explicit keySeparator is colon, default elementSeparator is comma", dictionary, "=");
    writeln; 

    printAA_with_defaultKeySeparator_and_explicitElementSeparator("Color Dictionary default keySeparator, explicit elementSeparator", dictionary, "\n"); 
    printAA("Color Dictionary defaultKeySeparator, explicit elementSeparator", dictionary, elementSeparator: "\n");   // Using named parameter of elementSeparator
    writeln; 

    printAA_with_explicitKeySeparator_and_explicitElementSeparator("Color Dictionary explicit keySeparator, explicit elementSeparator", dictionary, "=", "\n");
    printAA("Color Dictionary explicit keySeparator is equal, explicit elementSeparator is newline", dictionary, keySeparator: "=", elementSeparator: "\n");
}

void printAA(string title, string[string] aa, string keySeparator = _keySeparatorDefault, string elementSeparator = _elementSeparatorDefault) 
{
    printAA_with_explicitKeySeparator_and_explicitElementSeparator(title, aa, keySeparator, elementSeparator);
}

void printAA_with_explicitKeySeparator_and_defaultElementSeparator(string title, string[string] aa, string keySeparator) 
{
    printAA_with_explicitKeySeparator_and_explicitElementSeparator(title, aa, keySeparator, _elementSeparatorDefault);
}

void printAA_with_defaultKeySeparator_and_defaultElementSeparator(string title, string[string] aa) 
{
    printAA_with_explicitKeySeparator_and_explicitElementSeparator(title, aa, _keySeparatorDefault, _elementSeparatorDefault);
}

void printAA_with_defaultKeySeparator_and_explicitElementSeparator(string title, string[string] aa, string elementSeparator) 
{
    printAA_with_explicitKeySeparator_and_explicitElementSeparator(title, aa, _keySeparatorDefault, elementSeparator);
}

void printAA_with_explicitKeySeparator_and_explicitElementSeparator(string title, string[string] aa, string keySeparator, string elementSeparator) 
{
    import std.algorithm : sort;

    writeln(__LINE__, " -- ", title, " --");
    auto keys = sort(aa.keys);

    // Don't print element separator before the first element
    if (keys.length != 0)
    {
        auto key = keys[0];
        write(__LINE__, " ", key, keySeparator, aa[key]);  stdout.flush;
        keys = keys[1 .. $]; // Remove the first element
    }

    // Print element separator before the remaining elements
    foreach (key; keys)
    {
        write(elementSeparator); stdout.flush;
        write(key, keySeparator, aa[key]); stdout.flush;
    }

    writeln();
}
