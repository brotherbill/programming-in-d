import std.stdio;

void main()
{
	writeln("   n = numerator");
	writeln("   d = denominator");
	writeln("   q = quotient");
	writeln("   r = remainder");
	writeln();
	writeln(" n /  d =  q   n %  d =  r     ( d *  q) +  r =  n");
	writeln("--------------------------------------------------");
	writeln(" 7 /  2 =  ", 7 / 2, "   7 %  2 =  ", 7 % 2, "     ( 2 *  3) +  1 =  ", ( 2 *  3) + 1);
	writeln(" 7 / -2 = ", 7 / -2, "   7 % -2 =  ", 7 % -2, "     (-2 * -3) +  1 =  ", (-2 * -3) + 1);
	writeln("-7 /  2 = ", -7 / 2, "  -7 %  2 = ", -7 % 2, "     ( 2 * -3) + -1 = ", ( 2 * -3) + -1);
	writeln("-7 / -2 =  ", -7 / -2, "  -7 % -2 = ", -7 % -2, "     (-2 *  3) + -1 = ", (-2 *  3) + -1);
}
