import std.stdio : writeln;

void main()
{
    auto student1 = Student(1, [70, 90, 85]);

    auto student2 = student1; // copy construction
    student2.number = 2;

    student1.grades[0] += 5; // this changes the grade of the second student as well

    assert(student1.grades[0] == 75);
    assert(student2.grades[0] == 70);
}

struct Student
{
    int   number;   // value type
    int[] grades;   // reference type

    // Copy constructor is ignored when Postblit exists
    this(ref inout(typeof(this)) that)
    {
        writeln("ref inout");
        this.number = that.number;
        this.grades = that.grades.dup;
    }

    // Postblit.  Legacy.  Do not use.  Takes precedence over copy constructor
    this(this)
    {
        // 'number' and 'grades' are already copied at this point.
        // we just need to make copies of the elements
        writeln("postblit - do not use.");
        grades = grades.dup;
    }
}
