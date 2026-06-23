import std.stdio : writeln;

void main()
{
	double energy = 100;

	writeln(" 7 main()           energy before: ", energy);
	reduceEnergy(/* ref */ energy);
	writeln(" 9 main()           energy after :  ", energy);

	float energyF = 200;
	// reduceEnergy(energyF);	// won't compile.  type has to exactly match.  float != double

	double newEnergy = 1_000;
	double reducedEnergy = reducedEnergyFunctionalStyle(newEnergy);
	writeln("16 main()        newEnergy after : ", newEnergy, ", reducedEnergy: ", reducedEnergy);
}

private double reduceEnergy_old_aEnergy;
void reduceEnergy(ref double aEnergy)
in(aEnergy >= 0)
out(; aEnergy == reduceEnergy_old_aEnergy / 4)
do
{
	reduceEnergy_old_aEnergy = aEnergy;	// store old value for postcondition check

	writeln("27 reduceEnergy()  aEnergy before: ", aEnergy);
	aEnergy /= 4;
	writeln("29 reduceEnergy()  aEnergy after :  ", aEnergy);
}

private double reducedEnergyFunctionalStyle_old_aEnergy;
double reducedEnergyFunctionalStyle(double aEnergy)
in(aEnergy >= 0)
out(result; result == reducedEnergyFunctionalStyle_old_aEnergy / 4)
do
{
	reducedEnergyFunctionalStyle_old_aEnergy = aEnergy;  // store old value for postcondition check

	return aEnergy / 4;
}
