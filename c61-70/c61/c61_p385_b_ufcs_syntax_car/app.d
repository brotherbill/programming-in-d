import std.stdio;
import car;

void main()
{
   auto car = new Car(5);

   auto remainingFuel = car.fuel(); // Member function syntax

   if (car.canTravel(100))          // Regular function, called by the member function syntax
   { 
      // ...
   }
}
