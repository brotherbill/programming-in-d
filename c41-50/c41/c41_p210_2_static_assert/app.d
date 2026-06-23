void main()
{
	enum dstring menuTitle = "Command Menu";
	static assert(menuTitle.length <= 16);

	enum dstring menuTitle2 = "Directional Commands Menu";
	static assert(menuTitle2.length <= 16, "command item must fit within 16 characters");
}
