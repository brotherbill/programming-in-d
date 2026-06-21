import std.stdio : writeln;

void main()
{
	bytePlus("byte");
	ubytePlus("ubyte");
	shortPlus("short");
	ushortPlus("ushort");
	intPlus("int");
	uintPlus("uint");
	longPlus("long");
	ulongPlus("ulong");
}

byte   s8;
ubyte  u8;
short  s16;
ushort u16;
int    s32;
uint   u32;
long   s64;
ulong  u64;

void bytePlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln("   byte : ", typeof(s8 + s8).stringof);
	writeln("  ubyte : ", typeof(s8 + u8).stringof);
	writeln("  short : ", typeof(s8 + s16).stringof);
	writeln(" ushort : ", typeof(s8 + u16).stringof);
	writeln("    int : ", typeof(s8 + s32).stringof);
	writeln("   uint : ", typeof(s8 + u32).stringof);
	writeln("   long : ", typeof(s8 + s64).stringof);
	writeln("  ulong : ", typeof(s8 + u64).stringof);
	writeln();
}

void ubytePlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln("  ubyte : ", typeof(u8 + u8).stringof);
	writeln("  short : ", typeof(u8 + s16).stringof);
	writeln(" ushort : ", typeof(u8 + u16).stringof);
	writeln("    int : ", typeof(u8 + s32).stringof);
	writeln("   uint : ", typeof(u8 + u32).stringof);
	writeln("   long : ", typeof(u8 + s64).stringof);
	writeln("  ulong : ", typeof(u8 + u64).stringof);
	writeln();
}

void shortPlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln("  short : ", typeof(s16 + s16).stringof);
	writeln(" ushort : ", typeof(s16 + u16).stringof);
	writeln("    int : ", typeof(s16 + s32).stringof);
	writeln("   uint : ", typeof(s16 + u32).stringof);
	writeln("   long : ", typeof(s16 + s64).stringof);
	writeln("  ulong : ", typeof(s16 + u64).stringof);
	writeln;
}

void ushortPlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln(" ushort : ", typeof(u16 + u16).stringof);
	writeln("    int : ", typeof(u16 + s32).stringof);
	writeln("   uint : ", typeof(u16 + u32).stringof);
	writeln("   long : ", typeof(u16 + s64).stringof);
	writeln("  ulong : ", typeof(u16 + u64).stringof);
	writeln();
}

void intPlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln("    int : ", typeof(s32 + s32).stringof);
	writeln("   uint : ", typeof(s32 + u32).stringof);
	writeln("   long : ", typeof(s32 + s64).stringof);
	writeln("  ulong : ", typeof(s32 + u64).stringof);
	writeln;
}

void uintPlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln("   uint : ", typeof(u32 + u32).stringof);
	writeln("   long : ", typeof(u32 + s64).stringof);
	writeln("  ulong : ", typeof(u32 + u64).stringof);
	writeln();
}

void longPlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln("   long : ", typeof(s64 + s64).stringof);
	writeln("  ulong : ", typeof(s64 + u64).stringof);
	writeln();
}

void ulongPlus(string title)
{
	writeln("--- ", title, " arithmetic ---");
	writeln("  ulong : ", typeof(s64 + u64).stringof);
	writeln();
}
