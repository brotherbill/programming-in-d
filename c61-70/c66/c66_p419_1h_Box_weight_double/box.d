module box;

class Box
{
private:

    double weight_;

public:
    // Constructor usually needs to be public
    this(double weight)
    {
        this.weight_ = weight;
    }

    double weight() const
    {
        return weight_;
    }
}
