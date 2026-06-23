import std.stdio : writeln;

void main()
{
    auto defaultTest = Test();  // Parentheses are required
    writeln("defaultTest: ", defaultTest);
    
    auto test = Test('X');
    writeln("test:        ", test);
    writeln;

    auto defaultTestNoDefaultParams = TestNoDefaultParameters.make_default;     // snake_case
    writeln("defaultTestNoDefaultParams: ", defaultTestNoDefaultParams);

    auto testNoDefaultParams_c = TestNoDefaultParameters.makeC('Y');            // camelCase    
    writeln("testNoDefaultParams_c:      ", testNoDefaultParams_c);  
}

struct Test
{
    char   c;
    int    i;
    double d;

    // Can't have ALL parameters having defaults.  At least one must be non-default.
    this(in char   c, 
         in int    i = int.init, 
         in double d = double.init)
    {
        this.c = c;
        this.i = i;
        this.d = d;
    }
}

struct TestNoDefaultParameters
{
    char   c;
    int    i;
    double d;

    // Has all parameters
    this(in char   c, 
         in int    i, 
         in double d)
    {
        this.c = c;
        this.i = i;
        this.d = d;
    }

    // double parameter is missing
    this(in char   c, 
         in int    i)
    {
        this.c = c;
        this.i = i;
        this.d = double.init;
    }

    // int and double parameters are missing
    this(in char   c)
    {
        this.c = c;
        this.i = int.init;
        this.d = double.init;
    }

    // ALL parameters are missing.  Can't create this without at least one non-default parameter.
    /+
    this()
    {
        this.c = char.init;
        this.i = int.init;;
        this.d = double.init;
    }
    +/

    // Factory methods to create with various parameters.  snake_case naming convention.
    static TestNoDefaultParameters make_c_i_d(in char c, in int i, in double d)
    {
        return TestNoDefaultParameters(c, i, d);
    }

    static TestNoDefaultParameters make_c_i(in char c, in int i)
    {
        return TestNoDefaultParameters(c, i, double.init);
    }

    static TestNoDefaultParameters make_c(in char c)
    {
        return TestNoDefaultParameters(c, int.init, double.init);
    }

    // Factory method to create with all default values
    static TestNoDefaultParameters make_default()
    {
        return TestNoDefaultParameters(char.init, int.init, double.init);
    }

    // Factory methods to create with various parameters.  camelCase naming convention.
    static TestNoDefaultParameters makeCID(in char c, in int i, in double d)
    {
        return TestNoDefaultParameters(c, i, d);
    }

    static TestNoDefaultParameters makeCI(in char c, in int i)
    {
        return TestNoDefaultParameters(c, i, double.init);
    }

    static TestNoDefaultParameters makeC(in char c)
    {
        return TestNoDefaultParameters(c, int.init, double.init);
    }

    // Factory method to create with all default values
    static TestNoDefaultParameters makeDefault()
    {
        return TestNoDefaultParameters(char.init, int.init, double.init);
    }
}
