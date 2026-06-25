import std.stdio : writeln, writefln;

void main()
{
	string[] toConstruct = ["Cat", "Dog", "Cat"];
	Animal[] animals;

	foreach (typeName; toConstruct)
	{
		// The pseudo variable __MODULE__ is always the name of the current module, 
		// which can be used as a string literal at compile time.
		const fullName = __MODULE__ ~ '.' ~ typeName;
		writefln("Constructing %s", fullName);
		animals ~= cast(Animal) Object.factory(fullName);
	}
	
	foreach (animal; animals)
	{
		writeln(animal.sing());
	}
}

interface Animal
{
	string sing();
}

class Cat : Animal
{
	string sing()
	{
		return "meow";
	}
}

class Dog : Animal
{
	string sing()
	{
		return "woof";
	}
}
