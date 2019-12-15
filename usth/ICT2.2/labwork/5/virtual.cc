#include <cmath>
#include <iostream>
#include <memory>
#include <string>
#include <vector>

using namespace std;

static constexpr double PI = acos (-1.0);

class Shape
{
public:
  virtual string get_name () const = 0;

  virtual double cal_area () const { return 0.0; }
  virtual double cal_vol () const { return 0.0; }
};

class Point : public Shape
{
public:
  double x, y;
  Point (double a, double b) : x {a}, y {b} {}

  string get_name () const override { return "Point"; }
};

class Circle : public Shape
{
public:
  double x, y, r;
  Circle (double a, double b, double c) : x {a}, y {b}, r {c} {}

  string get_name () const override { return "Circle"; }
  double cal_area () const override { return r * r * PI; }
};

class Cylinder : public Shape
{
public:
  double x, y, r, h;
  Cylinder (double a, double b, double c, double d)
    : x {a}, y {b}, r {c}, h {d} {}

  string get_name () const override { return "Cylinder"; }
  double cal_area () const override { return (r + h) * r * PI * 2.0; }
  double cal_vol () const override { return r * r * h * PI; }
};

int
main ()
{
  vector<unique_ptr<Shape>> v;
  v.push_back (make_unique<Point> (1.0, 2.0));
  v.push_back (make_unique<Circle> (3.0, 4.0, 5.0));
  v.push_back (make_unique<Cylinder> (6.0, 7.0, 8.0, 9.0));
  for (auto& p : v)
    cout << p->get_name () << " of area " << p->cal_area ()
         << " and volume " << p->cal_vol () << endl;
}
