void main()
{
	import animal.cat;

	auto fluffy    = new Cat("Fluffy");
	auto garfield  = new animal.cat.Cat("Garfield, the Lasagna eating cat");
	auto garfield2 = new animal.Cat("Garfield, the Lasagna eating cat 2");
	auto garfield3 = new cat.Cat("Garfield, the Lasagna eating cat 3");
	auto hobbes    = new Cat("Hobbes Tiger from Calvin and Hobbes");
}
