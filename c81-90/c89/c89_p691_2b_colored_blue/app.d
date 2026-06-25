import std.stdio     : writefln;
import std.string    : format;
import std.algorithm : map, equal;
import std.conv      : to;
import std.traits    : hasUDA;

void main()
{
	 printAsXML(Data("hello world"));
}

struct Data
{
	@Colored(Color.blue) string message;
}

// Specifies that the symbol that it is assigned to should be encrypted.
struct Encrypted
{
}

enum Color
{
	black,
	blue,
	red
}

// Specifies the color of the symbol that it is assigned to.
// The default color is Color.black.
struct Colored
{
	Color color;
}

struct Person
{
	@Encrypted
	{
		string name;
		string lastName;
		string address;
	}
}

// Returns the value of the Colored attribute if the specified
// member has that attribute, Color.black otherwise.
Color colorAttributeOf(T, string memberName)()
{
	auto result = Color.black;
	foreach (attr; __traits(getAttributes, __traits(getMember, T, memberName)))
	{
		static if (is(typeof(attr) == Colored))
		{
			result = attr.color;
		}
	}
	return result;
}

// Returns the Caesar-encrypted version of the specified string.
//   (Warning: Caesar cipher is a very weak encryption method.)
auto encrypted(string value)
{
	return value.map!(a => dchar(a + 1));
}

unittest
{
	assert("abcdefghij".encrypted.equal("bcdefghijk"));
}

// Prints the specified object in XML format according to the
// attributes of its members.
void printAsXML(T)(T object)
{
	writefln("<%s>", T.stringof);
	scope (exit)
		writefln("</%s>", T.stringof);

	foreach (member; __traits(allMembers, T))
	{
		string value = __traits(getMember, object, member).to!string;
		static if (hasUDA!(__traits(getMember, T, member), Encrypted))
		{
			value = value.encrypted.to!string;
		}

		writefln(`  <%1$s color="%2$s">%3$s</%1$s>`,
			member, colorAttributeOf!(T, member), value);
	}
}
