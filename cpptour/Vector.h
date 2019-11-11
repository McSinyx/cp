class Vector {
public:
  Vector (int s);
  Vector (std::initializer_list<double>);
  ~Vector ();
  double& operator[] (int i);
  int size () noexcept;
  void push_back (double);
private:
  double* elem;
  int sz;
};
