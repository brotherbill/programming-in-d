module app; // the name of this module (file without .d extension)

import animal.cat, animal.dog; // a module that it uses animal.cat and animal.dog modules

void main()
{
    auto cat = new Cat("Morris");
    auto dog = new Dog("Fido");
}
