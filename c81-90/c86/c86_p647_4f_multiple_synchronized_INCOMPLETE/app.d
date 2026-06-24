import std.stdio;

void main()
{

}

class BankAccount
{

}

void transferMoney(shared BankAccount from,	shared BankAccount to)
{
	// This is bad because it can lead to deadlock
	// Consider transferring money from A to B and from B to A at the same time
	{ // ← correct
		// ...
	}
}
