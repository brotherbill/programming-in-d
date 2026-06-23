void main()
{
    auto bob   = new Student("Bob");
    auto cathy = new Student("Cathy");

    assert(bob < cathy);
}

class Student
{
    string name;

    this(string name)
    {
        this.name = name;
    }

    override int opCmp(Object o) const
    {
        import std.exception : enforce;
        import std.algorithm : cmp;

        auto rhs = cast(Student) o;
        enforce(rhs);

        return cmp(name, rhs.name);
    }
    // ...
}
