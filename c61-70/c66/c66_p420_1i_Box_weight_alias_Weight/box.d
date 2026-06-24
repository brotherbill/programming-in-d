module box;

class Box
{
private:

    Weight weight_;

public:
    alias Weight = double;

    // Constructor usually needs to be public
    this(Weight weight)
    {
        this.weight_ = weight;
    }

    Weight weight() const
    {
        return weight_;
    }
}
