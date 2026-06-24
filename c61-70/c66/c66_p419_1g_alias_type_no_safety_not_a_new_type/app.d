import std.stdio;

alias CustomerNumber = int;
alias CompanyName    = string;

void main()
{
	int      i    = 42;
	string   s    = "Anne's Art Supplies";
	Customer anne = Customer(i, s);
	assert(anne.customerNumber == 42);  // CustomerNumber is just an int

	CustomerNumber i2  = 999;
	CompanyName    s2  = "Bob's Burgers";
	Customer       bob = Customer(i2, s2);

	writeln("anne:", anne);
	writeln("bob:",  bob);
}

struct Customer
{
	CustomerNumber customerNumber;
	CompanyName    companyName;
}
