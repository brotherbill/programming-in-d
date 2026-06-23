module app; // the name of this module (file without .d extension)

import animal.cat; // a module that it uses
import animal.dog; // another module that it uses

void main()
{
	auto cat = new Cat("Morris");
	auto dog = new Dog("Fido");
}
