import std.stdio : writeln;

void main()
{

}

class BankAccount {

}

void transferMoney(shared BankAccount from,	shared BankAccount to)
{
	synchronized (from)		// ← INCORRECT
	{ 
		synchronized (to)
		{
			// ...
		}
	}
}
