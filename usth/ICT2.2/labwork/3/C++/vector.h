class Vector
{
public:
  int x;
  int y;

  Vector (int ex, int why) : x {ex}, y {why} {}
  Vector () : x {0}, y{0} {}

  Vector& operator+= (Vector v) { x += v.x, y += v.y; return *this; }
  Vector& operator-= (Vector v) { x -= v.x, y -= v.y; return *this; }
  Vector& operator*= (Vector v) { x *= v.x, y *= v.y; return *this; }
};

Vector operator+ (Vector, Vector);
Vector operator- (Vector, Vector);
Vector operator* (Vector, Vector);
