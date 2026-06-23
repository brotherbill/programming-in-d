import std.stdio : writeln;

// Using Counter instead of Duration, as Duration has minutes member, but also uses hours, 
// so could be confusing of ++Duration meaning increment by 1 minute or by 1 hour
// 
// Internally, Counter is equivalent to Duration for this exercise

void main()
{
	// Braces syntax is used to initialize the count member of Counter, which is a struct.
	// In general, avoid using braces syntax to initialize structs, as it can lead to confusion and errors, 
	//  especially when the struct has multiple members.	
	Counter counter1 = {42};

	Counter counter2 = -counter1;
	writeln("counter1 unary - : ", counter1.count, ",  counter2 = ", counter2.count);

	Counter counter3 = +counter2;
	writeln("counter2 unary + : ", counter2.count, ", counter3 = ", counter3.count);

	Counter counter4 = ~counter3;
	writeln("counter3 unary ~ : ", counter3.count, ", counter4 =  ", counter4.count);

	Counter* ptrCounter4 = &counter4;
	writeln("counter4 unary * : ", counter4.count, ",  ptrCounter4 = ", ptrCounter4.count);

	Counter preIncrement = {100};
	Counter result = ++preIncrement;
	writeln("preIncrement: ", preIncrement.count, ",   result: ", result.count);

	Counter postIncrement = {100};
	Counter result2 = postIncrement++;
	writeln("postIncrement: ", postIncrement.count, ", result2: ", result2.count);

	Counter preDecrement = {100};
	Counter result3 = --preDecrement;
	writeln("preDecrement: ", preDecrement.count, ",   result3:  ", result3.count);

	Counter postDecrement = {100};
	Counter result4 = postDecrement--;
	writeln("postDecrement: ", postDecrement.count, ",  result4: ", result4.count);
}

struct Counter
{
	int count;

	// -, +, ~ and * could be combined into one function using mixin

	// negative of (numeric complement of)
	Counter opUnary(string op)() const pure if (op == "-")
	{
		Counter result = this;
		result.count = -this.count;
		return result;
	}

	// the same value as (or, a copy of)
	Counter opUnary(string op)() const if (op == "+")
	{
		Counter result = this;
		result.count = +this.count;
		return result;
	}

	// bitwise negation
	Counter opUnary(string op)() const if (op == "~")
	{
		Counter result = this;
		result.count = ~this.count;
		return result;
	}

	// access what it points to
	Counter opUnary(string op)() const if (op == "*")
	{
		Counter result = this;
		result.count = *this.count;
		return result;
	}

	// pre-increment and post-increment
	ref Counter opUnary(string op)() if (op == "++" || op == "--")
	{
		mixin(op ~ "count;"); // ++count; or --count;  Evaluated at compile time
		return this;
	}
}
