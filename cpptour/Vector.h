class Vector {
public:
  Vector (int s);
  double& operator[] (int i);
  int size () noexcept;
private:
  double* elem;
  int sz;
};
