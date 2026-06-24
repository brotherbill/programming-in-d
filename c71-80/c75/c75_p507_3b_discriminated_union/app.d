import std.stdio : writeln;
import std.exception;

void main()
{
	Discriminated discriminated = Discriminated(3.14);
	writeln(discriminated.d);
	writeln(discriminated.i);
}

struct Discriminated
{
private:
	TypeInfo validType_;
	union
	{
		int    i_;
		double d_;
	}

public:
	this(int value)
	{
		// This is a call to the property function below:
		i = value;
	}

	// Setter for 'int' data
	void i(int value)
	{
		i_         = value;
		validType_ = typeid(int);
	}

	// Getter for 'int' data
	int i() const
	{
		enforce(validType_ == typeid(int), "The data is not an 'int'.");
		return i_;
	}

	this(double value)
	{
		// This is a call to the property function below:
		d = value;
	}

	// Setter for 'double' data
	void d(double value)
	{
		d_ = value;
		validType_ = typeid(double);
	}

	// Getter for 'double' data
	double d() const
	{
		enforce(validType_ == typeid(double), "The data is not a 'double'.");
		return d_;
	}

	// Identifies the type of the valid data
	const(TypeInfo) type() const
	{
		return validType_;
	}
}

unittest
{
	// Let's start with 'int' data
	auto var = Discriminated(42);

	// The type should be reported as 'int'
	assert(var.type == typeid(int));

	// 'int' getter should work
	assert(var.i == 42);

	// 'double' getter should fail
	assertThrown(var.d);

	// Let's replace 'int' with 'double' data
	var.d = 1.5;

	// The type should be reported as 'double'
	assert(var.type == typeid(double));

	// Now 'double' getter should work ...
	assert(var.d == 1.5);

	// ... and 'int' getter should fail
	assertThrown(var.i);
}
